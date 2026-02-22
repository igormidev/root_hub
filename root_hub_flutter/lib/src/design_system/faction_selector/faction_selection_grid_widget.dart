import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

class FactionSelectionGridWidget extends StatefulWidget {
  const FactionSelectionGridWidget({
    required this.selectedFaction,
    required this.onFactionPressed,
    this.bottomPadding = 0,
    super.key,
  });

  static const _fadeStartOffset = 8.0;
  static const _fadeRampDistance = 28.0;
  static const _fadeStops = <double>[0.00, 0.04, 0.09, 0.14, 0.20, 1.00];
  static const _fadeTargetAlphas = <int>[0, 42, 115, 186, 255, 255];

  final Faction? selectedFaction;
  final ValueChanged<Faction> onFactionPressed;
  final double bottomPadding;

  @override
  State<FactionSelectionGridWidget> createState() =>
      _FactionSelectionGridWidgetState();
}

class _FactionSelectionGridWidgetState
    extends State<FactionSelectionGridWidget> {
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
    if (offset <= FactionSelectionGridWidget._fadeStartOffset) {
      return 0;
    }

    if (offset >=
        FactionSelectionGridWidget._fadeStartOffset +
            FactionSelectionGridWidget._fadeRampDistance) {
      return 1;
    }

    return (offset - FactionSelectionGridWidget._fadeStartOffset) /
        FactionSelectionGridWidget._fadeRampDistance;
  }

  List<Color> _buildTopMaskColors() {
    return FactionSelectionGridWidget._fadeTargetAlphas
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
    final selectedFaction = widget.selectedFaction;
    final maskColors = _buildTopMaskColors();

    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: maskColors,
          stops: FactionSelectionGridWidget._fadeStops,
        ).createShader(bounds);
      },
      child: GridView.builder(
        controller: _gridScrollController,
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: widget.bottomPadding,
        ),
        itemCount: Faction.values.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final faction = Faction.values[index];
          final isSelected = selectedFaction == faction;

          return Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
                child: GestureDetector(
                  onTap: () => widget.onFactionPressed(faction),
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
                              ? faction.factionColor.withValues(alpha: 0.28)
                              : colorScheme.shadow.withValues(alpha: 0.08),
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          colorScheme.surfaceContainerHighest.withValues(
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
                            tag: 'faction-image-${faction.toJson()}',
                            child: Image.asset(
                              faction.getFactionImage,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          faction.displayName,
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
    );
  }
}
