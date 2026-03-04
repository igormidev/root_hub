import 'package:flutter/widgets.dart';

/// Overrides Flutter's default text-field tap-outside behavior on mobile.
///
/// By default, Flutter keeps the keyboard open on touch outside an
/// [EditableText] on iOS/Android to match native conventions. Root Hub needs
/// tap-outside to dismiss the keyboard globally.
class MobileKeyboardDismissScope extends StatelessWidget {
  final Widget child;

  const MobileKeyboardDismissScope({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        EditableTextTapOutsideIntent:
            CallbackAction<EditableTextTapOutsideIntent>(
              onInvoke: (intent) {
                intent.focusNode.unfocus();
                return null;
              },
            ),
      },
      child: child,
    );
  }
}
