import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthLoadingScreen extends StatelessWidget {
  const AuthLoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primaryContainer,
              colorScheme.surface,
              colorScheme.secondaryContainer,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                    'ROOT HUB',
                    style: GoogleFonts.cinzel(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      color: colorScheme.onSurface,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.2, end: 0, duration: 500.ms),
              const SizedBox(height: 18),
              SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.6,
                      color: colorScheme.primary,
                    ),
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 1300.ms),
            ],
          ),
        ),
      ),
    );
  }
}
