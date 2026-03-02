// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:root_hub_client/root_hub_client.dart';

class AnalyticsDashboardPage extends StatefulComponent {
  const AnalyticsDashboardPage({super.key});

  @override
  State<AnalyticsDashboardPage> createState() => _AnalyticsDashboardPageState();
}

class _AnalyticsDashboardPageState extends State<AnalyticsDashboardPage> {
  Client? _client;
  late final ServerSupportedTranslation _language;

  StreamSubscription<html.Event>? _resizeSubscription;

  bool _isApiConfigLoading = true;
  String _typedPassword = '';
  String? _memoryPassword;
  bool _isAuthenticating = false;
  bool _isLoadingPage = false;
  String? _errorMessage;
  WebAnalyticsDashboard? _dashboard;
  int _mobileTabIndex = 0;

  @override
  void initState() {
    super.initState();

    _language = _resolveLanguage();
    _bootstrapClient();

    html.document.title = 'Root Hub | Analytics';

    _resizeSubscription = html.window.onResize.listen((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _resizeSubscription?.cancel();
    super.dispose();
  }

  bool get _isMobileLayout => (html.window.innerWidth ?? 1200) < 900;

  ServerSupportedTranslation _resolveLanguage() {
    final lower = html.window.navigator.language.toLowerCase();

    if (lower.startsWith('pt')) {
      return ServerSupportedTranslation.portugueseBrazil;
    }
    if (lower.startsWith('es')) {
      return ServerSupportedTranslation.spanish;
    }
    if (lower.startsWith('fr')) {
      return ServerSupportedTranslation.french;
    }
    if (lower.startsWith('de')) {
      return ServerSupportedTranslation.german;
    }

    return ServerSupportedTranslation.english;
  }

  Future<void> _bootstrapClient() async {
    final apiHost = await _resolveApiHost();

    if (!mounted) {
      return;
    }

    setState(() {
      _client = Client(apiHost);
      _isApiConfigLoading = false;
    });
  }

  Future<String> _resolveApiHost() async {
    try {
      final response = await html.HttpRequest.request(
        '/join/config.json',
        method: 'GET',
        requestHeaders: <String, String>{'Accept': 'application/json'},
      );

      if (response.status == 200) {
        final responseText = response.responseText;
        if (responseText != null && responseText.isNotEmpty) {
          final decoded = jsonDecode(responseText);
          if (decoded is Map<String, dynamic>) {
            final apiUrl = decoded['apiUrl'];
            if (apiUrl is String && apiUrl.trim().isNotEmpty) {
              return apiUrl.trim();
            }
          }
        }
      }
    } catch (_) {
      // Fallback handled below.
    }

    final baseHost = Uri.base.host.toLowerCase();
    if (baseHost == 'localhost' || baseHost == '127.0.0.1') {
      return 'http://localhost:8080/';
    }

    return 'https://roothub.api.serverpod.space/';
  }

  Future<void> _authenticate() async {
    final password = _typedPassword.trim();
    if (password.isEmpty || _isAuthenticating || _isApiConfigLoading) {
      return;
    }

    setState(() {
      _isAuthenticating = true;
      _errorMessage = null;
    });

    final dashboard = await _loadDashboard(password: password, page: 1);

    setState(() {
      _isAuthenticating = false;
      if (dashboard == null || !dashboard.isAuthorized) {
        _memoryPassword = null;
        _dashboard = null;
        _errorMessage = 'Senha invalida ou dados indisponiveis. Tente novamente.';
        return;
      }

      _memoryPassword = password;
      _dashboard = dashboard;
      _errorMessage = null;
      _mobileTabIndex = 0;
    });
  }

  Future<void> _goToPage(int page) async {
    final password = _memoryPassword;
    if (password == null || password.isEmpty || _isLoadingPage) {
      return;
    }

    setState(() {
      _isLoadingPage = true;
      _errorMessage = null;
    });

    final dashboard = await _loadDashboard(password: password, page: page);

    setState(() {
      _isLoadingPage = false;

      if (dashboard == null || !dashboard.isAuthorized) {
        _memoryPassword = null;
        _dashboard = null;
        _typedPassword = '';
        _errorMessage = 'Sua sessao expirou. Digite a senha novamente para continuar.';
        return;
      }

      _dashboard = dashboard;
    });
  }

  Future<WebAnalyticsDashboard?> _loadDashboard({
    required String password,
    required int page,
  }) async {
    final client = _client;
    if (client == null) {
      return null;
    }

    try {
      return await client.getWebAnalyticsDashboard.v1(
        language: _language,
        password: password,
        page: page,
      );
    } catch (_) {
      return null;
    }
  }

  String _formatDateTime(DateTime value) {
    final local = value.toLocal();
    final y = local.year.toString().padLeft(4, '0');
    final m = local.month.toString().padLeft(2, '0');
    final d = local.day.toString().padLeft(2, '0');
    final h = local.hour.toString().padLeft(2, '0');
    final min = local.minute.toString().padLeft(2, '0');

    return '$y-$m-$d $h:$min';
  }

  List<Component> _summaryCards(WebAnalyticsDashboard dashboard) {
    final metadata = dashboard.clicksPagination.paginationMetadata;

    return <Component>[
      _metricCard('Total clicks', dashboard.totalClicks.toString()),
      _metricCard('Countries', dashboard.uniqueCountries.toString()),
      _metricCard('Devices', dashboard.uniqueDevices.toString()),
      _metricCard(
        'Page',
        '${metadata.currentPage}/${metadata.totalPagesCount == 0 ? 1 : metadata.totalPagesCount}',
      ),
    ];
  }

  Component _metricCard(String title, String value) {
    return div(classes: 'analytics-metric-card', [
      p(classes: 'analytics-metric-title', [Component.text(title)]),
      p(classes: 'analytics-metric-value', [Component.text(value)]),
    ]);
  }

  Component _renderCountryChart(WebAnalyticsDashboard dashboard) {
    final metrics = dashboard.countryMetrics;
    final maxCount = _maxCount(metrics.map((metric) => metric.count));

    return div(classes: 'analytics-section-card', [
      h3(classes: 'analytics-section-title', [Component.text('Clicks per country')]),
      if (metrics.isEmpty)
        p(classes: 'analytics-empty', [
          Component.text('No country data yet.'),
        ])
      else
        div(classes: 'analytics-horizontal-bars', [
          ...metrics.map((metric) {
            final width = _normalizedPercent(
              value: metric.count,
              maxValue: maxCount,
            );
            return div(classes: 'analytics-horizontal-bar-row', [
              div(classes: 'analytics-horizontal-label', [
                Component.text('${metric.label} (${metric.count})'),
              ]),
              div(classes: 'analytics-horizontal-track', [
                div(
                  classes: 'analytics-horizontal-fill',
                  styles: Styles(raw: {'width': '$width%'}),
                  [],
                ),
              ]),
            ]);
          }),
        ]),
    ]);
  }

  Component _renderDeviceChart(WebAnalyticsDashboard dashboard) {
    final metrics = dashboard.deviceMetrics;
    final maxCount = _maxCount(metrics.map((metric) => metric.count));

    return div(classes: 'analytics-section-card', [
      h3(classes: 'analytics-section-title', [Component.text('Clicks per device')]),
      if (metrics.isEmpty)
        p(classes: 'analytics-empty', [
          Component.text('No device data yet.'),
        ])
      else
        div(classes: 'analytics-horizontal-bars', [
          ...metrics.map((metric) {
            final width = _normalizedPercent(
              value: metric.count,
              maxValue: maxCount,
            );
            return div(classes: 'analytics-horizontal-bar-row', [
              div(classes: 'analytics-horizontal-label', [
                Component.text('${metric.label} (${metric.count})'),
              ]),
              div(classes: 'analytics-horizontal-track', [
                div(
                  classes: 'analytics-horizontal-fill device',
                  styles: Styles(raw: {'width': '$width%'}),
                  [],
                ),
              ]),
            ]);
          }),
        ]),
    ]);
  }

  Component _renderTimelineChart(WebAnalyticsDashboard dashboard) {
    final timeline = dashboard.timeline;
    final maxCount = _maxCount(timeline.map((point) => point.count));

    return div(classes: 'analytics-section-card', [
      h3(classes: 'analytics-section-title', [
        Component.text('Last 7 days (hourly clicks)'),
      ]),
      if (timeline.isEmpty)
        p(classes: 'analytics-empty', [
          Component.text('No timeline data yet.'),
        ])
      else
        div(classes: 'analytics-timeline-chart', [
          ...timeline.map((point) {
            final height = _normalizedPercent(
              value: point.count,
              maxValue: maxCount,
            );
            final label = _formatDateTime(point.bucketStart);

            return div(classes: 'analytics-timeline-item', [
              div(classes: 'analytics-timeline-value', [
                Component.text(point.count.toString()),
              ]),
              div(
                classes: 'analytics-timeline-bar',
                styles: Styles(
                  raw: {'height': '${height < 6 ? 6 : height}%'},
                ),
                attributes: {'title': '$label (${point.count})'},
                [],
              ),
            ]);
          }),
        ]),
    ]);
  }

  Component _renderClicksTable(WebAnalyticsDashboard dashboard) {
    final clickPage = dashboard.clicksPagination;
    final metadata = clickPage.paginationMetadata;

    return div(classes: 'analytics-section-card', [
      h3(classes: 'analytics-section-title', [
        Component.text('Clicks list'),
      ]),
      if (clickPage.clicks.isEmpty)
        p(classes: 'analytics-empty', [
          Component.text('No click events yet.'),
        ])
      else
        div(classes: 'analytics-click-list', [
          ...clickPage.clicks.map((click) {
            final locationParts = <String>[];
            if (click.city != null && click.city!.isNotEmpty) {
              locationParts.add(click.city!);
            }
            if (click.countryName != null && click.countryName!.isNotEmpty) {
              locationParts.add(click.countryName!);
            }
            if (locationParts.isEmpty) {
              locationParts.add('Unknown location');
            }

            final subtitleParts = <String>[
              _formatDateTime(click.clickedAt),
              click.deviceType.name,
              locationParts.join(', '),
            ];

            if (click.matchId != null) {
              subtitleParts.add('match #${click.matchId}');
            }

            return div(classes: 'analytics-click-row', [
              p(classes: 'analytics-click-title', [
                Component.text(click.requestPath),
              ]),
              p(classes: 'analytics-click-subtitle', [
                Component.text(subtitleParts.join(' • ')),
              ]),
              if (click.browserName != null || click.osName != null)
                p(classes: 'analytics-click-meta', [
                  Component.text(
                    '${click.browserName ?? 'Unknown browser'} · ${click.osName ?? 'Unknown OS'}',
                  ),
                ]),
            ]);
          }),
        ]),
      div(classes: 'analytics-pagination-row', [
        button(
          classes: 'analytics-page-button',
          disabled: !metadata.hasPreviousPage || _isLoadingPage,
          onClick: () {
            _goToPage(metadata.currentPage - 1);
          },
          [Component.text('Previous')],
        ),
        p(classes: 'analytics-page-label', [
          Component.text(
            'Page ${metadata.currentPage} of ${metadata.totalPagesCount == 0 ? 1 : metadata.totalPagesCount}',
          ),
        ]),
        button(
          classes: 'analytics-page-button',
          disabled: !metadata.hasNextPage || _isLoadingPage,
          onClick: () {
            _goToPage(metadata.currentPage + 1);
          },
          [Component.text('Next')],
        ),
      ]),
    ]);
  }

  int _maxCount(Iterable<int> values) {
    var maxValue = 0;
    for (final value in values) {
      if (value > maxValue) {
        maxValue = value;
      }
    }
    return maxValue;
  }

  double _normalizedPercent({required int value, required int maxValue}) {
    if (maxValue <= 0) {
      return 0;
    }
    return (value / maxValue) * 100;
  }

  Component _renderAuthenticatedDashboard(WebAnalyticsDashboard dashboard) {
    final tabs = <String>['Summary', 'Charts', 'Clicks'];
    final sectionComponents = <Component>[
      div(classes: 'analytics-summary-grid', _summaryCards(dashboard)),
      div(classes: 'analytics-charts-grid', [
        _renderCountryChart(dashboard),
        _renderDeviceChart(dashboard),
        _renderTimelineChart(dashboard),
      ]),
      _renderClicksTable(dashboard),
    ];

    final showTabs = _isMobileLayout;
    final visibleSectionIndex = showTabs ? _mobileTabIndex : -1;

    return div(classes: 'analytics-dashboard-shell', [
      div(classes: 'analytics-dashboard-header', [
        h1(classes: 'analytics-dashboard-title', [
          Component.text('Root Hub Analytics'),
        ]),
        p(classes: 'analytics-dashboard-subtitle', [
          Component.text('Invite link access metrics and click history'),
        ]),
      ]),
      if (showTabs)
        div(classes: 'analytics-tab-row', [
          ...tabs.indexed.map((entry) {
            final (index, label) = entry;
            final isActive = index == _mobileTabIndex;

            return button(
              classes: isActive ? 'analytics-tab-button active' : 'analytics-tab-button',
              onClick: () {
                setState(() {
                  _mobileTabIndex = index;
                });
              },
              [Component.text(label)],
            );
          }),
        ]),
      if (_isLoadingPage)
        p(classes: 'analytics-loading-message', [
          Component.text('Loading analytics data...'),
        ]),
      if (!showTabs || visibleSectionIndex == 0) sectionComponents[0],
      if (!showTabs || visibleSectionIndex == 1) sectionComponents[1],
      if (!showTabs || visibleSectionIndex == 2) sectionComponents[2],
    ]);
  }

  Component _renderPasswordGate() {
    return div(classes: 'analytics-auth-screen', [
      div(classes: 'analytics-auth-card', [
        h1(classes: 'analytics-auth-title', [
          Component.text('Root Hub Analytics'),
        ]),
        p(classes: 'analytics-auth-subtitle', [
          Component.text('Digite a senha para visualizar os dados.'),
        ]),
        input<String>(
          type: InputType.password,
          value: _typedPassword,
          classes: 'analytics-password-input',
          attributes: {
            'placeholder': 'Senha',
            'autocomplete': 'off',
            'autocapitalize': 'off',
            'spellcheck': 'false',
          },
          onInput: (value) {
            setState(() {
              _typedPassword = value;
            });
          },
        ),
        button(
          classes: 'analytics-auth-button',
          disabled: _isAuthenticating || _isApiConfigLoading,
          onClick: _authenticate,
          [
            Component.text(
              _isApiConfigLoading
                  ? 'Carregando configuracoes...'
                  : _isAuthenticating
                  ? 'Verificando...'
                  : 'Entrar',
            ),
          ],
        ),
        if (_errorMessage != null)
          p(classes: 'analytics-auth-error', [
            Component.text(_errorMessage!),
          ]),
      ]),
    ]);
  }

  @override
  Component build(BuildContext context) {
    if (_dashboard == null || !_dashboard!.isAuthorized) {
      return _renderPasswordGate();
    }

    return _renderAuthenticatedDashboard(_dashboard!);
  }
}
