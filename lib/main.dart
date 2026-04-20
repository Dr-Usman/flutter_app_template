import 'package:flutter/material.dart';
import 'package:shapes/modules/onboarding/splash_screen.dart';
import 'package:shapes/services/navigator/navigator_service.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        title: 'Shapes',
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigatorService.navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
