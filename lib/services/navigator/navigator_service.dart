import 'package:flutter/material.dart';

class NavigatorService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic>? push(Widget? page) {
    if (page == null) return null;
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static Future<dynamic>? pushReplacement(Widget? page) {
    if (page == null) return null;
    return navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void pushAndRemoveUntil(Widget? page) {
    if (page == null) return;
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      // Use (route) => false to reset everything
      // Use (route) => route.isFirst to keep the home screen
      (route) => false,
    );
  }

  static void pop() {
    navigatorKey.currentState?.pop();
  }

  static void popUntil(RoutePredicate predicate) {
    navigatorKey.currentState?.popUntil(predicate);
  }

  static Future<dynamic>? openDialog(Widget? dialog) {
    if (dialog == null) return null;
    return showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) => dialog,
    );
  }
}
