import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class RegisterMatchSuccessDialog extends StatefulWidget {
  const RegisterMatchSuccessDialog({
    super.key,
  });

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return const RegisterMatchSuccessDialog();
      },
    );
  }

  @override
  State<RegisterMatchSuccessDialog> createState() =>
      _RegisterMatchSuccessDialogState();
}

class _RegisterMatchSuccessDialogState
    extends State<RegisterMatchSuccessDialog> {
  late final ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      HapticFeedback.mediumImpact();
      _confettiController.play();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dialogT = t.register_match.ui_dialogs_register_match_success_dialog;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            IgnorePointer(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 14,
                        height: 14,
                        child: ConfettiWidget(
                          confettiController: _confettiController,
                          blastDirectionality: BlastDirectionality.explosive,
                          shouldLoop: false,
                          emissionFrequency: 0.18,
                          numberOfParticles: 36,
                          maxBlastForce: 28,
                          minBlastForce: 14,
                          gravity: 0.18,
                          colors: <Color>[
                            colorScheme.primary,
                            colorScheme.secondary,
                            colorScheme.tertiary,
                            Colors.amber.shade300,
                            Colors.red.shade300,
                            Colors.green.shade300,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 14,
                        height: 14,
                        child: ConfettiWidget(
                          confettiController: _confettiController,
                          blastDirectionality: BlastDirectionality.explosive,
                          shouldLoop: false,
                          emissionFrequency: 0.22,
                          numberOfParticles: 28,
                          maxBlastForce: 24,
                          minBlastForce: 12,
                          gravity: 0.22,
                          colors: <Color>[
                            colorScheme.primary,
                            colorScheme.secondary,
                            colorScheme.tertiary,
                            Colors.orange.shade300,
                            Colors.teal.shade300,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 14,
                        height: 14,
                        child: ConfettiWidget(
                          confettiController: _confettiController,
                          blastDirectionality: BlastDirectionality.explosive,
                          shouldLoop: false,
                          emissionFrequency: 0.22,
                          numberOfParticles: 28,
                          maxBlastForce: 24,
                          minBlastForce: 12,
                          gravity: 0.22,
                          colors: <Color>[
                            colorScheme.primary,
                            colorScheme.secondary,
                            colorScheme.tertiary,
                            Colors.pink.shade300,
                            Colors.lightBlue.shade300,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 420),
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    colorScheme.surface,
                    colorScheme.primaryContainer.withValues(alpha: 0.96),
                    Color.alphaBlend(
                      colorScheme.secondaryContainer.withValues(alpha: 0.72),
                      colorScheme.surface,
                    ),
                  ],
                ),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.55),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.16),
                    blurRadius: 28,
                    offset: const Offset(0, 18),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 650),
                    curve: Curves.easeOutBack,
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value.clamp(0.0, 1.0),
                        child: Transform.scale(
                          scale: value,
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      width: 92,
                      height: 92,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: <Color>[
                            colorScheme.primary,
                            colorScheme.secondary,
                          ],
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: colorScheme.primary.withValues(alpha: 0.28),
                            blurRadius: 22,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.check_rounded,
                        size: 52,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    dialogT.title,
                    textAlign: TextAlign.center,
                    style: textTheme.headlineSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    dialogT.description,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w800,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dialogT.details,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.88,
                      ),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      icon: const Icon(Icons.celebration_rounded),
                      label: Text(dialogT.close),
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
}
