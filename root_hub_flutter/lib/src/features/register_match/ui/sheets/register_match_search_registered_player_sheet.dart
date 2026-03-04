import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class RegisterMatchSearchRegisteredPlayerSheet extends ConsumerStatefulWidget {
  const RegisterMatchSearchRegisteredPlayerSheet({
    super.key,
    required this.activeRegisteredPlayerIds,
  });

  final Set<int> activeRegisteredPlayerIds;

  static Future<RegisteredPlayerSearchResult?> show(
    BuildContext context, {
    required Set<int> activeRegisteredPlayerIds,
  }) {
    return showModalBottomSheet<RegisteredPlayerSearchResult>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) {
        return RegisterMatchSearchRegisteredPlayerSheet(
          activeRegisteredPlayerIds: activeRegisteredPlayerIds,
        );
      },
    );
  }

  @override
  ConsumerState<RegisterMatchSearchRegisteredPlayerSheet> createState() =>
      _RegisterMatchSearchRegisteredPlayerSheetState();
}

class _RegisterMatchSearchRegisteredPlayerSheetState
    extends ConsumerState<RegisterMatchSearchRegisteredPlayerSheet> {
  late final TextEditingController _searchController;
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);

    Future<void>.microtask(() async {
      await ref
          .read(registerMatchProvider.notifier)
          .searchRegisteredPlayers('');
    });
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    ref.read(registerMatchProvider.notifier).clearRegisteredPlayersSearch();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
    _searchDebounce?.cancel();
    _searchDebounce = Timer(Duration(milliseconds: 320), () {
      ref
          .read(registerMatchProvider.notifier)
          .searchRegisteredPlayers(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final registerState = ref.watch(registerMatchProvider);
    final players = registerState.registeredPlayersSearchResults;
    final isSearching = registerState.isSearchingRegisteredPlayers;
    final searchError = registerState.registeredPlayersSearchError;
    final query = _searchController.text.trim();

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.74,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 6, 16, 8),
                child: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_search_registered_player_sheet
                      .addRegisteredPlayer,
                  style:
                      Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextField(
                  controller: _searchController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelText: t
                        .register_match
                        .ui_sheets_register_match_search_registered_player_sheet
                        .searchByDisplayName,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search_rounded),
                    suffixIcon: query.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              _searchController.clear();
                            },
                            icon: Icon(Icons.close_rounded),
                          ),
                  ),
                ),
              ),
              if (searchError != null)
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: colorScheme.errorContainer.withValues(alpha: 0.4),
                      border: Border.all(color: colorScheme.error),
                    ),
                    child: Text(
                      searchError.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onErrorContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              Divider(height: 1),
              Expanded(
                child: isSearching && players.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : players.isEmpty
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            query.isEmpty
                                ? t
                                      .register_match
                                      .ui_sheets_register_match_search_registered_player_sheet
                                      .noRegisteredPlayersWereFound
                                : t
                                      .register_match
                                      .ui_sheets_register_match_search_registered_player_sheet
                                      .noPlayersFoundForQuery(query: query),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: players.length,
                        itemBuilder: (context, index) {
                          final player = players[index];
                          final alreadyAdded = widget.activeRegisteredPlayerIds
                              .contains(player.playerDataId);

                          return ListTile(
                            leading: Icon(Icons.verified_user_rounded),
                            title: Text(player.displayName),
                            subtitle: Text(
                              alreadyAdded
                                  ? t
                                        .register_match
                                        .ui_sheets_register_match_search_registered_player_sheet
                                        .alreadyAddedToThisReport
                                  : t
                                        .register_match
                                        .ui_sheets_register_match_search_registered_player_sheet
                                        .tapToAdd,
                            ),
                            enabled: !alreadyAdded,
                            onTap: alreadyAdded
                                ? null
                                : () {
                                    Navigator.of(context).pop(player);
                                  },
                          );
                        },
                      ),
              ),
              if (isSearching && players.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Center(
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
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
