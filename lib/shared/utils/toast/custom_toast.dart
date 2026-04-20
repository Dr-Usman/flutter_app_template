import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  static void show({
    BuildContext? context,
    String? title,
    String? description,
    bool isSuccess = false,
  }) async {
    toastification.show(
      context: context,
      type: isSuccess ? ToastificationType.success : ToastificationType.error,
      style: ToastificationStyle.flat,
      title: Text(title ?? ""),
      description: Text(description ?? ""),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 4),
    );
  }
}
