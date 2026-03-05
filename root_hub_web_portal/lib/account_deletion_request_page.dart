// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:html' as html;

import 'package:email_validator/email_validator.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:root_hub_client/root_hub_client.dart';

class AccountDeletionRequestPage extends StatefulComponent {
  const AccountDeletionRequestPage({
    this.showSuccessState = false,
    super.key,
  });

  final bool showSuccessState;

  @override
  State<AccountDeletionRequestPage> createState() => _AccountDeletionRequestPageState();
}

class _AccountDeletionRequestPageState extends State<AccountDeletionRequestPage> {
  Client? _client;
  late final ServerSupportedTranslation _language;
  late final _AccountDeletionCopy _copy;

  bool _isApiConfigLoading = true;
  bool _isSubmitting = false;
  bool _isSuccess = false;
  String _typedEmail = '';
  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    _language = _resolveLanguage();
    _copy = _copyForLanguage(_normalizeLanguageTag(html.window.navigator.language));
    _isSuccess = component.showSuccessState;
    _syncPageTitle();
    _bootstrapClient();
  }

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

  Future<void> _submit() async {
    final normalizedEmail = _typedEmail.trim().toLowerCase();
    if (_isSubmitting || _isApiConfigLoading) {
      return;
    }

    if (!EmailValidator.validate(normalizedEmail)) {
      setState(() {
        _errorMessage = _copy.invalidEmailError;
      });
      return;
    }

    final client = _client;
    if (client == null) {
      setState(() {
        _errorMessage = _copy.genericError;
      });
      return;
    }

    setState(() {
      _typedEmail = normalizedEmail;
      _isSubmitting = true;
      _errorMessage = null;
    });

    try {
      await client.requestAccountDeletion.v1(
        language: _language,
        email: normalizedEmail,
      );

      if (!mounted) {
        return;
      }

      html.window.history.replaceState(
        null,
        _copy.successPageTitle,
        '/join/account-deletion/success',
      );

      setState(() {
        _isSubmitting = false;
        _isSuccess = true;
        _errorMessage = null;
      });
      _syncPageTitle();
    } on RootHubException catch (error) {
      setState(() {
        _isSubmitting = false;
        _errorMessage = error.description;
      });
    } catch (_) {
      setState(() {
        _isSubmitting = false;
        _errorMessage = _copy.genericError;
      });
    }
  }

  void _syncPageTitle() {
    html.document.title = _isSuccess ? _copy.successPageTitle : _copy.pageTitle;
  }

  Component _buildInfoPanel({
    required String title,
    List<String> paragraphs = const [],
    List<String> bullets = const [],
  }) {
    return div(classes: 'account-deletion-panel', [
      h2(classes: 'account-deletion-panel-title', [
        Component.text(title),
      ]),
      for (final paragraph in paragraphs)
        p(classes: 'account-deletion-paragraph', [
          Component.text(paragraph),
        ]),
      if (bullets.isNotEmpty)
        ul(classes: 'legal-list account-deletion-list', [
          for (final bullet in bullets)
            li(classes: 'legal-list-item', [
              Component.text(bullet),
            ]),
        ]),
    ]);
  }

  Component _buildFormPanel() {
    return div(classes: 'account-deletion-panel account-deletion-form-panel', [
      h2(classes: 'account-deletion-panel-title', [
        Component.text(_copy.formTitle),
      ]),
      p(classes: 'account-deletion-paragraph', [
        Component.text(_copy.formDescription),
      ]),
      p(classes: 'account-deletion-label', [
        Component.text(_copy.emailLabel),
      ]),
      input<String>(
        type: InputType.email,
        value: _typedEmail,
        classes: 'account-deletion-input',
        attributes: {
          'placeholder': _copy.emailPlaceholder,
          'autocomplete': 'email',
          'autocapitalize': 'off',
          'spellcheck': 'false',
          'inputmode': 'email',
        },
        onInput: (value) {
          setState(() {
            _typedEmail = value;
            _errorMessage = null;
          });
        },
      ),
      button(
        classes: 'action-button primary account-deletion-button',
        disabled: _isSubmitting || _isApiConfigLoading,
        onClick: _submit,
        [
          Component.text(
            _isApiConfigLoading
                ? _copy.loadingButtonLabel
                : _isSubmitting
                ? _copy.submittingButtonLabel
                : _copy.submitButtonLabel,
          ),
        ],
      ),
      if (_errorMessage != null)
        p(classes: 'account-deletion-error', [
          Component.text(_errorMessage!),
        ]),
    ]);
  }

  Component _buildSuccessPanel() {
    return div(classes: 'account-deletion-success', [
      h2(classes: 'account-deletion-success-title', [
        Component.text(_copy.successTitle),
      ]),
      p(classes: 'account-deletion-paragraph', [
        Component.text(_copy.successDescription),
      ]),
      ul(classes: 'legal-list account-deletion-list', [
        for (final step in _copy.successBullets)
          li(classes: 'legal-list-item', [
            Component.text(step),
          ]),
      ]),
      div(classes: 'legal-link-row account-deletion-success-links', [
        a(
          href: '/join/account-deletion',
          classes: 'inline-link',
          [Component.text(_copy.accountDeletionLinkLabel)],
        ),
        span(classes: 'legal-link-separator', [
          Component.text('•'),
        ]),
        a(
          href: '/join/privacy',
          classes: 'inline-link',
          [Component.text(_copy.privacyLinkLabel)],
        ),
        span(classes: 'legal-link-separator', [
          Component.text('•'),
        ]),
        a(
          href: '/join/terms',
          classes: 'inline-link',
          [Component.text(_copy.termsLinkLabel)],
        ),
      ]),
    ]);
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'landing-root legal-root', [
      div(classes: 'landing-background', []),
      div(classes: 'landing-content-shell legal-content-shell', [
        div(classes: 'landing-card legal-card account-deletion-card', [
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
              h1(classes: 'hero-title legal-title', [
                Component.text(_copy.heroTitle),
              ]),
            ]),
          ]),
          p(classes: 'hero-description legal-intro', [
            Component.text(_copy.intro),
          ]),
          p(classes: 'account-deletion-byline', [
            Component.text(_copy.byline),
          ]),
          div(classes: 'legal-nav', [
            a(
              href: '/join/privacy',
              classes: 'legal-pill',
              [Component.text(_copy.privacyLinkLabel)],
            ),
            a(
              href: '/join/terms',
              classes: 'legal-pill',
              [Component.text(_copy.termsLinkLabel)],
            ),
            a(
              href: '/join/account-deletion',
              classes: 'legal-pill active',
              [Component.text(_copy.accountDeletionLinkLabel)],
            ),
            a(
              href: '/join/',
              classes: 'legal-pill',
              [Component.text(_copy.inviteLinkLabel)],
            ),
          ]),
          if (_isSuccess)
            _buildSuccessPanel()
          else
            div(classes: 'account-deletion-grid', [
              _buildInfoPanel(
                title: _copy.stepsTitle,
                bullets: _copy.steps,
              ),
              _buildInfoPanel(
                title: _copy.deletedDataTitle,
                bullets: _copy.deletedData,
              ),
              _buildInfoPanel(
                title: _copy.retainedDataTitle,
                bullets: _copy.retainedData,
              ),
              _buildFormPanel(),
            ]),
        ]),
      ]),
    ]);
  }
}

String _normalizeLanguageTag(String rawLanguageTag) {
  final lower = rawLanguageTag.toLowerCase();
  if (lower.startsWith('pt')) {
    return 'pt-BR';
  }

  return 'en';
}

_AccountDeletionCopy _copyForLanguage(String languageTag) {
  if (languageTag == 'pt-BR') {
    return _accountDeletionCopyPtBr;
  }

  return _accountDeletionCopyEn;
}

const _accountDeletionCopyEn = _AccountDeletionCopy(
  pageTitle: 'Root Hub | Delete Account',
  successPageTitle: 'Root Hub | Account Deletion Requested',
  heroTitle: 'Delete your Root Hub account',
  intro: 'This page is the public Root Hub account deletion request URL for Google Play and other store listings.',
  byline: 'Root Hub by Igor',
  stepsTitle: 'How to request deletion',
  steps: [
    'Enter the email address connected to your Root Hub account.',
    'Submit the request using the secure form on this page.',
    'The request is saved in the Root Hub database and a notification is sent to the administrator for manual review.',
    'After the request is reviewed, the Root Hub account and related app data are deleted or anonymized where needed.',
  ],
  deletedDataTitle: 'Data scheduled for deletion',
  deletedData: [
    'Account profile data such as email address, display name, preferred language, favorite faction, and profile image references.',
    'Authentication links and device notification tokens tied to the account.',
    'Community content and uploads directly linked to the account, including posts, comments, chat messages, match subscriptions, hosted schedules, and related uploaded media when removal is technically possible.',
    'Location data stored to operate nearby matchmaking and table creation.',
  ],
  retainedDataTitle: 'Data that may be retained for a limited period',
  retainedData: [
    'Operational logs and backup copies may retain limited fragments of the deleted data for up to 30 days before they age out of routine retention windows.',
    'If required to protect other users, prevent abuse, or comply with legal obligations, some records may be minimized or anonymized instead of being fully removed immediately.',
  ],
  formTitle: 'Submit your request',
  formDescription: 'Use the same email address you used to register or sign in to Root Hub.',
  emailLabel: 'Account email',
  emailPlaceholder: 'you@example.com',
  submitButtonLabel: 'Request account deletion',
  submittingButtonLabel: 'Sending request...',
  loadingButtonLabel: 'Loading secure form...',
  successTitle: 'Request received',
  successDescription: 'Your Root Hub account deletion request has been recorded successfully.',
  successBullets: [
    'The request was saved for manual review.',
    'A notification was sent to the Root Hub administrator.',
    'If additional verification is needed, the administrator may contact you using the email provided.',
  ],
  invalidEmailError: 'Enter a valid email address to continue.',
  genericError: 'Unable to submit the request right now. Please try again in a moment.',
  privacyLinkLabel: 'Privacy Policy',
  termsLinkLabel: 'Terms of Service',
  accountDeletionLinkLabel: 'Delete Account',
  inviteLinkLabel: 'Match invite page',
);

const _accountDeletionCopyPtBr = _AccountDeletionCopy(
  pageTitle: 'Root Hub | Excluir conta',
  successPageTitle: 'Root Hub | Solicitacao registrada',
  heroTitle: 'Excluir sua conta do Root Hub',
  intro: 'Esta pagina e o URL publico de solicitacao de exclusao de conta do Root Hub para Google Play e outras lojas.',
  byline: 'Root Hub by Igor',
  stepsTitle: 'Como solicitar a exclusao',
  steps: [
    'Digite o endereco de e-mail conectado a sua conta do Root Hub.',
    'Envie a solicitacao usando o formulario seguro desta pagina.',
    'A solicitacao e salva no banco de dados do Root Hub e uma notificacao e enviada ao administrador para revisao manual.',
    'Depois da revisao, a conta do Root Hub e os dados relacionados ao app sao excluidos ou anonimizados quando necessario.',
  ],
  deletedDataTitle: 'Dados programados para exclusao',
  deletedData: [
    'Dados de perfil da conta, como endereco de e-mail, nome de exibicao, idioma preferido, faccao favorita e referencias de imagem do perfil.',
    'Vinculos de autenticacao e tokens de notificacao do dispositivo ligados a conta.',
    'Conteudo da comunidade e uploads vinculados diretamente a conta, incluindo posts, comentarios, mensagens de chat, inscricoes em partidas, mesas criadas e midias enviadas quando a remocao for tecnicamente possivel.',
    'Dados de localizacao armazenados para operar a busca de partidas proximas e a criacao de mesas.',
  ],
  retainedDataTitle: 'Dados que podem ser mantidos por tempo limitado',
  retainedData: [
    'Logs operacionais e copias de backup podem manter fragmentos limitados dos dados excluidos por ate 30 dias, ate sairem das janelas rotineiras de retencao.',
    'Se isso for necessario para proteger outros usuarios, prevenir abuso ou cumprir obrigacoes legais, alguns registros podem ser minimizados ou anonimizados em vez de removidos imediatamente.',
  ],
  formTitle: 'Enviar sua solicitacao',
  formDescription: 'Use o mesmo endereco de e-mail usado para cadastrar ou entrar no Root Hub.',
  emailLabel: 'E-mail da conta',
  emailPlaceholder: 'voce@exemplo.com',
  submitButtonLabel: 'Solicitar exclusao da conta',
  submittingButtonLabel: 'Enviando solicitacao...',
  loadingButtonLabel: 'Carregando formulario seguro...',
  successTitle: 'Solicitacao recebida',
  successDescription: 'Sua solicitacao de exclusao de conta do Root Hub foi registrada com sucesso.',
  successBullets: [
    'A solicitacao foi salva para revisao manual.',
    'Uma notificacao foi enviada ao administrador do Root Hub.',
    'Se for necessario validar mais dados, o administrador pode entrar em contato usando o e-mail informado.',
  ],
  invalidEmailError: 'Digite um endereco de e-mail valido para continuar.',
  genericError: 'Nao foi possivel enviar a solicitacao agora. Tente novamente em instantes.',
  privacyLinkLabel: 'Politica de Privacidade',
  termsLinkLabel: 'Termos de Uso',
  accountDeletionLinkLabel: 'Excluir conta',
  inviteLinkLabel: 'Pagina de convite',
);

class _AccountDeletionCopy {
  const _AccountDeletionCopy({
    required this.pageTitle,
    required this.successPageTitle,
    required this.heroTitle,
    required this.intro,
    required this.byline,
    required this.stepsTitle,
    required this.steps,
    required this.deletedDataTitle,
    required this.deletedData,
    required this.retainedDataTitle,
    required this.retainedData,
    required this.formTitle,
    required this.formDescription,
    required this.emailLabel,
    required this.emailPlaceholder,
    required this.submitButtonLabel,
    required this.submittingButtonLabel,
    required this.loadingButtonLabel,
    required this.successTitle,
    required this.successDescription,
    required this.successBullets,
    required this.invalidEmailError,
    required this.genericError,
    required this.privacyLinkLabel,
    required this.termsLinkLabel,
    required this.accountDeletionLinkLabel,
    required this.inviteLinkLabel,
  });

  final String pageTitle;
  final String successPageTitle;
  final String heroTitle;
  final String intro;
  final String byline;
  final String stepsTitle;
  final List<String> steps;
  final String deletedDataTitle;
  final List<String> deletedData;
  final String retainedDataTitle;
  final List<String> retainedData;
  final String formTitle;
  final String formDescription;
  final String emailLabel;
  final String emailPlaceholder;
  final String submitButtonLabel;
  final String submittingButtonLabel;
  final String loadingButtonLabel;
  final String successTitle;
  final String successDescription;
  final List<String> successBullets;
  final String invalidEmailError;
  final String genericError;
  final String privacyLinkLabel;
  final String termsLinkLabel;
  final String accountDeletionLinkLabel;
  final String inviteLinkLabel;
}
