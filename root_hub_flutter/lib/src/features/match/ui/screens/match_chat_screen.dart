import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/match/ui/dialogs/match_played_match_summary_dialog.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_chat_loading_error_state_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_chat_sender_avatar_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_chat_system_event_message_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_edit_table_sheet.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_chat_image_message_sheet.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_sheet.dart';
import 'package:root_hub_flutter/src/features/match/ui/widgets/match_chat_image_widget.dart';
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
    final isMessageActionInProgress =
        chatState.isSendingMessage || chatState.isUploadingImage;
    final isLoadingInitial =
        !isCurrentChat || (chatState.isLoading && !chatState.hasLoadedOnce);
    final loadError = isCurrentChat ? chatState.loadError : null;
    final playedMatchSummary = isCurrentChat
        ? chatState.playedMatchSummary
        : null;
    final isLoadingPlayedMatchSummary = isCurrentChat
        ? chatState.isLoadingPlayedMatchSummary
        : false;
    final title = widget.matchTitle?.trim().isNotEmpty == true
        ? widget.matchTitle!.trim()
        : 'Match #${widget.scheduledMatchId} Chat';

    final tablesState = ref.watch(matchTablesProvider);
    final currentTable = tablesState.tables
        .where((t) => t.id == widget.scheduledMatchId)
        .firstOrNull;
    final isHost =
        authenticatedPlayer?.id != null &&
        currentTable?.playerDataId == authenticatedPlayer?.id;

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
          if (isMessageActionInProgress)
            Padding(
              padding: EdgeInsets.only(right: 4),
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
          if (isHost && playedMatchSummary == null)
            IconButton(
              tooltip: t.match.ui_screens_match_chat_screen.editTable,
              icon: Icon(Icons.edit_outlined),
              onPressed: () => _openEditSheet(context),
            ),
          if (isLoadingPlayedMatchSummary)
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: Center(
                child: SizedBox(
                  width: 17,
                  height: 17,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.1,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          IconButton(
            tooltip: playedMatchSummary != null
                ? t.match.ui_screens_match_chat_screen.playedMatchInfo
                : t.match.ui_screens_match_chat_screen.tableInfo,
            icon: Icon(
              playedMatchSummary != null
                  ? Icons.emoji_events_rounded
                  : Icons.info_outline_rounded,
            ),
            onPressed: isLoadingPlayedMatchSummary
                ? null
                : playedMatchSummary != null
                ? () {
                    _openPlayedMatchSummaryDialog(playedMatchSummary);
                  }
                : _openTableInfoSheet,
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (currentUserId == null) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  t
                      .match
                      .ui_screens_match_chat_screen
                      .unableToResolveYourAccountInformation,
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
            return MatchChatLoadingErrorStateWidget(
              error: loadError,
              onRetry: () {
                ref.read(matchChatProvider.notifier).refresh();
              },
            );
          }

          return Chat(
            currentUserId: currentUserId,
            theme: ChatTheme.fromThemeData(Theme.of(context)),
            resolveUser: chatNotifier.resolveUser,
            chatController: chatNotifier.chatController,
            onMessageSend: (text) async {
              if (isMessageActionInProgress) {
                return;
              }
              await chatNotifier.sendTextMessage(text);
            },
            onAttachmentTap: isMessageActionInProgress
                ? null
                : () => _pickAndSendImage(
                    chatNotifier,
                    currentUserId: currentUserId,
                  ),
            builders: Builders(
              composerBuilder: (context) => Composer(
                attachmentIcon: Icon(Icons.add_photo_alternate_rounded),
                hintText: t.match.ui_screens_match_chat_screen.typeAMessage,
              ),
              emptyChatListBuilder: (context) => EmptyChatList(
                text: t.match.ui_screens_match_chat_screen.noMessagesYet,
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
                        padding: EdgeInsets.fromLTRB(8, 2, 8, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MatchChatSenderAvatarWidget(
                              profileImageUrl,
                            ),
                            SizedBox(width: 6),
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
                                            color: colorScheme.onSurfaceVariant,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  if (factionIconPath != null) ...[
                                    SizedBox(width: 6),
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
                              SizedBox(width: 6),
                              Container(
                                padding: EdgeInsets.fromLTRB(
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
                                  t
                                      .match
                                      .ui_screens_match_chat_screen
                                      .subscribed,
                                  style: Theme.of(context).textTheme.labelSmall
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
                  }) => MatchChatSystemEventMessageWidget(
                    message: message,
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
                return Padding(
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
    );
  }

  Future<void> _openEditSheet(BuildContext context) async {
    final edited = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return MatchEditTableSheet(
          scheduledMatchId: widget.scheduledMatchId,
        );
      },
    );

    if (edited == true && mounted) {
      await ref.read(matchTablesProvider.notifier).refresh();
    }
  }

  Future<void> _openTableInfoSheet() async {
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
      if (!mounted) {
        return;
      }
      context.pop();
    }
  }

  Future<void> _openPlayedMatchSummaryDialog(
    MatchChatPlayedMatchSummary summary,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return MatchPlayedMatchSummaryDialog(summary: summary);
      },
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
          title: Text(
            t.match.ui_screens_match_chat_screen.imageIsTooLarge,
          ),
          content: Text(
            t.match.ui_screens_match_chat_screen.imageCompressionPrompt(
              selectedImageMb: selectedImageMb,
              maxAllowedMb: maxAllowedMb,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(
                t.match.ui_screens_match_chat_screen.cancel2,
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(
                t.match.ui_screens_match_chat_screen.compress,
              ),
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

  Future<void> _pickAndSendImage(
    MatchChatNotifier chatNotifier, {
    required String currentUserId,
  }) async {
    final source = await _pickImageSource();
    if (!mounted || source == null) {
      return;
    }

    await chatNotifier.pickAndSendImage(
      source: source,
      authorId: currentUserId,
      onConfirmImageCompression: _showImageCompressionDialog,
      onConfirmImageMessage: _showImageMessageDialog,
    );
  }

  Future<String?> _showImageMessageDialog({
    required Uint8List previewBytes,
  }) async {
    if (!mounted) {
      return null;
    }

    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return MatchChatImageMessageSheet(
          previewBytes: previewBytes,
        );
      },
    );
  }

  Future<ImageSource?> _pickImageSource() async {
    final platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS) {
      return _showIosImageSourceDialog();
    }

    return _showAndroidImageSourceDialog();
  }

  Future<ImageSource?> _showIosImageSourceDialog() {
    return showCupertinoModalPopup<ImageSource>(
      context: context,
      builder: (dialogContext) {
        return CupertinoActionSheet(
          title: Text(
            t.match.ui_screens_match_chat_screen.sendAPhoto,
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(dialogContext).pop(ImageSource.camera);
              },
              child: Text(
                t.match.ui_screens_match_chat_screen.takePhoto2,
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(dialogContext).pop(ImageSource.gallery);
              },
              child: Text(
                t.match.ui_screens_match_chat_screen.chooseFromLibrary,
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: Text(
              t.match.ui_screens_match_chat_screen.cancel,
            ),
          ),
        );
      },
    );
  }

  Future<ImageSource?> _showAndroidImageSourceDialog() {
    return showModalBottomSheet<ImageSource>(
      context: context,
      showDragHandle: true,
      builder: (dialogContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_camera_rounded),
                title: Text(
                  t.match.ui_screens_match_chat_screen.takePhoto,
                ),
                onTap: () {
                  Navigator.of(dialogContext).pop(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library_rounded),
                title: Text(
                  t.match.ui_screens_match_chat_screen.chooseFromGallery,
                ),
                onTap: () {
                  Navigator.of(dialogContext).pop(ImageSource.gallery);
                },
              ),
              SizedBox(height: 4),
            ],
          ),
        );
      },
    );
  }
}
