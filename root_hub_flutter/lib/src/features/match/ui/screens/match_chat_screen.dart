import 'dart:async';
import 'dart:typed_data';

import 'package:chatview/chatview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/match/ui/dialogs/match_played_match_summary_dialog.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_chat_loading_error_state_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_chat_image_message_sheet.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_edit_table_sheet.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_sheet.dart';
import 'package:root_hub_flutter/src/features/match/ui/widgets/match_chat_app_bar_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/widgets/match_chat_custom_message_widget.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/match/match_chat_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';

class MatchChatScreen extends ConsumerStatefulWidget {
  const MatchChatScreen({
    super.key,
    required this.scheduledMatchId,
    this.matchTitle,
  });

  final int scheduledMatchId;
  final String? matchTitle;

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

      ref.read(matchTablesProvider.notifier).ensureLoaded();
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

        ref.read(matchTablesProvider.notifier).ensureLoaded();
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
        chatState.isSendingMessage ||
        chatState.isUploadingImage ||
        chatState.isUploadingAudio;
    final isLoadingInitial =
        !isCurrentChat || (chatState.isLoading && !chatState.hasLoadedOnce);
    final loadError = isCurrentChat ? chatState.loadError : null;
    final playedMatchSummary = isCurrentChat
        ? chatState.playedMatchSummary
        : null;
    final isLoadingPlayedMatchSummary = isCurrentChat
        ? chatState.isLoadingPlayedMatchSummary
        : false;
    final tablesState = ref.watch(matchTablesProvider);
    final currentTable = tablesState.tables
        .where((entry) => entry.id == widget.scheduledMatchId)
        .firstOrNull;
    final isHost =
        authenticatedPlayer?.id != null &&
        currentTable?.playerDataId == authenticatedPlayer?.id;
    final title = currentTable?.title.trim().isNotEmpty == true
        ? currentTable!.title.trim()
        : widget.matchTitle?.trim().isNotEmpty == true
        ? widget.matchTitle!.trim()
        : t.match.ui_screens_match_chat_screen.matchTitleFallback(
            scheduledMatchId: widget.scheduledMatchId.toString(),
          );

    if (chatState.actionError != null && !_isShowingActionErrorDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(_showActionErrorDialog(chatState.actionError!));
      });
    }

    return Scaffold(
      appBar: MatchChatAppBarWidget(
        matchTitle: title,
        currentTable: currentTable,
        isMessageActionInProgress: isMessageActionInProgress,
        isHost: isHost,
        playedMatchSummary: playedMatchSummary,
        isLoadingPlayedMatchSummary: isLoadingPlayedMatchSummary,
        onOpenEdit: () {
          _openEditSheet(context);
        },
        onOpenInfo: _openTableInfoSheet,
        onOpenPlayedSummary: playedMatchSummary == null
            ? null
            : () {
                _openPlayedMatchSummaryDialog(playedMatchSummary);
              },
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

          final chatViewState =
              chatNotifier.chatController.initialMessageList.isEmpty
              ? ChatViewState.noData
              : ChatViewState.hasMessages;

          return ChatView(
            chatController: chatNotifier.chatController,
            chatViewState: chatViewState,
            loadMoreData: chatState.hasNextPage
                ? (direction, _) async {
                    if (direction.isPrevious) {
                      await chatNotifier.loadOlderMessages();
                    }
                  }
                : null,
            isLastPage: () => !chatState.hasNextPage,
            loadingWidget: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
            onSendTap: (message, _, messageType) {
              switch (messageType) {
                case MessageType.text:
                  unawaited(chatNotifier.sendTextMessage(message));
                  break;
                case MessageType.voice:
                  unawaited(chatNotifier.sendVoiceMessage(message));
                  break;
                case MessageType.image:
                case MessageType.custom:
                  break;
              }
            },
            chatBackgroundConfig: ChatBackgroundConfiguration(
              backgroundColor: colorScheme.surface,
            ),
            chatViewStateConfig: ChatViewStateConfiguration(
              noMessageWidgetConfig: ChatViewStateWidgetConfiguration(
                title: t.match.ui_screens_match_chat_screen.noMessagesYet,
              ),
            ),
            profileCircleConfig: ProfileCircleConfiguration(
              circleRadius: 18,
              bottomPadding: 4,
              padding: EdgeInsets.only(left: 4, right: 6),
            ),
            featureActiveConfig: FeatureActiveConfig(
              enableSwipeToReply: false,
              enableReactionPopup: false,
              enableReplySnackBar: false,
              enableDoubleTapToLike: false,
              enablePagination: true,
              enableCurrentUserProfileAvatar: false,
              enableOtherUserProfileAvatar: true,
              enableOtherUserName: true,
              enableScrollToBottomButton: true,
            ),
            chatBubbleConfig: ChatBubbleConfiguration(
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.only(bottom: 8),
              maxWidth: MediaQuery.sizeOf(context).width * 0.74,
              inComingChatBubbleConfig: ChatBubble(
                color: colorScheme.surfaceContainerHighest,
                border: Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.55),
                ),
                borderRadius: BorderRadius.circular(20),
                senderNameTextStyle: Theme.of(context).textTheme.labelLarge
                    ?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w800,
                    ),
                textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              outgoingChatBubbleConfig: ChatBubble(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
                textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w700,
                ),
                receiptsWidgetConfig: ReceiptsWidgetConfig(
                  receiptsBuilder: (_) => SizedBox.shrink(),
                  lastSeenAgoBuilder: (_, __) => SizedBox.shrink(),
                ),
              ),
            ),
            messageConfig: MessageConfiguration(
              customMessageBuilder: (message) {
                return MatchChatCustomMessageWidget(message: message);
              },
              voiceMessageConfig: VoiceMessageConfiguration(
                outgoingPlayerWaveStyle: PlayerWaveStyle(
                  fixedWaveColor: colorScheme.onPrimaryContainer,
                  liveWaveColor: colorScheme.onPrimaryContainer.withValues(
                    alpha: 0.42,
                  ),
                  spacing: 5,
                ),
                inComingPlayerWaveStyle: PlayerWaveStyle(
                  fixedWaveColor: colorScheme.primary,
                  liveWaveColor: colorScheme.primary.withValues(alpha: 0.35),
                  spacing: 5,
                ),
                playIcon: (isMessageBySender) => Icon(
                  Icons.play_arrow_rounded,
                  color: isMessageBySender
                      ? colorScheme.onPrimaryContainer
                      : colorScheme.onSurface,
                ),
                pauseIcon: (isMessageBySender) => Icon(
                  Icons.pause_rounded,
                  color: isMessageBySender
                      ? colorScheme.onPrimaryContainer
                      : colorScheme.onSurface,
                ),
              ),
            ),
            sendMessageConfig: SendMessageConfiguration(
              defaultSendButtonColor: colorScheme.primary,
              textFieldBackgroundColor: colorScheme.surfaceContainerLow,
              allowRecordingVoice: true,
              voiceRecordingConfiguration: VoiceRecordingConfiguration(
                backgroundColor: colorScheme.surfaceContainerHighest,
                recorderIconColor: colorScheme.primary,
              ),
              cancelRecordConfiguration: CancelRecordConfiguration(
                iconColor: colorScheme.error,
              ),
              textFieldConfig: TextFieldConfiguration(
                enabled: !isMessageActionInProgress,
                hintText: t.match.ui_screens_match_chat_screen.typeAMessage,
                hideLeadingActionsOnType: true,
                margin: EdgeInsets.fromLTRB(12, 8, 12, 12),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                borderRadius: BorderRadius.circular(20),
                textCapitalization: TextCapitalization.sentences,
                textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
                trailingActions: (context, _) {
                  return [
                    IconButton(
                      onPressed: isMessageActionInProgress
                          ? null
                          : () {
                              _pickAndSendImage(chatNotifier);
                            },
                      icon: Icon(Icons.add_photo_alternate_rounded),
                      color: colorScheme.primary,
                    ),
                  ];
                },
              ),
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

    final selectedImageMb = (imageBytes / (1024 * 1024)).toStringAsFixed(1);
    final maxAllowedMb = (maxBytes / (1024 * 1024)).toStringAsFixed(1);

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

  Future<void> _pickAndSendImage(MatchChatNotifier chatNotifier) async {
    final source = await _pickImageSource();
    if (!mounted || source == null) {
      return;
    }

    await chatNotifier.pickAndSendImage(
      source: source,
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
