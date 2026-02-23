import 'dart:async';

import 'package:root_hub_flutter/src/features/match/ui/widgets/match_chat_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_sheet.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/match/match_chat_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';

class MatchChatScreen extends ConsumerStatefulWidget {
  final int scheduledMatchId;
  final String? matchTitle;

  const MatchChatScreen({
    super.key,
    required this.scheduledMatchId,
    this.matchTitle,
  });

  @override
  ConsumerState<MatchChatScreen> createState() => _MatchChatScreenState();
}

class _MatchChatScreenState extends ConsumerState<MatchChatScreen> {
  bool _isShowingActionErrorDialog = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref.read(matchChatProvider.notifier).openChat(widget.scheduledMatchId);
    });
  }

  @override
  void didUpdateWidget(covariant MatchChatScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scheduledMatchId != widget.scheduledMatchId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        ref.read(matchChatProvider.notifier).openChat(widget.scheduledMatchId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final chatState = ref.watch(matchChatProvider);
    final chatNotifier = ref.read(matchChatProvider.notifier);
    final authenticatedPlayer = ref
        .watch(authFlowProvider)
        .maybeWhen(
          authenticated: (playerData) => playerData,
          orElse: () => null,
        );

    final currentUserId = authenticatedPlayer?.id?.toString();
    final isCurrentChat = chatState.scheduledMatchId == widget.scheduledMatchId;
    final isLoadingInitial =
        !isCurrentChat || (chatState.isLoading && !chatState.hasLoadedOnce);
    final loadError = isCurrentChat ? chatState.loadError : null;
    final title = widget.matchTitle?.trim().isNotEmpty == true
        ? widget.matchTitle!.trim()
        : 'Match #${widget.scheduledMatchId} Chat';

    if (chatState.actionError != null && !_isShowingActionErrorDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(_showActionErrorDialog(chatState.actionError!));
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          if (chatState.isSendingMessage || chatState.isUploadingImage)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Center(
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.2,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          IconButton(
            tooltip: 'Table info',
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () => _openTableInfoSheet(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (currentUserId == null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Unable to resolve your account information.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            }

            if (isLoadingInitial) {
              return Center(
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: colorScheme.primary,
                  ),
                ),
              );
            }

            if (loadError != null) {
              return _buildLoadingErrorState(
                context,
                loadError,
              );
            }

            return Chat(
              currentUserId: currentUserId,
              resolveUser: chatNotifier.resolveUser,
              chatController: chatNotifier.chatController,
              onMessageSend: chatNotifier.sendTextMessage,
              onAttachmentTap: () => chatNotifier.pickAndSendImage(
                onConfirmImageCompression: _showImageCompressionDialog,
              ),
              builders: Builders(
                composerBuilder: (context) => const Composer(
                  attachmentIcon: Icon(Icons.photo_library_rounded),
                ),
                chatAnimatedListBuilder: (context, itemBuilder) =>
                    ChatAnimatedList(
                      itemBuilder: itemBuilder,
                      onEndReached: chatState.hasNextPage
                          ? chatNotifier.loadOlderMessages
                          : null,
                    ),
                chatMessageBuilder:
                    (
                      context,
                      message,
                      index,
                      animation,
                      child, {
                      bool? isRemoved,
                      required bool isSentByMe,
                      MessageGroupStatus? groupStatus,
                    }) {
                      final shouldShowSenderHeader =
                          !isSentByMe && (groupStatus?.isFirst ?? true);

                      Widget? headerWidget;
                      if (shouldShowSenderHeader) {
                        final authorId = message.authorId;
                        final isSubscribedSender = chatNotifier
                            .isAuthorSubscribed(
                              authorId,
                            );
                        final profileImageUrl = chatNotifier
                            .profileImageUrlForAuthorId(authorId);
                        final factionIconPath = chatNotifier
                            .factionIconPathForAuthorId(authorId);

                        headerWidget = Padding(
                          padding: const EdgeInsets.fromLTRB(8, 2, 8, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildSenderAvatar(
                                context,
                                profileImageUrl,
                              ),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        chatNotifier.displayNameForAuthorId(
                                          authorId,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color:
                                                  colorScheme.onSurfaceVariant,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ),
                                    if (factionIconPath != null) ...[
                                      const SizedBox(width: 6),
                                      Image.asset(
                                        factionIconPath,
                                        width: 18,
                                        height: 18,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              if (isSubscribedSender) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(
                                    8,
                                    2,
                                    8,
                                    2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(999),
                                    color: colorScheme.primaryContainer,
                                  ),
                                  child: Text(
                                    'Subscribed',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: colorScheme.onPrimaryContainer,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        );
                      }

                      return ChatMessage(
                        message: message,
                        index: index,
                        animation: animation,
                        isRemoved: isRemoved,
                        groupStatus: groupStatus,
                        headerWidget: headerWidget,
                        child: child,
                      );
                    },
                customMessageBuilder:
                    (
                      context,
                      message,
                      index, {
                      required bool isSentByMe,
                      MessageGroupStatus? groupStatus,
                    }) => _buildSystemEventMessage(
                      context,
                      message,
                    ),
                imageMessageBuilder:
                    (
                      context,
                      message,
                      index, {
                      required bool isSentByMe,
                      MessageGroupStatus? groupStatus,
                    }) => MatchChatImageWidget(
                      message: message,
                      index: index,
                    ),
                loadMoreBuilder: (context) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSystemEventMessage(
    BuildContext context,
    CustomMessage message,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final metadata = message.metadata ?? const <String, dynamic>{};
    final type = metadata['type'] as String?;
    final content = metadata['content'] as String? ?? '';
    final isJoin = type == 'systemJoin';

    final localizations = MaterialLocalizations.of(context);
    final sentAt = message.sentAt;
    final timeLabel = sentAt != null
        ? localizations.formatTimeOfDay(
            TimeOfDay.fromDateTime(sentAt.toLocal()),
          )
        : null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      child: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isJoin ? Icons.person_add_rounded : Icons.person_remove_rounded,
                size: 14,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (timeLabel != null) ...[
                const SizedBox(width: 8),
                Text(
                  timeLabel,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openTableInfoSheet(BuildContext context) async {
    final unsubscribed = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return MatchTableInfoSheet(
          scheduledMatchId: widget.scheduledMatchId,
        );
      },
    );

    if (unsubscribed == true && mounted) {
      await ref.read(matchTablesProvider.notifier).refresh();
      if (mounted) {
        context.pop();
      }
    }
  }

  Widget _buildSenderAvatar(
    BuildContext context,
    String? imageUrl,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final normalizedImageUrl = imageUrl?.trim();

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme.surfaceContainerHighest,
        border: Border.all(
          color: colorScheme.outlineVariant,
        ),
      ),
      child: ClipOval(
        child: normalizedImageUrl != null && normalizedImageUrl.isNotEmpty
            ? Image.network(
                normalizedImageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Icon(
                    Icons.person_rounded,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  );
                },
              )
            : Icon(
                Icons.person_rounded,
                size: 16,
                color: colorScheme.onSurfaceVariant,
              ),
      ),
    );
  }

  Future<bool> _showImageCompressionDialog({
    required int imageBytes,
    required int maxBytes,
  }) async {
    if (!mounted) {
      return false;
    }

    final selectedImageMb = _formatMegabytes(imageBytes);
    final maxAllowedMb = _formatMegabytes(maxBytes);

    final shouldCompress = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Image is too large'),
          content: Text(
            'This image is ${selectedImageMb}MB, but the limit is '
            '${maxAllowedMb}MB. Compress it automatically before sending?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Compress'),
            ),
          ],
        );
      },
    );

    return shouldCompress ?? false;
  }

  String _formatMegabytes(int bytes) {
    return (bytes / (1024 * 1024)).toStringAsFixed(1);
  }

  Future<void> _showActionErrorDialog(RootHubException error) async {
    if (_isShowingActionErrorDialog || !mounted) {
      return;
    }

    _isShowingActionErrorDialog = true;
    try {
      await showErrorDialog(
        context,
        title: error.title,
        description: error.description,
      );
      if (!mounted) {
        return;
      }
      ref.read(matchChatProvider.notifier).clearActionError();
    } finally {
      _isShowingActionErrorDialog = false;
    }
  }

  Widget _buildLoadingErrorState(
    BuildContext context,
    RootHubException error,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: colorScheme.error.withValues(alpha: 0.55)),
          color: colorScheme.errorContainer.withValues(alpha: 0.45),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              error.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: colorScheme.onErrorContainer,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              error.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onErrorContainer,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () {
                ref.read(matchChatProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
