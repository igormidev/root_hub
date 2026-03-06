import 'dart:math' as math;

import 'package:flutter/material.dart';

class SetupOrderArrowWidget extends StatelessWidget {
  const SetupOrderArrowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Transform.rotate(
      angle: math.pi / 2,
      child: SizedBox(
        width: 32,
        height: 32,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: Offset(3, 3),
              child: Icon(
                Icons.play_arrow_rounded,
                size: 30,
                color: colorScheme.shadow.withValues(alpha: 0.16),
              ),
            ),
            Icon(
              Icons.play_arrow_rounded,
              size: 28,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.84),
            ),
          ],
        ),
      ),
    );
  }
}
