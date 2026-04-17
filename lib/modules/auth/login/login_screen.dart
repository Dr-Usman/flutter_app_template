import 'package:flutter/material.dart';
import 'package:shapes/core/constants/app_assets.dart';
import 'package:shapes/core/constants/app_colors.dart';
import 'package:shapes/modules/auth/forgot_password/forgot_password_screen.dart';
import 'package:shapes/modules/auth/signup/signup_screen.dart';
import 'package:shapes/shared/utils/navigator_service.dart';
import 'package:shapes/shared/widgets/buttons/custom_icon_button.dart';
import 'package:shapes/shared/widgets/buttons/custom_primary_button.dart';
import 'package:shapes/shared/widgets/buttons/custom_text_button.dart';
import 'package:shapes/shared/widgets/textfields/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(width * 0.05),
            padding: EdgeInsets.all(width * 0.04),

            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.01),

                  Center(
                    child: Text(
                      "Login here",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Center(
                    child: Text(
                      "Welcome back, you've been missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.1),

                  CustomTextField(
                    label: 'Email / Phone number',
                    hintText: 'abc@mail.com or 03234567890',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(label: 'Password', obscureText: true),
                  // SizedBox(height: height * 0.01),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(
                      title: 'Forgot Password?',
                      fontSize: 12,
                      onPressed: () {
                        NavigatorService.push(
                          context,
                          ForgotPasswordScreen(email: 'abc@mail.com'),
                        );
                      },
                    ),
                    // Text(
                    //   "Forgot Password?",
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: AppColors.primary,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                  ),
                  SizedBox(height: height * 0.04),

                  CustomPrimaryButton(
                    title: 'Login',
                    onPressed: () {},
                    // width: double.infinity,
                    // height: 50,
                  ),
                  SizedBox(height: height * 0.02),

                  CustomTextButton(
                    title: 'Create new account',
                    fontSize: 13,
                    onPressed: () {
                      NavigatorService.push(context, SignupScreen());
                    },
                  ),

                  SizedBox(height: height * 0.03),

                  Text(
                    "Or continue with",
                    style: TextStyle(fontSize: 12, color: AppColors.primary),
                  ),
                  SizedBox(height: height * 0.02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        path: AppIcons.google,
                        iconSize: width * 0.08,

                        onPressed: () {},
                      ),
                      SizedBox(width: width * 0.04),

                      CustomIconButton(
                        path: AppIcons.apple,
                        iconSize: width * 0.08,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
