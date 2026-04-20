import 'package:flutter/material.dart';
import 'package:shapes/core/constants/app_assets.dart';
import 'package:shapes/core/constants/app_colors.dart';
import 'package:shapes/modules/auth/login/login_screen.dart';
import 'package:shapes/modules/auth/signup/signup_screen.dart';
import 'package:shapes/services/navigator/navigator_service.dart';
import 'package:shapes/shared/widgets/buttons/custom_primary_button.dart';
import 'package:shapes/shared/widgets/buttons/custom_text_button.dart';
import 'package:shapes/shared/widgets/images/custom_svg_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacer(),
            // SizedBox(height: height * 0.01),
            CustomSvgWidget(
              assetPath: AppImages.athletesTraining,
              width: width * 0.8,
              height: height * 0.4,
            ),
            SizedBox(height: height * 0.02),

            Center(
              child: Text(
                "Welcome to Shapes",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Center(
              child: Text(
                "Get in Shape with Shapes: \nYour Ultimate Fitness Companion",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
              ),
            ),
            SizedBox(height: height * 0.1),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomPrimaryButton(
                      title: 'Login',
                      onPressed: () {
                        NavigatorService.push(LoginScreen());
                      },
                    ),
                  ),
                  SizedBox(width: width * 0.05),

                  Expanded(
                    child: CustomTextButton(
                      title: 'Register',
                      fontWeight: FontWeight.bold,
                      onPressed: () {
                        NavigatorService.push(SignupScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Spacer(),
            // Image.asset(
            //   AppLogos.nextbridge,
            //   width: width * 0.3,
            //   height: height * 0.1,
            // ),
          ],
        ),
      ),
    );
  }
}
