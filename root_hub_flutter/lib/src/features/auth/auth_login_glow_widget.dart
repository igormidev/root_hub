import 'package:flutter/material.dart';

class AuthLoginGlowWidget extends StatelessWidget {
  const AuthLoginGlowWidget({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
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
}
