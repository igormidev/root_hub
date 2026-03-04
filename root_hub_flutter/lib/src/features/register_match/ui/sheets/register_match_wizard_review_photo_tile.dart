part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardReviewPhotoTile extends StatelessWidget {
  const _RegisterMatchWizardReviewPhotoTile({
    required this.title,
    required this.image,
  });

  final String title;
  final _ProofImageSelection? image;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withValues(alpha: 0.35),
            colorScheme.secondary.withValues(alpha: 0.28),
          ],
        ),
      ),
      padding: EdgeInsets.all(1.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Container(
          color: colorScheme.surface,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 96,
                  height: 96,
                  child: image == null
                      ? DecoratedBox(
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                          ),
                          child: Icon(
                            Icons.image_outlined,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        )
                      : Image.memory(
                          image!.bytes,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.getFont(
                    'MedievalSharp',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
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
