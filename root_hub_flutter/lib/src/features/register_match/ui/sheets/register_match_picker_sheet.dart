import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_wizard_sheet.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_provider.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_state.dart';

class RegisterMatchPickerSheet extends ConsumerStatefulWidget {
  const RegisterMatchPickerSheet({
    super.key,
  });

  @override
  ConsumerState<RegisterMatchPickerSheet> createState() =>
      _RegisterMatchPickerSheetState();
}

class _RegisterMatchPickerSheetState
    extends ConsumerState<RegisterMatchPickerSheet> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      ref.read(registerMatchProvider.notifier).loadPendingMatches();
      ref.read(registerMatchProvider.notifier).refreshPendingMatchesCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final registerState = ref.watch(registerMatchProvider);

    return FractionallySizedBox(
      heightFactor: 0.84,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, registerState.pendingMatchesCount),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref
                      .read(registerMatchProvider.notifier)
                      .loadPendingMatches();
                  await ref
                      .read(registerMatchProvider.notifier)
                      .refreshPendingMatchesCount();
                },
                child: _buildBody(
                  context,
                  registerState,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int pendingMatchesCount) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: colorScheme.outlineVariant,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Register Match Result',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: colorScheme.primaryContainer,
                ),
                child: Text(
                  '$pendingMatchesCount pending',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Select a match you participated in. You can register a result from 2 hours before scheduled start.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    RegisterMatchState registerState,
  ) {
    if (registerState.isLoadingPendingMatches &&
        registerState.pendingMatches.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (registerState.pendingMatchesError != null &&
        registerState.pendingMatches.isEmpty) {
      return _buildErrorState(
        context,
        registerState.pendingMatchesError!,
      );
    }

    if (registerState.pendingMatches.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      padding: const EdgeInsets.fromLTRB(14, 4, 14, 16),
      itemCount: registerState.pendingMatches.length,
      itemBuilder: (context, index) {
        final match = registerState.pendingMatches[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _buildMatchItem(
            context,
            match,
          ),
        );
      },
    );
  }

  Widget _buildMatchItem(
    BuildContext context,
    MatchSchedulePairingAttempt match,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);

    final startAt = match.attemptedAt.toLocal();
    final startAtLabel =
        '${localizations.formatMediumDate(startAt)} • ${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(startAt))}';

    final location = match.location;
    final googlePlace = location?.googlePlaceLocation;
    final manualLocation = location?.manualInputLocation;
    final locationTitle =
        googlePlace?.name ?? manualLocation?.title ?? 'Unknown location';
    final locationSubtitle =
        googlePlace?.shortFormattedAddress ??
        googlePlace?.formattedAddress ??
        manualLocation?.cityName ??
        'Address unavailable';

    final canRegisterNow = !_isTooEarlyToRegister(match);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          _onMatchSelected(match);
        },
        child: Ink(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: colorScheme.outlineVariant,
            ),
            color: colorScheme.surfaceContainerLow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                match.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (match.description?.trim().isNotEmpty == true) ...[
                const SizedBox(height: 4),
                Text(
                  match.description!.trim(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.schedule_rounded,
                    size: 18,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      startAtLabel,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 18,
                    color: colorScheme.secondary,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        Text(
                          locationSubtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: canRegisterNow
                        ? colorScheme.primaryContainer
                        : colorScheme.tertiaryContainer,
                  ),
                  child: Text(
                    canRegisterNow ? 'Tap to report' : 'Not available yet',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: canRegisterNow
                          ? colorScheme.onPrimaryContainer
                          : colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    RootHubException error,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 16),
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: colorScheme.error.withValues(alpha: 0.5)),
            color: colorScheme.errorContainer.withValues(alpha: 0.32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                error.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onErrorContainer,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                error.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onErrorContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () {
                  ref.read(registerMatchProvider.notifier).loadPendingMatches();
                },
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 16),
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: colorScheme.outlineVariant),
            color: colorScheme.surfaceContainerLow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No pending matches',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'You do not have any hosted/subscribed match pending result registration.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _isTooEarlyToRegister(MatchSchedulePairingAttempt match) {
    final earliestAllowedRegistrationTime = match.attemptedAt.subtract(
      const Duration(hours: 2),
    );
    return DateTime.now().isBefore(earliestAllowedRegistrationTime);
  }

  Future<void> _onMatchSelected(MatchSchedulePairingAttempt match) async {
    if (_isTooEarlyToRegister(match)) {
      final localizations = MaterialLocalizations.of(context);
      final earliestAllowedRegistrationTime = match.attemptedAt
          .subtract(const Duration(hours: 2))
          .toLocal();
      final earliestAllowedRegistrationTimeLabel =
          '${localizations.formatMediumDate(earliestAllowedRegistrationTime)} • '
          '${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(earliestAllowedRegistrationTime))}';

      await showErrorDialog(
        context,
        title: 'Result registration not available yet',
        description:
            'You can register this match from 2 hours before its scheduled start. '
            'Try again after $earliestAllowedRegistrationTimeLabel.',
      );
      return;
    }

    final submitted = await _openMatchWizard(match);
    if (submitted != true || !mounted) {
      return;
    }

    await ref.read(registerMatchProvider.notifier).loadPendingMatches();
    await ref.read(registerMatchProvider.notifier).refreshPendingMatchesCount();

    if (!mounted) {
      return;
    }

    Navigator.of(context).pop(true);
  }

  Future<bool?> _openMatchWizard(MatchSchedulePairingAttempt match) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      return showCupertinoModalPopup<bool>(
        context: context,
        barrierDismissible: false,
        builder: (sheetContext) {
          final size = MediaQuery.sizeOf(sheetContext);
          return SizedBox(
            width: size.width,
            height: size.height,
            child: RegisterMatchWizardSheet(
              scheduledMatch: match,
            ),
          );
        },
      );
    }

    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        final size = MediaQuery.sizeOf(sheetContext);
        return SizedBox(
          width: size.width,
          height: size.height,
          child: RegisterMatchWizardSheet(
            scheduledMatch: match,
          ),
        );
      },
    );
  }
}
