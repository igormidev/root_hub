// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:html' as html;

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class MatchRedirectPage extends StatefulComponent {
  const MatchRedirectPage({super.key});

  @override
  State<MatchRedirectPage> createState() => _MatchRedirectPageState();
}

class _MatchRedirectPageState extends State<MatchRedirectPage> {
  static const _defaultPlayStoreUrl = 'https://play.google.com/store/apps/details?id=com.root_hub_flutter';
  static const _defaultAppleStoreUrl = 'https://apps.apple.com/us/search?term=Root%20Hub';

  Timer? _storeFallbackTimer;
  StreamSubscription<html.Event>? _visibilitySubscription;

  late final Uri _uri;
  late final int? _matchId;
  late final String _location;
  late final String _day;
  late final String _hour;
  late final String _playStoreUrl;
  late final String _appleStoreUrl;
  late final bool _isAndroid;
  late final bool _isIos;
  late final bool _isMobile;
  late final _LandingCopy _copy;
  bool _isAutoOpening = false;

  @override
  void initState() {
    super.initState();
    _uri = Uri.base;

    final languageTag = _normalizeLanguageTag(html.window.navigator.language);
    _copy = _copyForLanguage(languageTag);
    html.document.title = _copy.pageTitle;

    _matchId = int.tryParse(_uri.queryParameters['matchId'] ?? '');
    _location = (_uri.queryParameters['location'] ?? '').trim();
    _day = (_uri.queryParameters['day'] ?? '').trim();
    _hour = (_uri.queryParameters['hour'] ?? '').trim();

    final playStoreParam = (_uri.queryParameters['playStore'] ?? '').trim();
    final appleStoreParam = (_uri.queryParameters['appleStore'] ?? '').trim();
    _playStoreUrl = playStoreParam.isEmpty ? _defaultPlayStoreUrl : playStoreParam;
    _appleStoreUrl = appleStoreParam.isEmpty ? _defaultAppleStoreUrl : appleStoreParam;

    final userAgent = html.window.navigator.userAgent.toLowerCase();
    _isAndroid = userAgent.contains('android');
    _isIos = userAgent.contains('iphone') || userAgent.contains('ipad') || userAgent.contains('ipod');
    _isMobile = _isAndroid || _isIos;

    if (_isMobile && _matchId != null) {
      _startAutoOpenFlow();
    }
  }

  @override
  void dispose() {
    _storeFallbackTimer?.cancel();
    _visibilitySubscription?.cancel();
    super.dispose();
  }

  void _startAutoOpenFlow() {
    setState(() {
      _isAutoOpening = true;
    });

    _visibilitySubscription = html.document.onVisibilityChange.listen((_) {
      if (html.document.hidden == true) {
        _storeFallbackTimer?.cancel();
      }
    });

    final appDeepLink = _buildAppDeepLink();
    if (appDeepLink != null) {
      html.window.location.assign(appDeepLink.toString());
    }

    _storeFallbackTimer = Timer(const Duration(milliseconds: 1400), () {
      html.window.location.assign(_preferredStoreUrl());
    });
  }

  Uri? _buildAppDeepLink() {
    final matchId = _matchId;
    if (matchId == null || matchId <= 0) {
      return null;
    }

    return Uri(
      scheme: 'roothub',
      host: 'join',
      queryParameters: <String, String>{
        'matchId': matchId.toString(),
      },
    );
  }

  String _preferredStoreUrl() {
    if (_isAndroid) {
      return _playStoreUrl;
    }
    return _appleStoreUrl;
  }

  void _openAppManually() {
    final appDeepLink = _buildAppDeepLink();
    if (appDeepLink == null) {
      return;
    }
    html.window.location.assign(appDeepLink.toString());
  }

  void _openStore(String url) {
    html.window.location.assign(url);
  }

  String _normalizeLanguageTag(String rawLanguageTag) {
    final lower = rawLanguageTag.toLowerCase();
    if (lower.startsWith('pt')) {
      return 'pt-BR';
    }
    if (lower.startsWith('es')) {
      return 'es';
    }
    if (lower.startsWith('fr')) {
      return 'fr';
    }
    if (lower.startsWith('de')) {
      return 'de';
    }
    return 'en';
  }

  String _matchDetailsLine() {
    if (_location.isEmpty && _day.isEmpty && _hour.isEmpty) {
      return '';
    }

    final parts = <String>[];
    if (_location.isNotEmpty) {
      parts.add(_location);
    }
    if (_day.isNotEmpty) {
      parts.add(_day);
    }
    if (_hour.isNotEmpty) {
      parts.add(_hour);
    }

    return '${_copy.matchDetailsLabel}: ${parts.join(' • ')}';
  }

  @override
  Component build(BuildContext context) {
    final matchDetails = _matchDetailsLine();

    return div(classes: 'landing-root', [
      div(classes: 'landing-background', []),
      div(classes: 'landing-content-shell', [
        div(classes: 'landing-card', [
          div(classes: 'brand-line', [
            img(
              src: 'images/logo.svg',
              width: 54,
              height: 54,
            ),
            div(classes: 'brand-text', [
              p(classes: 'brand-kicker', [
                Component.text('ROOT HUB'),
              ]),
              h1(classes: 'hero-title', [
                Component.text(
                  _isMobile ? _copy.mobileTitle : _copy.desktopTitle,
                ),
              ]),
            ]),
          ]),
          p(classes: 'hero-description', [
            Component.text(
              _isMobile ? _copy.mobileDescription : _copy.desktopDescription,
            ),
          ]),
          if (matchDetails.isNotEmpty)
            div(classes: 'match-details-chip', [
              Component.text(matchDetails),
            ]),
          if (_isMobile && _isAutoOpening)
            div(classes: 'status-row', [
              div(classes: 'status-loader', []),
              p(classes: 'status-text', [
                Component.text(_copy.autoOpeningStatus),
              ]),
            ]),
          div(classes: 'actions-grid', [
            if (_isMobile && _matchId != null)
              button(
                classes: 'action-button primary',
                onClick: _openAppManually,
                [Component.text(_copy.openAppButton)],
              ),
            button(
              classes: 'action-button',
              onClick: () {
                _openStore(_appleStoreUrl);
              },
              [Component.text(_copy.openAppleStoreButton)],
            ),
            button(
              classes: 'action-button',
              onClick: () {
                _openStore(_playStoreUrl);
              },
              [Component.text(_copy.openPlayStoreButton)],
            ),
          ]),
          p(classes: 'footer-note', [
            Component.text(_copy.footerNote),
          ]),
        ]),
      ]),
    ]);
  }
}

_LandingCopy _copyForLanguage(String languageTag) {
  return switch (languageTag) {
    'pt-BR' => _LandingCopy(
      pageTitle: 'Root Hub | Entrar na partida',
      mobileTitle: 'Abrindo o Root Hub...',
      mobileDescription: 'Estamos tentando abrir o app para voce entrar nesta partida.',
      desktopTitle: 'Root Hub e exclusivo para celular',
      desktopDescription:
          'Este link serve para entrar em uma partida presencial de ROOT. Baixe o app no seu celular para continuar.',
      autoOpeningStatus: 'Se o app nao abrir em instantes, voce sera redirecionado para a loja.',
      openAppButton: 'Abrir app agora',
      openAppleStoreButton: 'Abrir na App Store',
      openPlayStoreButton: 'Abrir no Google Play',
      footerNote: 'Depois de entrar na conta, voce sera levado para a partida automaticamente.',
      matchDetailsLabel: 'Partida',
    ),
    'es' => _LandingCopy(
      pageTitle: 'Root Hub | Unirse a la partida',
      mobileTitle: 'Abriendo Root Hub...',
      mobileDescription: 'Estamos intentando abrir la app para que te unas a esta partida.',
      desktopTitle: 'Root Hub es solo para movil',
      desktopDescription:
          'Este enlace sirve para unirte a una partida presencial de ROOT. Descarga la app en tu telefono para continuar.',
      autoOpeningStatus: 'Si la app no se abre en unos segundos, te redirigiremos a la tienda.',
      openAppButton: 'Abrir app ahora',
      openAppleStoreButton: 'Abrir en App Store',
      openPlayStoreButton: 'Abrir en Google Play',
      footerNote: 'Despues de iniciar sesion, veras esta partida automaticamente.',
      matchDetailsLabel: 'Partida',
    ),
    'fr' => _LandingCopy(
      pageTitle: 'Root Hub | Rejoindre la partie',
      mobileTitle: 'Ouverture de Root Hub...',
      mobileDescription: 'Nous essayons d ouvrir l application pour que vous rejoigniez cette partie.',
      desktopTitle: 'Root Hub est disponible uniquement sur mobile',
      desktopDescription:
          'Ce lien permet de rejoindre une partie ROOT en presentiel. Telechargez l application sur votre telephone pour continuer.',
      autoOpeningStatus: 'Si l application ne s ouvre pas rapidement, vous serez redirige vers la boutique.',
      openAppButton: 'Ouvrir l app maintenant',
      openAppleStoreButton: 'Ouvrir sur App Store',
      openPlayStoreButton: 'Ouvrir sur Google Play',
      footerNote: 'Apres authentification, cette partie sera ouverte automatiquement.',
      matchDetailsLabel: 'Partie',
    ),
    'de' => _LandingCopy(
      pageTitle: 'Root Hub | Spiel beitreten',
      mobileTitle: 'Root Hub wird geoeffnet...',
      mobileDescription: 'Wir versuchen die App zu oeffnen, damit du diesem Spiel beitreten kannst.',
      desktopTitle: 'Root Hub ist nur fuer Mobilgeraete verfuegbar',
      desktopDescription:
          'Dieser Link fuehrt zu einem ROOT-Spiel vor Ort. Lade die App auf dein Handy herunter, um fortzufahren.',
      autoOpeningStatus: 'Wenn sich die App nicht in wenigen Sekunden oeffnet, wirst du zum Store weitergeleitet.',
      openAppButton: 'App jetzt oeffnen',
      openAppleStoreButton: 'Im App Store oeffnen',
      openPlayStoreButton: 'Bei Google Play oeffnen',
      footerNote: 'Nach der Anmeldung wird dieses Spiel automatisch angezeigt.',
      matchDetailsLabel: 'Spiel',
    ),
    _ => _LandingCopy(
      pageTitle: 'Root Hub | Join Match',
      mobileTitle: 'Opening Root Hub...',
      mobileDescription: 'We are trying to open the app so you can join this match.',
      desktopTitle: 'Root Hub is mobile only',
      desktopDescription:
          'This link is used to join an in-person ROOT match. Download the app on your phone to continue.',
      autoOpeningStatus: 'If the app does not open in a few seconds, we will redirect you to the store.',
      openAppButton: 'Open app now',
      openAppleStoreButton: 'Open in App Store',
      openPlayStoreButton: 'Open in Google Play',
      footerNote: 'After authentication, this match will open automatically.',
      matchDetailsLabel: 'Match',
    ),
  };
}

class _LandingCopy {
  const _LandingCopy({
    required this.pageTitle,
    required this.mobileTitle,
    required this.mobileDescription,
    required this.desktopTitle,
    required this.desktopDescription,
    required this.autoOpeningStatus,
    required this.openAppButton,
    required this.openAppleStoreButton,
    required this.openPlayStoreButton,
    required this.footerNote,
    required this.matchDetailsLabel,
  });

  final String pageTitle;
  final String mobileTitle;
  final String mobileDescription;
  final String desktopTitle;
  final String desktopDescription;
  final String autoOpeningStatus;
  final String openAppButton;
  final String openAppleStoreButton;
  final String openPlayStoreButton;
  final String footerNote;
  final String matchDetailsLabel;
}
