import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  static void show(
    String? title, {
    BuildContext? context,
    String? description,
    bool isSuccess = false,
  }) async {
    toastification.show(
      context: context,
      type: isSuccess ? ToastificationType.success : ToastificationType.error,
      style: ToastificationStyle.flat,
      title: title != null ? SelectableText(title) : null,
      description: description != null ? SelectableText(description) : null,
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 4),
    );
  }
}
