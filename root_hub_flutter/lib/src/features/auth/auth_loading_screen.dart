import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class AuthLoadingScreen extends StatelessWidget {
  static const _logoSize = 104.0;
  static const _logoLift = -58.0;
  static const _detailsOffsetY = 94.0;
  static const _backgroundEdgeColor = Color(0xFFF0D9CA);
  static const _backgroundCenterColor = Color(0xFFF8F4F0);
  static const _wordmarkColor = Color(0xFF2B1C16);
  static const _loaderColor = Color(0xFFA96B3A);

  const AuthLoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  _backgroundEdgeColor,
                  _backgroundCenterColor,
                  _backgroundCenterColor,
                  _backgroundEdgeColor,
                ],
                stops: [0, 0.34, 0.66, 1],
              ),
            ),
          ).animate().fadeIn(duration: 650.ms, curve: Curves.easeOutCubic),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/app_logo.png',
                  width: _logoSize,
                  height: _logoSize,
                  filterQuality: FilterQuality.high,
                ).animate().moveY(
                  begin: 0,
                  end: _logoLift,
                  delay: 220.ms,
                  duration: 650.ms,
                  curve: Curves.easeInOutCubicEmphasized,
                ),
                Transform.translate(
                  offset: const Offset(0, _detailsOffsetY),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                            t.auth.auth_loading_screen.rootHub,
                            style: GoogleFonts.cinzel(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.6,
                              color: _wordmarkColor,
                            ),
                          )
                          .animate()
                          .fadeIn(
                            delay: 360.ms,
                            duration: 420.ms,
                            curve: Curves.easeOutCubic,
                          )
                          .moveY(
                            begin: 12,
                            end: 0,
                            delay: 360.ms,
                            duration: 420.ms,
                            curve: Curves.easeOutCubic,
                          ),
                      SizedBox(height: 18),
                      SizedBox(
                            width: 28,
                            height: 28,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.6,
                              color: _loaderColor,
                            ),
                          )
                          .animate()
                          .fadeIn(
                            delay: 520.ms,
                            duration: 320.ms,
                            curve: Curves.easeOutCubic,
                          )
                          .moveY(
                            begin: 10,
                            end: 0,
                            delay: 520.ms,
                            duration: 320.ms,
                            curve: Curves.easeOutCubic,
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
