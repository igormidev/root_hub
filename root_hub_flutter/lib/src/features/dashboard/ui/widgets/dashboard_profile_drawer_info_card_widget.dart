import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardProfileDrawerInfoCardWidget extends StatelessWidget {
  const DashboardProfileDrawerInfoCardWidget({
    required this.icon,
    required this.title,
    required this.value,
    required this.buttonLabel,
    required this.onPressed,
    required this.isLoading,
    super.key,
  });

  final IconData icon;
  final String title;
  final String value;
  final String buttonLabel;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colorScheme.outlineVariant),
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.62),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 34),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: colorScheme.primary),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w800,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        value,
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurfaceVariant,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -4,
            right: -4,
            child: Material(
              color: Colors.transparent,
              shape: CircleBorder(),
              child: Tooltip(
                message: buttonLabel,
                child: InkWell(
                  customBorder: CircleBorder(),
                  onTap: isLoading ? null : onPressed,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: isLoading
                        ? SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(
                            Icons.edit_rounded,
                            size: 18,
                            color: colorScheme.primary,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
