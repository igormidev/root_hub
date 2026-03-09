import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/features/chat/ui/widgets/chat_filter_bar_widget.dart';
import 'package:root_hub_flutter/src/features/chat/ui/widgets/chat_match_list_tile_widget.dart';
import 'package:root_hub_flutter/src/states/activity/activity_provider.dart';

enum _ChatInboxFilter {
  all,
  unread,
}

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  ChatListController? _chatListController;
  _ChatInboxFilter _selectedFilter = _ChatInboxFilter.all;
  final Map<String, int> _chatSortIndexById = <String, int>{};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      ref.read(activityProvider.notifier).ensureLoaded();
      ref.read(activityProvider.notifier).ensureUnreadCountLoaded();
    });
  }

  @override
  void dispose() {
    _chatListController?.dispose();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activityState = ref.watch(activityProvider);
    final filteredItems = _applyFilter(activityState.chatItems);
    final mappedChatItems = filteredItems.map(_toChatListItem).toList();
    final loadError = activityState.loadError;

    if (activityState.isLoading &&
        !activityState.hasLoadedOnce &&
        activityState.chatItems.isEmpty) {
      return Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(strokeWidth: 3),
        ),
      );
    }

    if (loadError != null && activityState.chatItems.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                loadError.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 8),
              Text(
                loadError.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 18),
              FilledButton(
                onPressed: () {
                  ref.read(activityProvider.notifier).refresh();
                },
                child: Text(
                  t.match.ui_sheets_match_table_info_error_widget.retry,
                ),
              ),
            ],
          ),
        ),
      );
    }

    _updateChatSortIndexById(filteredItems);
    _ensureChatListController(mappedChatItems);

    return RefreshIndicator(
      onRefresh: () => ref.read(activityProvider.notifier).refresh(),
      child: ChatList(
        key: ValueKey(_selectedFilter),
        controller: _chatListController!,
        backgroundColor: Theme.of(context).colorScheme.surface,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          indent: 88,
          endIndent: 16,
          color: Theme.of(context).colorScheme.outlineVariant.withValues(
            alpha: 0.45,
          ),
        ),
        searchConfig: SearchConfig(
          textEditingController: _searchController,
          hintText: t.activity.ui_screens_chat_screen.searchChats,
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          onSearch: _searchChats,
        ),
        header: ChatFilterBarWidget(
          allLabel: t.activity.ui_screens_chat_screen.allFilter,
          unreadLabel: t.activity.ui_screens_chat_screen.unreadFilter,
          showAllSelected: _selectedFilter == _ChatInboxFilter.all,
          showUnreadSelected: _selectedFilter == _ChatInboxFilter.unread,
          onAllTap: () {
            _changeFilter(_ChatInboxFilter.all, activityState.chatItems);
          },
          onUnreadTap: () {
            _changeFilter(_ChatInboxFilter.unread, activityState.chatItems);
          },
        ),
        chatBuilder: (context, chat) {
          final chatItem = filteredItems
              .where((item) => item.scheduledMatchId.toString() == chat.id)
              .firstOrNull;
          if (chatItem == null) {
            return SizedBox.shrink();
          }

          return ChatMatchListTileWidget(
            chatItem: chatItem,
            onTap: () {
              _openChat(chatItem.scheduledMatchId, chatItem.matchTitle);
            },
          );
        },
        stateConfig: ListStateConfig(
          noChatsWidgetConfig: ChatViewStateWidgetConfiguration(
            title: t.activity.ui_screens_chat_screen.noChatsTitle,
            subTitle: t.activity.ui_screens_chat_screen.noChatsDescription,
          ),
          noSearchChatsWidgetConfig: ChatViewStateWidgetConfiguration(
            title: t.activity.ui_screens_chat_screen.noSearchResultsTitle,
            subTitle:
                t.activity.ui_screens_chat_screen.noSearchResultsDescription,
          ),
        ),
      ),
    );
  }

  void _changeFilter(
    _ChatInboxFilter nextFilter,
    List<MatchChatActivityChatItem> allItems,
  ) {
    if (_selectedFilter == nextFilter) {
      return;
    }

    setState(() {
      _selectedFilter = nextFilter;
    });
    _applySearchState(allItems);
  }

  List<ChatListItem>? _searchChats(String query) {
    final items = _applyFilter(ref.read(activityProvider).chatItems);
    final normalizedQuery = query.trim().toLowerCase();
    if (normalizedQuery.isEmpty) {
      return items.map(_toChatListItem).toList();
    }

    return items
        .where((item) {
          final locationLabel = item.locationSubtitle == null
              ? item.locationTitle
              : '${item.locationTitle} ${item.locationSubtitle}';
          final messagePreview =
              item.lastMessagePreview?.toLowerCase() ??
              item.lastMessageSenderDisplayName?.toLowerCase() ??
              '';
          return item.matchTitle.toLowerCase().contains(normalizedQuery) ||
              locationLabel.toLowerCase().contains(normalizedQuery) ||
              messagePreview.contains(normalizedQuery);
        })
        .map(_toChatListItem)
        .toList();
  }

  List<MatchChatActivityChatItem> _applyFilter(
    List<MatchChatActivityChatItem> items,
  ) {
    return switch (_selectedFilter) {
      _ChatInboxFilter.all => items,
      _ChatInboxFilter.unread =>
        items.where((item) => item.unreadMessagesCount > 0).toList(),
    };
  }

  void _applySearchState(List<MatchChatActivityChatItem> allItems) {
    final normalizedQuery = _searchController.text.trim();
    if (normalizedQuery.isEmpty) {
      _chatListController?.clearSearch();
      return;
    }

    final searchResults = _searchChats(normalizedQuery);
    if (searchResults == null) {
      _chatListController?.clearSearch();
      return;
    }

    _chatListController?.setSearchChats(searchResults);
  }

  void _ensureChatListController(List<ChatListItem> chatItems) {
    if (_chatListController == null) {
      _chatListController = ChatListController(
        initialChatList: chatItems,
        scrollController: _scrollController,
        disposeOtherResources: false,
        chatSorter: _sortChatListItems,
      );
      return;
    }

    final existingIds = _chatListController!.chatListMap.keys.toSet();
    final nextIds = chatItems.map((item) => item.id).toSet();

    for (final removedId in existingIds.difference(nextIds)) {
      _chatListController!.removeChat(removedId);
    }

    for (final item in chatItems) {
      if (existingIds.contains(item.id)) {
        _chatListController!.updateChat(item.id, (_) => item);
      } else {
        _chatListController!.addChat(item);
      }
    }

    _applySearchState(ref.read(activityProvider).chatItems);
  }

  int _sortChatListItems(ChatListItem a, ChatListItem b) {
    final aIndex = _chatSortIndexById[a.id] ?? 0;
    final bIndex = _chatSortIndexById[b.id] ?? 0;
    return aIndex.compareTo(bIndex);
  }

  void _updateChatSortIndexById(List<MatchChatActivityChatItem> items) {
    _chatSortIndexById
      ..clear()
      ..addEntries(
        items.indexed.map(
          (entry) => MapEntry(entry.$2.scheduledMatchId.toString(), entry.$1),
        ),
      );
  }

  ChatListItem _toChatListItem(MatchChatActivityChatItem item) {
    return ChatListItem(
      id: item.scheduledMatchId.toString(),
      name: item.matchTitle,
      unreadCount: item.unreadMessagesCount,
      lastMessage: Message(
        id: item.chatHistoryId.toString(),
        message: item.lastMessagePreview ?? item.matchTitle,
        createdAt: (item.lastMessageAt ?? item.attemptedAt).toLocal(),
        sentBy: item.lastMessageSenderDisplayName ?? '',
        messageType: _resolveMessageType(item),
        status: MessageStatus.delivered,
      ),
    );
  }

  MessageType _resolveMessageType(MatchChatActivityChatItem item) {
    return switch (item.lastMessageType) {
      MatchChatMessageType.userVoiceMessage => MessageType.voice,
      MatchChatMessageType.systemJoin ||
      MatchChatMessageType.systemLeave => MessageType.custom,
      MatchChatMessageType.userMessage =>
        item.lastMessagePreview?.trim().isNotEmpty == true
            ? MessageType.text
            : MessageType.image,
      null => MessageType.text,
    };
  }

  Future<void> _openChat(int scheduledMatchId, String matchTitle) async {
    await context.push(
      dashboardMatchChatPathForMatch(scheduledMatchId),
      extra: matchTitle,
    );

    if (!mounted) {
      return;
    }

    await ref.read(activityProvider.notifier).refresh();
  }
}
