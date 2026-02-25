import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_flutter/src/features/home/ui/sections/home_stats_section.dart';
import 'package:root_hub_flutter/src/states/home/home_stats_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      ref.read(homeStatsProvider.notifier).ensureLoaded();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeStatsState = ref.watch(homeStatsProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final hasError = homeStatsState.loadError != null;

    return RefreshIndicator(
      onRefresh: () {
        return ref.read(homeStatsProvider.notifier).refresh();
      },
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: EdgeInsets.fromLTRB(0, 4, 0, 28),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              t.home.ui_screens_home_screen.communityDashboard,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              t
                  .home
                  .ui_screens_home_screen
                  .seeHowTheRootPlatformIsEvolvingAndCompareItWithYourOwnProgress,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (hasError && homeStatsState.platformStats != null) ...[
            SizedBox(height: 12),
            Text(
              '${homeStatsState.loadError!.title}: ${homeStatsState.loadError!.description}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.error,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          SizedBox(height: 18),
          HomeStatsSection(
            title: t.home.ui_screens_home_screen.communityStats,
            description: t
                .home
                .ui_screens_home_screen
                .factionPerformanceFromAllPlayedMatchesInRootHub,
            emptyTitle: 'No community stats yet',
            emptyDescription:
                'As soon as players register completed matches, this section will fill with faction trends.',
            onRetry: () {
              ref.read(homeStatsProvider.notifier).loadStats();
            },
            isLoading: homeStatsState.isLoading,
            stats: homeStatsState.platformStats,
            error: homeStatsState.loadError,
          ),
          SizedBox(height: 26),
          HomeStatsSection(
            title: t.home.ui_screens_home_screen.myStats,
            description: t
                .home
                .ui_screens_home_screen
                .yourPersonalFactionPerformanceAndMatchProfile,
            emptyTitle: 'No personal stats yet',
            emptyDescription:
                'Play and register your first match to start your personal dashboard.',
            onRetry: () {
              ref.read(homeStatsProvider.notifier).loadStats();
            },
            isLoading: homeStatsState.isLoading,
            stats: homeStatsState.playerStats,
            error: homeStatsState.loadError,
          ),
          SizedBox(height: 16),
          if (homeStatsState.isLoading && homeStatsState.hasLoadedOnce)
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.6,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
