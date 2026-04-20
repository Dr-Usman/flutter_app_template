import 'package:flutter/material.dart';
import 'package:shapes/core/constants/app_assets.dart';
import 'package:shapes/core/constants/app_colors.dart';
import 'package:shapes/modules/auth/otp/otp_screen.dart';
import 'package:shapes/services/navigator/navigator_service.dart';
import 'package:shapes/shared/widgets/buttons/custom_primary_button.dart';
import 'package:shapes/shared/widgets/buttons/custom_text_button.dart';
import 'package:shapes/shared/widgets/images/custom_svg_widget.dart';
import 'package:shapes/shared/widgets/textfields/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    print(
      'ForgotPasswordScreen build called with width: $width and height: $height',
    );

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

                  CustomSvgWidget(
                    assetPath: AppImages.forgotPassword,
                    width: width * 0.3,
                    height: height * 0.2,
                  ),
                  SizedBox(height: height * 0.01),

                  Center(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Center(
                    child: Text(
                      "Enter your email or phone number to reset your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),

                  CustomTextField(
                    label: 'Email / Phone number',
                    hintText: 'abc@mail.com or 03234567890',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height * 0.02),

                  SizedBox(height: height * 0.05),

                  CustomPrimaryButton(
                    title: 'Reset Password',
                    onPressed: () {
                      NavigatorService.push(OtpScreen(email: email));
                    },
                    // width: double.infinity,
                    // height: 50,
                  ),
                  SizedBox(height: height * 0.02),

                  CustomTextButton(
                    title: 'Remembered Password? Login',
                    fontSize: 13,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  // SizedBox(height: height * 0.03),

                  // Text(
                  //   "Or continue with",
                  //   style: TextStyle(fontSize: 12, color: AppColors.primary),
                  // ),
                  // SizedBox(height: height * 0.02),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     CustomIconButton(
                  //       path: AppIcons.google,
                  //       iconSize: width * 0.08,

                  //       onPressed: () {},
                  //     ),
                  //     SizedBox(width: width * 0.04),

                  //     CustomIconButton(
                  //       path: AppIcons.apple,
                  //       iconSize: width * 0.08,
                  //       onPressed: () {},
                  //     ),
                  //   ],
                  // ),
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
