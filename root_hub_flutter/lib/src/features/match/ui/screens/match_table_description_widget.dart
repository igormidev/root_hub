import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchTableDescriptionWidget extends StatefulWidget {
  final String description;

  const MatchTableDescriptionWidget({
    required this.description,
    super.key,
  });

  @override
  State<MatchTableDescriptionWidget> createState() =>
      _MatchTableDescriptionWidgetState();
}

class _MatchTableDescriptionWidgetState extends State<MatchTableDescriptionWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final descriptionStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w700,
      height: 1.32,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: widget.description,
            style: descriptionStyle,
          ),
          textDirection: Directionality.of(context),
          maxLines: 2,
          textScaler: MediaQuery.textScalerOf(context),
        )..layout(maxWidth: constraints.maxWidth);

        final shouldShowMore = !_isExpanded && textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.description,
              style: descriptionStyle,
              maxLines: _isExpanded ? null : 2,
              overflow: _isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
            ),
            if (shouldShowMore)
              TextButton(
                onPressed: () {
                  setState(() => _isExpanded = true);
                },
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.only(top: 2),
                ),
                child: Text(
                  t.match.ui_screens_match_table_card_widget.showMore,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
