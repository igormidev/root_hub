import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_flutter/src/features/home/ui/sections/home_stats_section.dart';
import 'package:root_hub_flutter/src/states/home/home_stats_provider.dart';

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
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
        children: [
          Text(
            'Community Dashboard',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'See how the ROOT platform is evolving and compare it with your own progress.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (hasError && homeStatsState.platformStats != null) ...[
            const SizedBox(height: 12),
            Text(
              '${homeStatsState.loadError!.title}: ${homeStatsState.loadError!.description}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.error,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          const SizedBox(height: 18),
          HomeStatsSection(
            title: 'Community Stats',
            description:
                'Faction performance from all played matches in Root Hub.',
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
          const SizedBox(height: 26),
          HomeStatsSection(
            title: 'My Stats',
            description: 'Your personal faction performance and match profile.',
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
          const SizedBox(height: 16),
          if (homeStatsState.isLoading && homeStatsState.hasLoadedOnce)
            Padding(
              padding: const EdgeInsets.only(top: 4),
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
