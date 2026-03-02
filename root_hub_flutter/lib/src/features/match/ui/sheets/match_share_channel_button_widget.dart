import 'package:flutter/material.dart';

class MatchShareChannelButtonWidget extends StatelessWidget {
  const MatchShareChannelButtonWidget({
    required this.icon,
    required this.label,
    required this.isLoading,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });

  final IconData icon;
  final String label;
  final bool isLoading;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedBackgroundColor =
        backgroundColor ??
        colorScheme.surfaceContainerHighest.withValues(alpha: 0.65);
    final resolvedForegroundColor = foregroundColor ?? colorScheme.onSurface;

    return Expanded(
      child: FilledButton.tonal(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          maximumSize: Size(double.infinity, 50),
          backgroundColor: resolvedBackgroundColor,
          foregroundColor: resolvedForegroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 180),
          child: isLoading
              ? SizedBox(
                  key: ValueKey('loading-$label'),
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.1,
                    color: resolvedForegroundColor,
                  ),
                )
              : Row(
                  key: ValueKey('label-$label'),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 19),
                    SizedBox(width: 7),
                    Flexible(
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
