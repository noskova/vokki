import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/common_widgets/alert_dialogs.dart';
import 'package:vokki/src/localization/string_hardcoded.dart';

extension AsyncValueUi on AsyncValue {
  showAlertDialogOnError(BuildContext context) {
    final message = _errorMessage(error);

    if (!isLoading && hasError) {
      showExceptionAlertDialog(
        context: context,
        title: 'Error'.hardcoded,
        exception: message,
      );
    }
  }

  _errorMessage(Object? error) {
    if (error is FirebaseAuthException) {
      return error.message ?? error.toString();
    }
    return error.toString();
  }
}
