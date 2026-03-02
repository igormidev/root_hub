import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_share_channel_button_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_share_copy_button_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_share_or_divider_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchShareSheet extends StatefulWidget {
  const MatchShareSheet({
    required this.rawLink,
    required this.shareMessage,
    super.key,
  });

  final Uri rawLink;
  final String shareMessage;

  @override
  State<MatchShareSheet> createState() => _MatchShareSheetState();
}

class _MatchShareSheetState extends State<MatchShareSheet> {
  bool _isSharingWhatsApp = false;
  bool _isSharingMessenger = false;
  bool _isSharingTelegram = false;
  bool _isSharingNative = false;

  bool get _isAnyShareInProgress =>
      _isSharingWhatsApp ||
      _isSharingMessenger ||
      _isSharingTelegram ||
      _isSharingNative;

  Future<bool> _copyRawLink() async {
    try {
      await Clipboard.setData(ClipboardData(text: widget.rawLink.toString()));
      await HapticFeedback.lightImpact();
      return true;
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              t.match.ui_sheets_match_share_sheet.copyFailed,
            ),
          ),
        );
      }
      return false;
    }
  }

  Future<void> _shareToWhatsApp() async {
    if (_isAnyShareInProgress) {
      return;
    }

    setState(() {
      _isSharingWhatsApp = true;
    });

    final whatsappUri = Uri.parse(
      'https://wa.me/?text=${Uri.encodeComponent(widget.shareMessage)}',
    );
    final launched = await launchUrl(
      whatsappUri,
      mode: LaunchMode.externalApplication,
    );

    if (mounted && !launched) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            t.match.ui_sheets_match_share_sheet.unableToOpenWhatsApp,
          ),
        ),
      );
    }

    if (mounted) {
      setState(() {
        _isSharingWhatsApp = false;
      });
    }
  }

  Future<void> _shareToMessenger() async {
    if (_isAnyShareInProgress) {
      return;
    }

    setState(() {
      _isSharingMessenger = true;
    });

    final messengerUri = Uri.parse(
      'fb-messenger://share/?link=${Uri.encodeComponent(widget.rawLink.toString())}',
    );
    final launched = await launchUrl(
      messengerUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      await SharePlus.instance.share(
        ShareParams(
          text: widget.shareMessage,
        ),
      );
    }

    if (mounted) {
      setState(() {
        _isSharingMessenger = false;
      });
    }
  }

  Future<void> _shareToTelegram() async {
    if (_isAnyShareInProgress) {
      return;
    }

    setState(() {
      _isSharingTelegram = true;
    });

    final telegramSchemeUri = Uri.parse(
      'tg://msg_url?url=${Uri.encodeComponent(widget.rawLink.toString())}&text=${Uri.encodeComponent(widget.shareMessage)}',
    );
    var launched = await launchUrl(
      telegramSchemeUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      final telegramWebUri = Uri.parse(
        'https://t.me/share/url?url=${Uri.encodeComponent(widget.rawLink.toString())}&text=${Uri.encodeComponent(widget.shareMessage)}',
      );
      launched = await launchUrl(
        telegramWebUri,
        mode: LaunchMode.externalApplication,
      );
    }

    if (mounted && !launched) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            t.match.ui_sheets_match_share_sheet.unableToOpenTelegram,
          ),
        ),
      );
    }

    if (mounted) {
      setState(() {
        _isSharingTelegram = false;
      });
    }
  }

  Future<void> _shareWithSystemDialog() async {
    if (_isAnyShareInProgress) {
      return;
    }

    setState(() {
      _isSharingNative = true;
    });

    await SharePlus.instance.share(
      ShareParams(
        text: widget.shareMessage,
      ),
    );

    if (mounted) {
      setState(() {
        _isSharingNative = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final safeAreaBottom = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(14, 10, 14, 14 + safeAreaBottom),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: colorScheme.outline.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          SizedBox(height: 12),
          Text(
            t.match.ui_sheets_match_share_sheet.shareThisMatch,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 6),
          Text(
            t.match.ui_sheets_match_share_sheet.copyOrShareToInvitePlayers,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(12, 11, 12, 11),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.55,
              ),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.28),
              ),
            ),
            child: SelectableText(
              widget.rawLink.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 10),
          MatchShareCopyButtonWidget(
            idleLabel: t.match.ui_sheets_match_share_sheet.copyLink,
            copiedLabel: t.match.ui_sheets_match_share_sheet.copied,
            onCopy: _copyRawLink,
          ),
          SizedBox(height: 16),
          MatchShareOrDividerWidget(
            label: t.match.ui_sheets_match_share_sheet.orDivider,
          ),
          SizedBox(height: 16),
          MatchShareChannelButtonWidget(
            icon: Icons.chat_bubble_rounded,
            label: t.match.ui_sheets_match_share_sheet.shareInWhatsApp,
            isLoading: _isSharingWhatsApp,
            onPressed: _shareToWhatsApp,
            backgroundColor: Color(0xFFE6FAEC),
            foregroundColor: Color(0xFF0F7A35),
          ),
          SizedBox(height: 8),
          MatchShareChannelButtonWidget(
            icon: Icons.message_rounded,
            label: t.match.ui_sheets_match_share_sheet.shareInMessenger,
            isLoading: _isSharingMessenger,
            onPressed: _shareToMessenger,
            backgroundColor: Color(0xFFE9EEFF),
            foregroundColor: Color(0xFF2D4CB8),
          ),
          SizedBox(height: 8),
          MatchShareChannelButtonWidget(
            icon: Icons.send_rounded,
            label: t.match.ui_sheets_match_share_sheet.shareInTelegram,
            isLoading: _isSharingTelegram,
            onPressed: _shareToTelegram,
            backgroundColor: Color(0xFFE6F4FF),
            foregroundColor: Color(0xFF0F66A0),
          ),
          SizedBox(height: 8),
          MatchShareChannelButtonWidget(
            icon: Icons.ios_share_rounded,
            label: t.match.ui_sheets_match_share_sheet.chooseWhereToShare,
            isLoading: _isSharingNative,
            onPressed: _shareWithSystemDialog,
          ),
        ],
      ),
    );
  }
}
