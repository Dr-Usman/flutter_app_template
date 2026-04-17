import 'package:flutter/material.dart';
import 'package:shapes/core/constants/app_assets.dart';
import 'package:shapes/core/constants/app_colors.dart';
import 'package:shapes/modules/onboarding/welcome_screen.dart';
import 'package:shapes/shared/utils/navigator_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1));

    NavigatorService.pushReplacement(context, const WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: Image.asset(AppLogos.logoWhite, width: width * 0.3)),
    );
  }
}
