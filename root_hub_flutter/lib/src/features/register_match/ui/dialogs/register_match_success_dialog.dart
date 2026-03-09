import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/design_system/success_celebration_dialog.dart';

class RegisterMatchSuccessDialog extends StatelessWidget {
  const RegisterMatchSuccessDialog({
    super.key,
  });

  static Future<void> show(BuildContext context) {
    final dialogT = t.register_match.ui_dialogs_register_match_success_dialog;

    return SuccessCelebrationDialog.show(
      context,
      title: dialogT.title,
      description: dialogT.description,
      details: dialogT.details,
      closeLabel: dialogT.close,
    );
  }

  @override
  Widget build(BuildContext context) {
    final dialogT = t.register_match.ui_dialogs_register_match_success_dialog;

    return SuccessCelebrationDialog(
      title: dialogT.title,
      description: dialogT.description,
      details: dialogT.details,
      closeLabel: dialogT.close,
    );
  }
}
