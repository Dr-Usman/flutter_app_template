import 'package:flutter/material.dart';
import 'package:shapes/services/navigator/navigator_service.dart';

class CustomLoadingDialog {
  static final CustomLoadingDialog _instance = CustomLoadingDialog._internal();
  factory CustomLoadingDialog() => _instance;
  CustomLoadingDialog._internal();

  static bool _isShowing = false;

  static void show({String? message}) async {
    final context = NavigatorService.navigatorKey.currentContext;
    // final context = Navigator.of(
    //   NavigatorService.navigatorKey.currentContext!,
    // ).overlay!.context;

    if (_isShowing || context == null) return;

    _isShowing = true;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            if (message != null) ...[
              SizedBox(height: 16),
              Text(message, style: TextStyle(color: Colors.white)),
            ],
          ],
        ),
      ),
    );
    _isShowing = false;
  }

  static void hide() {
    if (!_isShowing) return;
    _isShowing = false;

    NavigatorService.pop();
  }
}
