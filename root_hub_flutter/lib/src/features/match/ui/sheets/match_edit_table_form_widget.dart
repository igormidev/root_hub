import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_edit_table_counter_column_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_edit_table_drag_handle_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_edit_table_section_title_widget.dart';

class MatchEditTableFormWidget extends StatelessWidget {
  final bool closedForSubscriptions;
  final ValueChanged<bool> onClosedForSubscriptionsChanged;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final int currentSubscriberCount;
  final int minPlayers;
  final int maxPlayers;
  final VoidCallback? onMinDecrease;
  final VoidCallback? onMinIncrease;
  final VoidCallback? onMaxDecrease;
  final VoidCallback? onMaxIncrease;
  final int maxScheduleDays;
  final String dateLabel;
  final String timeLabel;
  final VoidCallback onPickDate;
  final VoidCallback onPickTime;
  final bool isSaving;
  final VoidCallback onCancel;
  final VoidCallback onSaveChanges;

  const MatchEditTableFormWidget({
    super.key,
    required this.closedForSubscriptions,
    required this.onClosedForSubscriptionsChanged,
    required this.titleController,
    required this.descriptionController,
    required this.currentSubscriberCount,
    required this.minPlayers,
    required this.maxPlayers,
    required this.onMinDecrease,
    required this.onMinIncrease,
    required this.onMaxDecrease,
    required this.onMaxIncrease,
    required this.maxScheduleDays,
    required this.dateLabel,
    required this.timeLabel,
    required this.onPickDate,
    required this.onPickTime,
    required this.isSaving,
    required this.onCancel,
    required this.onSaveChanges,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        const MatchEditTableDragHandleWidget(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 4, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Table',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Edit Details',
                  style: GoogleFonts.cinzel(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.fromLTRB(14, 6, 6, 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: closedForSubscriptions
                          ? colorScheme.error.withValues(alpha: 0.5)
                          : colorScheme.outlineVariant,
                    ),
                    color: closedForSubscriptions
                        ? colorScheme.errorContainer.withValues(alpha: 0.3)
                        : colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.5,
                          ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        closedForSubscriptions
                            ? Icons.lock_rounded
                            : Icons.lock_open_rounded,
                        color: closedForSubscriptions
                            ? colorScheme.error
                            : colorScheme.onSurfaceVariant,
                        size: 22,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Close subscriptions',
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            Text(
                              closedForSubscriptions
                                  ? 'New players cannot join this table.'
                                  : 'New players can still join this table.',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: closedForSubscriptions,
                        onChanged: onClosedForSubscriptionsChanged,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const MatchEditTableSectionTitleWidget(
                  title: 'Table title',
                  description: 'A short name so players can find your table.',
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  maxLength: 80,
                  decoration: InputDecoration(
                    hintText: 'Example: Saturday ROOT at Lantern Café',
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const MatchEditTableSectionTitleWidget(
                  title: 'Description (optional)',
                  description:
                      'Extra details like expansions, parking tips, etc.',
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: descriptionController,
                  minLines: 2,
                  maxLines: 5,
                  maxLength: 400,
                  decoration: InputDecoration(
                    hintText: 'Example: We have Marauder expansion.',
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MatchEditTableSectionTitleWidget(
                  title: 'Players range',
                  description: currentSubscriberCount > 0
                      ? '$currentSubscriberCount player(s) already subscribed.'
                      : 'Set between 2 and 6 players.',
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colorScheme.outlineVariant),
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: MatchEditTableCounterColumnWidget(
                          title: 'Minimum',
                          value: minPlayers,
                          onDecrease: onMinDecrease,
                          onIncrease: onMinIncrease,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 62,
                        color: colorScheme.outlineVariant,
                      ),
                      Expanded(
                        child: MatchEditTableCounterColumnWidget(
                          title: 'Maximum',
                          value: maxPlayers,
                          onDecrease: onMaxDecrease,
                          onIncrease: onMaxIncrease,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                MatchEditTableSectionTitleWidget(
                  title: 'Schedule',
                  description:
                      'Must be at least 10 minutes from now, up to '
                      '$maxScheduleDays days ahead.',
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.tonalIcon(
                        onPressed: onPickDate,
                        icon: const Icon(Icons.calendar_month_rounded),
                        label: Text(dateLabel),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FilledButton.tonalIcon(
                        onPressed: onPickTime,
                        icon: const Icon(Icons.access_time_rounded),
                        label: Text(timeLabel),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 14),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: isSaving ? null : onSaveChanges,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 52),
                      maximumSize: const Size(double.infinity, 52),
                    ),
                    icon: isSaving
                        ? SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.onPrimary,
                            ),
                          )
                        : const Icon(Icons.check_rounded),
                    label: Text(isSaving ? 'Saving...' : 'Save Changes'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
