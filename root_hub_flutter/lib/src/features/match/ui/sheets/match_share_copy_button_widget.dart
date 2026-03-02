import 'dart:async';

import 'package:flutter/material.dart';

class MatchShareCopyButtonWidget extends StatefulWidget {
  const MatchShareCopyButtonWidget({
    required this.idleLabel,
    required this.copiedLabel,
    required this.onCopy,
    super.key,
  });

  final String idleLabel;
  final String copiedLabel;
  final Future<bool> Function() onCopy;

  @override
  State<MatchShareCopyButtonWidget> createState() =>
      _MatchShareCopyButtonWidgetState();
}

class _MatchShareCopyButtonWidgetState
    extends State<MatchShareCopyButtonWidget> {
  bool _isCopying = false;
  bool _isCopied = false;
  Timer? _resetTimer;

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  Future<void> _handleCopyTap() async {
    if (_isCopying) {
      return;
    }

    setState(() {
      _isCopying = true;
    });

    final didCopy = await widget.onCopy();
    if (!mounted) {
      return;
    }

    setState(() {
      _isCopying = false;
      _isCopied = didCopy;
    });

    _resetTimer?.cancel();
    if (didCopy) {
      _resetTimer = Timer(const Duration(milliseconds: 1700), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _isCopied = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = _isCopied
        ? Colors.green.shade600
        : colorScheme.primary;

    return FilledButton(
      onPressed: _isCopying ? null : _handleCopyTap,
      style: FilledButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        maximumSize: Size(double.infinity, 50),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        disabledBackgroundColor: backgroundColor.withValues(alpha: 0.72),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        child: _isCopying
            ? SizedBox(
                key: ValueKey('copy-loading'),
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.1,
                  color: Colors.white,
                ),
              )
            : Row(
                key: ValueKey(_isCopied ? 'copy-success' : 'copy-idle'),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isCopied ? Icons.check_circle_rounded : Icons.copy_rounded,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    _isCopied ? widget.copiedLabel : widget.idleLabel,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
