// ignore_for_file: deprecated_member_use

import 'dart:html' as html;

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

enum LegalDocumentType {
  privacy,
  terms,
}

class LegalDocumentPage extends StatelessComponent {
  const LegalDocumentPage({
    required this.type,
    super.key,
  });

  final LegalDocumentType type;

  @override
  Component build(BuildContext context) {
    final languageTag = _normalizeLanguageTag(html.window.navigator.language);
    final copy = _copyForDocument(type, languageTag);

    html.document.title = copy.pageTitle;

    return div(classes: 'landing-root legal-root', [
      div(classes: 'landing-background', []),
      div(classes: 'landing-content-shell legal-content-shell', [
        div(classes: 'landing-card legal-card', [
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
                Component.text(copy.heroTitle),
              ]),
            ]),
          ]),
          p(classes: 'hero-description legal-intro', [
            Component.text(copy.intro),
          ]),
          p(classes: 'legal-last-updated', [
            Component.text(copy.lastUpdatedLabel),
          ]),
          div(classes: 'legal-nav', [
            a(
              href: '/join/privacy',
              classes: 'legal-pill ${type == LegalDocumentType.privacy ? 'active' : ''}',
              [Component.text(copy.privacyLinkLabel)],
            ),
            a(
              href: '/join/terms',
              classes: 'legal-pill ${type == LegalDocumentType.terms ? 'active' : ''}',
              [Component.text(copy.termsLinkLabel)],
            ),
            a(
              href: '/join/account-deletion',
              classes: 'legal-pill',
              [Component.text(copy.accountDeletionLinkLabel)],
            ),
            a(
              href: '/join/',
              classes: 'legal-pill',
              [Component.text(copy.inviteLinkLabel)],
            ),
          ]),
          div(classes: 'legal-sections', [
            for (final sectionCopy in copy.sections)
              div(classes: 'legal-section', [
                h2(classes: 'legal-section-title', [
                  Component.text(sectionCopy.title),
                ]),
                for (final paragraph in sectionCopy.paragraphs)
                  p(classes: 'legal-paragraph', [
                    Component.text(paragraph),
                  ]),
                if (sectionCopy.bullets.isNotEmpty)
                  ul(classes: 'legal-list', [
                    for (final bullet in sectionCopy.bullets)
                      li(classes: 'legal-list-item', [
                        Component.text(bullet),
                      ]),
                  ]),
              ]),
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

_LegalDocumentCopy _copyForDocument(
  LegalDocumentType type,
  String languageTag,
) {
  if (languageTag == 'pt-BR') {
    return switch (type) {
      LegalDocumentType.privacy => _privacyPolicyPtBr,
      LegalDocumentType.terms => _termsOfServicePtBr,
    };
  }

  return switch (type) {
    LegalDocumentType.privacy => _privacyPolicyEn,
    LegalDocumentType.terms => _termsOfServiceEn,
  };
}

const _privacyPolicyEn = _LegalDocumentCopy(
  pageTitle: 'Root Hub | Privacy Policy',
  heroTitle: 'Privacy Policy',
  intro:
      'This Privacy Policy explains what Root Hub collects, how we use it, and the choices you have when you use the mobile app and shared web links.',
  lastUpdatedLabel: 'Last updated: March 5, 2026',
  privacyLinkLabel: 'Privacy Policy',
  termsLinkLabel: 'Terms of Service',
  accountDeletionLinkLabel: 'Delete Account',
  inviteLinkLabel: 'Match invite page',
  sections: [
    _LegalSectionCopy(
      title: '1. Information we collect',
      paragraphs: [
        'Depending on how you use Root Hub, we may collect the following categories of information:',
      ],
      bullets: [
        'Account and profile data such as your email address, sign-in provider information, display name, profile image, favorite faction, and preferred language.',
        'Matchmaking data such as your device location coordinates, search radius, and the places or venues you select when creating or joining matches.',
        'Community content that you choose to submit, including match schedules, subscriptions, chat messages, posts, comments, played-match results, and uploaded images or proof photos.',
        'Notification and technical data such as push notification tokens, device or platform information, and service logs required to operate the app.',
        'Web link analytics such as IP address, approximate country or city, browser, operating system, device type, visited path, and query string when someone opens a Root Hub web page.',
      ],
    ),
    _LegalSectionCopy(
      title: '2. How we use information',
      bullets: [
        'Create and maintain your account and player profile.',
        'Show nearby matches, allow subscriptions, and support in-app chat and community features.',
        'Send verification emails, password reset messages, and optional push notifications.',
        'Store match results, uploads, and moderation or abuse-prevention records.',
        'Understand how shared invite links are used so we can improve the service and diagnose problems.',
      ],
    ),
    _LegalSectionCopy(
      title: '3. When information is shared',
      paragraphs: [
        'We do not sell personal data.',
        'Information may be shared in the following limited situations:',
      ],
      bullets: [
        'With other Root Hub users when you publish profile details, create or join matches, send chat messages, post content, or register match results.',
        'With service providers that help us run Root Hub, such as hosting providers, Google services for sign-in and place lookup, Firebase Cloud Messaging for push notifications, UploadThing for image delivery, and Resend for transactional email.',
        'When required to comply with law, enforce the service rules, or protect Root Hub, its users, or the public.',
      ],
    ),
    _LegalSectionCopy(
      title: '4. Retention and your choices',
      paragraphs: [
        'We keep information for as long as it is reasonably needed to operate Root Hub, maintain security, fulfill legal obligations, and resolve disputes. Some copies may remain for a limited time in backups or logs.',
        'You can change profile data inside the app. If you want to request account deletion, use the dedicated page at /join/account-deletion. If you need broader privacy support, use the Root Hub support contact published in the Play Store or App Store listing for the app.',
      ],
    ),
    _LegalSectionCopy(
      title: '5. Security',
      paragraphs: [
        'Root Hub uses reasonable technical and organizational measures to protect stored information. No internet or mobile service can be guaranteed to be completely secure, so please use strong credentials and share only what you are comfortable sharing.',
      ],
    ),
    _LegalSectionCopy(
      title: '6. Children',
      paragraphs: [
        'Root Hub is not intended for children under 13, or a higher minimum age if your local law requires it. Do not use the service if you are below the minimum age in your jurisdiction.',
      ],
    ),
    _LegalSectionCopy(
      title: '7. Changes to this policy',
      paragraphs: [
        'We may update this Privacy Policy from time to time. When we do, we will publish the updated version on this page and update the effective date shown above.',
      ],
    ),
  ],
);

const _termsOfServiceEn = _LegalDocumentCopy(
  pageTitle: 'Root Hub | Terms of Service',
  heroTitle: 'Terms of Service',
  intro:
      'These Terms of Service govern your use of Root Hub, including the mobile app, shared web links, and related community features.',
  lastUpdatedLabel: 'Last updated: March 5, 2026',
  privacyLinkLabel: 'Privacy Policy',
  termsLinkLabel: 'Terms of Service',
  accountDeletionLinkLabel: 'Delete Account',
  inviteLinkLabel: 'Match invite page',
  sections: [
    _LegalSectionCopy(
      title: '1. Acceptance of the terms',
      paragraphs: [
        'By creating an account, opening Root Hub links, or using any part of the service, you agree to these Terms. If you do not agree, do not use Root Hub.',
      ],
    ),
    _LegalSectionCopy(
      title: '2. Accounts and eligibility',
      bullets: [
        'You must be legally allowed to use the service in your jurisdiction.',
        'You are responsible for keeping your login credentials secure and for activity that happens through your account.',
        'Information you provide to Root Hub should be accurate and kept reasonably up to date.',
      ],
    ),
    _LegalSectionCopy(
      title: '3. User content and community conduct',
      paragraphs: [
        'You keep ownership of the content you submit, but you give Root Hub a limited license to host, store, reproduce, and display that content as needed to operate the service.',
      ],
      bullets: [
        'Do not post unlawful, abusive, threatening, deceptive, or infringing content.',
        'Do not impersonate other people or misrepresent match details, locations, or results.',
        'Do not use Root Hub to spam, scrape, disrupt the service, or interfere with other users.',
      ],
    ),
    _LegalSectionCopy(
      title: '4. In-person match safety',
      paragraphs: [
        'Root Hub helps players discover and coordinate in-person ROOT matches, but all meetings are organized by users. Root Hub is not a venue operator, event organizer, insurer, transportation provider, or background-check service.',
        'You are responsible for deciding whether, when, and where to meet other players. Use common sense, prefer public places, and leave any situation that feels unsafe.',
      ],
    ),
    _LegalSectionCopy(
      title: '5. Service availability and changes',
      paragraphs: [
        'Root Hub may change, suspend, or remove features at any time. We do not guarantee that the service will always be available, error-free, or suitable for every purpose.',
      ],
    ),
    _LegalSectionCopy(
      title: '6. Suspension or termination',
      paragraphs: [
        'We may suspend or terminate access to Root Hub if we believe you violated these Terms, created risk for other users, or used the service in a harmful or unlawful way.',
      ],
    ),
    _LegalSectionCopy(
      title: '7. Disclaimers and limitation of liability',
      paragraphs: [
        'Root Hub is provided on an as-is and as-available basis. To the fullest extent permitted by law, Root Hub disclaims warranties of merchantability, fitness for a particular purpose, and non-infringement.',
        'To the fullest extent permitted by law, Root Hub will not be liable for indirect, incidental, special, consequential, exemplary, or punitive damages, or for losses arising from user interactions, meetups, content, outages, or unauthorized access.',
      ],
    ),
    _LegalSectionCopy(
      title: '8. Changes to these terms',
      paragraphs: [
        'We may update these Terms from time to time. Continued use of Root Hub after an update means you accept the revised Terms.',
      ],
    ),
  ],
);

const _privacyPolicyPtBr = _LegalDocumentCopy(
  pageTitle: 'Root Hub | Politica de Privacidade',
  heroTitle: 'Politica de Privacidade',
  intro:
      'Esta Politica de Privacidade explica quais dados o Root Hub coleta, como esses dados sao usados e quais escolhas voce tem ao usar o app mobile e os links compartilhados da web.',
  lastUpdatedLabel: 'Ultima atualizacao: 5 de marco de 2026',
  privacyLinkLabel: 'Politica de Privacidade',
  termsLinkLabel: 'Termos de Uso',
  accountDeletionLinkLabel: 'Excluir conta',
  inviteLinkLabel: 'Pagina de convite',
  sections: [
    _LegalSectionCopy(
      title: '1. Informacoes que coletamos',
      paragraphs: [
        'Dependendo de como voce usa o Root Hub, podemos coletar as seguintes categorias de informacoes:',
      ],
      bullets: [
        'Dados de conta e perfil, como endereco de e-mail, informacoes do provedor de login, nome de exibicao, foto de perfil, faccao favorita e idioma preferido.',
        'Dados de matchmaking, como coordenadas de localizacao do dispositivo, raio de busca e os lugares ou locais selecionados ao criar ou entrar em partidas.',
        'Conteudo da comunidade enviado por voce, incluindo agendas de partidas, inscricoes, mensagens de chat, posts, comentarios, resultados de partidas e imagens ou fotos de comprovacao enviadas.',
        'Dados tecnicos e de notificacao, como tokens de push notification, informacoes de dispositivo ou plataforma e logs necessarios para operar o app.',
        'Analiticos de links da web, como endereco IP, pais ou cidade aproximados, navegador, sistema operacional, tipo de dispositivo, caminho visitado e query string quando alguem abre uma pagina web do Root Hub.',
      ],
    ),
    _LegalSectionCopy(
      title: '2. Como usamos as informacoes',
      bullets: [
        'Criar e manter sua conta e seu perfil de jogador.',
        'Mostrar partidas proximas, permitir inscricoes e oferecer chat e recursos da comunidade.',
        'Enviar e-mails de verificacao, mensagens de redefinicao de senha e notificacoes push opcionais.',
        'Armazenar resultados de partidas, uploads e registros ligados a moderacao e prevencao de abuso.',
        'Entender como os links compartilhados sao usados para melhorar o servico e diagnosticar problemas.',
      ],
    ),
    _LegalSectionCopy(
      title: '3. Quando as informacoes sao compartilhadas',
      paragraphs: [
        'Nao vendemos dados pessoais.',
        'As informacoes podem ser compartilhadas apenas nas situacoes abaixo:',
      ],
      bullets: [
        'Com outros usuarios do Root Hub quando voce publica detalhes do perfil, cria ou entra em partidas, envia mensagens, publica conteudo ou registra resultados.',
        'Com prestadores de servico que ajudam a operar o Root Hub, como provedores de hospedagem, servicos Google para login e busca de locais, Firebase Cloud Messaging para push notifications, UploadThing para entrega de imagens e Resend para e-mails transacionais.',
        'Quando isso for necessario para cumprir a lei, aplicar as regras do servico ou proteger o Root Hub, seus usuarios ou o publico.',
      ],
    ),
    _LegalSectionCopy(
      title: '4. Retencao e suas escolhas',
      paragraphs: [
        'Mantemos as informacoes pelo tempo razoavelmente necessario para operar o Root Hub, manter a seguranca, cumprir obrigacoes legais e resolver disputas. Algumas copias podem permanecer por um periodo limitado em backups ou logs.',
        'Voce pode alterar dados do perfil dentro do app. Se quiser solicitar a exclusao da conta, use a pagina dedicada em /join/account-deletion. Se precisar de suporte de privacidade mais amplo, use o contato de suporte do Root Hub publicado na listagem do app na Play Store ou na App Store.',
      ],
    ),
    _LegalSectionCopy(
      title: '5. Seguranca',
      paragraphs: [
        'O Root Hub usa medidas tecnicas e organizacionais razoaveis para proteger as informacoes armazenadas. Nenhum servico na internet ou em dispositivos moveis pode ser garantido como totalmente seguro, entao use credenciais fortes e compartilhe apenas o que voce se sentir confortavel em compartilhar.',
      ],
    ),
    _LegalSectionCopy(
      title: '6. Criancas',
      paragraphs: [
        'O Root Hub nao foi feito para criancas menores de 13 anos, ou idade superior se a lei local exigir. Nao use o servico se voce estiver abaixo da idade minima da sua jurisdicao.',
      ],
    ),
    _LegalSectionCopy(
      title: '7. Alteracoes nesta politica',
      paragraphs: [
        'Podemos atualizar esta Politica de Privacidade periodicamente. Quando isso acontecer, publicaremos a versao atualizada nesta pagina e ajustaremos a data mostrada acima.',
      ],
    ),
  ],
);

const _termsOfServicePtBr = _LegalDocumentCopy(
  pageTitle: 'Root Hub | Termos de Uso',
  heroTitle: 'Termos de Uso',
  intro:
      'Estes Termos de Uso regulam o uso do Root Hub, incluindo o app mobile, os links compartilhados da web e os recursos de comunidade relacionados.',
  lastUpdatedLabel: 'Ultima atualizacao: 5 de marco de 2026',
  privacyLinkLabel: 'Politica de Privacidade',
  termsLinkLabel: 'Termos de Uso',
  accountDeletionLinkLabel: 'Excluir conta',
  inviteLinkLabel: 'Pagina de convite',
  sections: [
    _LegalSectionCopy(
      title: '1. Aceitacao dos termos',
      paragraphs: [
        'Ao criar uma conta, abrir links do Root Hub ou usar qualquer parte do servico, voce concorda com estes Termos. Se nao concordar, nao use o Root Hub.',
      ],
    ),
    _LegalSectionCopy(
      title: '2. Contas e elegibilidade',
      bullets: [
        'Voce precisa ter permissao legal para usar o servico na sua jurisdicao.',
        'Voce e responsavel por manter suas credenciais de login seguras e pela atividade realizada na sua conta.',
        'As informacoes fornecidas ao Root Hub devem ser verdadeiras e mantidas razoavelmente atualizadas.',
      ],
    ),
    _LegalSectionCopy(
      title: '3. Conteudo do usuario e conduta na comunidade',
      paragraphs: [
        'Voce continua sendo dono do conteudo que envia, mas concede ao Root Hub uma licenca limitada para hospedar, armazenar, reproduzir e exibir esse conteudo na medida necessaria para operar o servico.',
      ],
      bullets: [
        'Nao publique conteudo ilegal, abusivo, ameacador, enganoso ou que infrinja direitos de terceiros.',
        'Nao se passe por outras pessoas e nao falseie detalhes de partidas, locais ou resultados.',
        'Nao use o Root Hub para spam, raspagem de dados, interrupcao do servico ou interferencia com outros usuarios.',
      ],
    ),
    _LegalSectionCopy(
      title: '4. Seguranca em partidas presenciais',
      paragraphs: [
        'O Root Hub ajuda jogadores a descobrir e coordenar partidas presenciais de ROOT, mas todos os encontros sao organizados pelos usuarios. O Root Hub nao e operador de local, organizador de eventos, seguradora, transportadora ou servico de verificacao de antecedentes.',
        'Voce e responsavel por decidir se, quando e onde vai encontrar outros jogadores. Use bom senso, prefira locais publicos e saia de qualquer situacao que pareca insegura.',
      ],
    ),
    _LegalSectionCopy(
      title: '5. Disponibilidade do servico e mudancas',
      paragraphs: [
        'O Root Hub pode alterar, suspender ou remover recursos a qualquer momento. Nao garantimos que o servico estara sempre disponivel, livre de erros ou adequado para todos os fins.',
      ],
    ),
    _LegalSectionCopy(
      title: '6. Suspensao ou encerramento',
      paragraphs: [
        'Podemos suspender ou encerrar o acesso ao Root Hub se entendermos que voce violou estes Termos, criou risco para outros usuarios ou utilizou o servico de forma nociva ou ilegal.',
      ],
    ),
    _LegalSectionCopy(
      title: '7. Isencoes e limitacao de responsabilidade',
      paragraphs: [
        'O Root Hub e fornecido no estado em que se encontra e conforme disponibilidade. Na maxima medida permitida por lei, o Root Hub afasta garantias de comerciabilidade, adequacao a uma finalidade especifica e nao infracao.',
        'Na maxima medida permitida por lei, o Root Hub nao sera responsavel por danos indiretos, incidentais, especiais, consequenciais, exemplares ou punitivos, nem por perdas decorrentes de interacoes entre usuarios, encontros, conteudo, indisponibilidade ou acesso nao autorizado.',
      ],
    ),
    _LegalSectionCopy(
      title: '8. Alteracoes destes termos',
      paragraphs: [
        'Podemos atualizar estes Termos periodicamente. O uso continuado do Root Hub apos uma atualizacao significa que voce aceita a versao revisada.',
      ],
    ),
  ],
);

class _LegalDocumentCopy {
  const _LegalDocumentCopy({
    required this.pageTitle,
    required this.heroTitle,
    required this.intro,
    required this.lastUpdatedLabel,
    required this.privacyLinkLabel,
    required this.termsLinkLabel,
    required this.accountDeletionLinkLabel,
    required this.inviteLinkLabel,
    required this.sections,
  });

  final String pageTitle;
  final String heroTitle;
  final String intro;
  final String lastUpdatedLabel;
  final String privacyLinkLabel;
  final String termsLinkLabel;
  final String accountDeletionLinkLabel;
  final String inviteLinkLabel;
  final List<_LegalSectionCopy> sections;
}

class _LegalSectionCopy {
  const _LegalSectionCopy({
    required this.title,
    this.paragraphs = const [],
    this.bullets = const [],
  });

  final String title;
  final List<String> paragraphs;
  final List<String> bullets;
}
