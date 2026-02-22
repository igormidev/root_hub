import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class AuthLoginScreen extends ConsumerStatefulWidget {
  const AuthLoginScreen({
    super.key,
  });

  @override
  ConsumerState<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends ConsumerState<AuthLoginScreen> {
  static const _carouselInterval = Duration(seconds: 3);

  final _factions = Faction.values;
  late final PageController _pageController;

  Timer? _autoSlideTimer;
  late final int _initialPage;
  double _currentPage = 0;
  bool _requestedLoginCompletion = false;

  @override
  void initState() {
    super.initState();
    _initialPage = _factions.length * 100;
    _pageController = PageController(
      viewportFraction: 0.58,
      initialPage: _initialPage,
    );
    _currentPage = _initialPage.toDouble();
    _pageController.addListener(_onCarouselTick);
    _autoSlideTimer = Timer.periodic(_carouselInterval, _autoSlideForward);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final isAuthenticated = ref.read(clientProvider).auth.isAuthenticated;
      if (isAuthenticated) {
        _requestLoginCompletion();
      }
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController
      ..removeListener(_onCarouselTick)
      ..dispose();
    super.dispose();
  }

  void _onCarouselTick() {
    if (!mounted) {
      return;
    }

    setState(() {
      _currentPage = _pageController.page ?? _currentPage;
    });
  }

  void _autoSlideForward(Timer _) {
    if (!_pageController.hasClients || !mounted) {
      return;
    }

    final next = (_pageController.page ?? _initialPage).round() + 1;
    _pageController.animateToPage(
      next,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubicEmphasized,
    );
  }

  void _requestLoginCompletion() {
    if (_requestedLoginCompletion) {
      return;
    }

    _requestedLoginCompletion = true;
    ref.read(authFlowProvider.notifier).completeLogin();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final client = ref.read(clientProvider);

    ref.listen<AuthFlowState>(authFlowProvider, (_, state) {
      state.map(
        loading: (_) {},
        requiresOnboarding: (_) {
          _requestedLoginCompletion = false;
        },
        requiresLogin: (_) {
          _requestedLoginCompletion = false;
        },
        authenticated: (_) {
          _requestedLoginCompletion = false;
        },
        error: (errorState) {
          _requestedLoginCompletion = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorState.message),
            ),
          );
        },
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primaryContainer.withValues(alpha: 0.42),
              colorScheme.surface,
              colorScheme.secondaryContainer.withValues(alpha: 0.45),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -90,
                left: -80,
                child: _buildGlow(
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              Positioned(
                bottom: 120,
                right: -70,
                child: _buildGlow(
                  color: colorScheme.secondary.withValues(alpha: 0.18),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 18),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 540),
                    child: Column(
                      children: [
                        Text(
                              'Find Your Next ROOT Match',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cinzel(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                                color: colorScheme.onSurface,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 460.ms)
                            .slideY(begin: -0.18, end: 0, duration: 460.ms),
                        const SizedBox(height: 8),
                        Text(
                          'Sign in to browse schedules and join tables.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ).animate().fadeIn(delay: 120.ms, duration: 480.ms),
                        const SizedBox(height: 18),
                        SizedBox(
                              height: 295,
                              child: PageView.builder(
                                controller: _pageController,
                                itemBuilder: (context, index) {
                                  final faction =
                                      _factions[index % _factions.length];
                                  final distance = (_currentPage - index)
                                      .abs()
                                      .clamp(
                                        0.0,
                                        1.8,
                                      );
                                  final progress = (1 - (distance / 1.8)).clamp(
                                    0.0,
                                    1.0,
                                  );
                                  final scale = lerpDouble(
                                    0.7,
                                    1.0,
                                    progress,
                                  )!;
                                  final opacity = lerpDouble(
                                    0.25,
                                    1.0,
                                    progress,
                                  )!;
                                  final yShift = lerpDouble(
                                    34,
                                    0,
                                    progress,
                                  )!;

                                  return Transform.translate(
                                    offset: Offset(0, yShift),
                                    child: Transform.scale(
                                      scale: scale,
                                      child: Opacity(
                                        opacity: opacity,
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              22,
                                            ),
                                            border: Border.all(
                                              color: colorScheme.outlineVariant,
                                              width: 1.2,
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                colorScheme
                                                    .surfaceContainerHighest
                                                    .withValues(alpha: 0.8),
                                                colorScheme.surfaceContainer
                                                    .withValues(alpha: 0.7),
                                              ],
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Image.asset(
                                                    faction.getFactionImage,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  _formatFactionName(faction),
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                    color: faction.factionColor,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 13,
                                                    letterSpacing: 0.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                            .animate()
                            .fadeIn(delay: 200.ms, duration: 500.ms)
                            .slideY(begin: 0.18, end: 0, duration: 500.ms),
                        const SizedBox(height: 18),
                        Container(
                              width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(
                                16,
                                18,
                                16,
                                16,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: colorScheme.outlineVariant,
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    colorScheme.surface.withValues(alpha: 0.95),
                                    colorScheme.surfaceContainerLow.withValues(
                                      alpha: 0.94,
                                    ),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 16),
                                    blurRadius: 34,
                                    color: colorScheme.shadow.withValues(
                                      alpha: 0.12,
                                    ),
                                  ),
                                ],
                              ),
                              child: SignInWidget(
                                client: client,
                                disableAnonymousSignInWidget: true,
                                emailSignInWidget: EmailSignInWidget(
                                  client: client,
                                  startScreen: EmailFlowScreen.login,
                                  onAuthenticated: _requestLoginCompletion,
                                  onError: (error) {
                                    if (!mounted) {
                                      return;
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('$error')),
                                    );
                                  },
                                ),
                                onAuthenticated: _requestLoginCompletion,
                                onError: (error) {
                                  if (!mounted) {
                                    return;
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('$error')),
                                  );
                                },
                              ),
                            )
                            .animate()
                            .fadeIn(delay: 260.ms, duration: 520.ms)
                            .slideY(begin: 0.22, end: 0, duration: 520.ms),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlow({
    required Color color,
  }) {
    return IgnorePointer(
      child: Container(
        width: 220,
        height: 220,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 72,
              spreadRadius: 18,
            ),
          ],
        ),
      ),
    );
  }

  String _formatFactionName(Faction faction) {
    final raw = faction.toJson();
    final withSpaces = raw.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );
    return withSpaces
        .split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }
}
