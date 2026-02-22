import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/onboarding/onboarding_provider.dart';

class AuthOnboardingScreen extends ConsumerStatefulWidget {
  const AuthOnboardingScreen({
    super.key,
  });

  @override
  ConsumerState<AuthOnboardingScreen> createState() =>
      _AuthOnboardingScreenState();
}

class _AuthOnboardingScreenState extends ConsumerState<AuthOnboardingScreen> {
  static const _fadeStartOffset = 8.0;
  static const _fadeRampDistance = 28.0;
  static const _fadeStops = <double>[0.00, 0.04, 0.09, 0.14, 0.20, 1.00];
  static const _fadeTargetAlphas = <int>[0, 42, 115, 186, 255, 255];

  late final ScrollController _gridScrollController;
  double _topFadeProgress = 0;

  @override
  void initState() {
    super.initState();
    _gridScrollController = ScrollController()..addListener(_onGridScroll);
  }

  @override
  void dispose() {
    _gridScrollController
      ..removeListener(_onGridScroll)
      ..dispose();
    super.dispose();
  }

  void _onGridScroll() {
    if (!_gridScrollController.hasClients) {
      return;
    }

    final nextProgress = _fadeProgressForOffset(_gridScrollController.offset);
    if ((nextProgress - _topFadeProgress).abs() < 0.01) {
      return;
    }

    setState(() {
      _topFadeProgress = nextProgress;
    });
  }

  double _fadeProgressForOffset(double offset) {
    if (offset <= _fadeStartOffset) {
      return 0;
    }

    if (offset >= _fadeStartOffset + _fadeRampDistance) {
      return 1;
    }

    return (offset - _fadeStartOffset) / _fadeRampDistance;
  }

  List<Color> _buildTopMaskColors() {
    return _fadeTargetAlphas
        .map((targetAlpha) {
          final interpolatedAlpha =
              (255 + (targetAlpha - 255) * _topFadeProgress).round();
          return Color.fromARGB(interpolatedAlpha, 0, 0, 0);
        })
        .toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedFaction = ref.watch(onboardingProvider).selectedFaction;
    final hasSelectedFaction = selectedFaction != null;
    final viewPadding = MediaQuery.viewPaddingOf(context);
    final topPadding = viewPadding.top;
    final maskColors = _buildTopMaskColors();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.8),
            radius: 1.25,
            colors: [
              colorScheme.primaryContainer.withValues(alpha: 0.55),
              colorScheme.surface,
              colorScheme.secondaryContainer.withValues(alpha: 0.35),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: topPadding + 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text(
                        'Choose Your Faction',
                        style: GoogleFonts.cinzel(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                          color: colorScheme.onSurface,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: -0.2, end: 0, duration: 400.ms),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Pick your favorite ROOT faction before entering the hub.',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ).animate().fadeIn(delay: 120.ms, duration: 420.ms),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: Stack(
                children: [
                  ShaderMask(
                    blendMode: BlendMode.dstIn,
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: maskColors,
                        stops: _fadeStops,
                      ).createShader(bounds);
                    },
                    child: GridView.builder(
                      controller: _gridScrollController,
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: hasSelectedFaction ? 110 : 0,
                      ),
                      itemCount: Faction.values.length,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            childAspectRatio: 0.75,
                          ),
                      itemBuilder: (context, index) {
                        final faction = Faction.values[index];
                        final isSelected = selectedFaction == faction;

                        return Padding(
                              // padding: EdgeInsets.zero,
                              padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
                              child: GestureDetector(
                                onTap: () {
                                  final notifier = ref.read(
                                    onboardingProvider.notifier,
                                  );
                                  if (isSelected) {
                                    notifier.unselectFaction();
                                    return;
                                  }
                                  notifier.selectFaction(faction);
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 220),
                                  curve: Curves.easeOutCubic,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(
                                      color: isSelected
                                          ? faction.factionColor
                                          : colorScheme.outlineVariant,
                                      width: isSelected ? 2.6 : 1.2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: isSelected ? 24 : 12,
                                        spreadRadius: isSelected ? 1 : 0,
                                        offset: const Offset(0, 8),
                                        color: isSelected
                                            ? faction.factionColor.withValues(
                                                alpha: 0.28,
                                              )
                                            : colorScheme.shadow.withValues(
                                                alpha: 0.08,
                                              ),
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        colorScheme.surfaceContainerHighest
                                            .withValues(
                                              alpha: isSelected ? 0.9 : 0.6,
                                            ),
                                        colorScheme.surfaceContainer.withValues(
                                          alpha: isSelected ? 0.95 : 0.72,
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Hero(
                                          tag:
                                              'faction-image-${faction.toJson()}',
                                          child: Image.asset(
                                            faction.getFactionImage,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        _formatFactionName(faction),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunitoSans(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13,
                                          letterSpacing: 0.2,
                                          color: isSelected
                                              ? faction.factionColor
                                              : colorScheme.onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .animate(delay: (90 * index).ms)
                            .fadeIn(duration: 250.ms)
                            .slideY(begin: 0.18, end: 0, duration: 450.ms);
                      },
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: viewPadding.bottom,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      child: hasSelectedFaction
                          ? Builder(
                              builder: (context) {
                                final faction = selectedFaction;
                                final useDarkForeground =
                                    faction == Faction.riverfolkCompany ||
                                    faction == Faction.keepersInIron;
                                final foregroundColor = useDarkForeground
                                    ? Colors.black
                                    : Colors.white;
                                return SizedBox(
                                      key: ValueKey(faction.toJson()),
                                      height: 58,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await ref
                                              .read(
                                                onboardingProvider.notifier,
                                              )
                                              .persistSelectedFaction();
                                          ref
                                              .read(
                                                authFlowProvider.notifier,
                                              )
                                              .moveToOnboardingProfile();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: faction.factionColor,
                                          foregroundColor: foregroundColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Continue',
                                          style: GoogleFonts.getFont(
                                            'MedievalSharp',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.7,
                                            color: foregroundColor,
                                          ),
                                        ),
                                      ),
                                    )
                                    .animate()
                                    .fadeIn(duration: 240.ms)
                                    .slideY(
                                      begin: 0.25,
                                      end: 0,
                                      duration: 240.ms,
                                    );
                              },
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
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
        .map((word) {
          if (word.isEmpty) {
            return word;
          }
          return '${word[0].toUpperCase()}${word.substring(1)}';
        })
        .join(' ');
  }
}
