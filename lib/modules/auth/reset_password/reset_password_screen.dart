import 'package:flutter/material.dart';
import 'package:shapes/core/constants/app_assets.dart';
import 'package:shapes/core/constants/app_colors.dart';
import 'package:shapes/services/navigator/navigator_service.dart';
import 'package:shapes/shared/widgets/buttons/custom_primary_button.dart';
import 'package:shapes/shared/widgets/buttons/custom_text_button.dart';
import 'package:shapes/shared/widgets/images/custom_svg_widget.dart';
import 'package:shapes/shared/widgets/textfields/custom_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    print(
      'ResetPasswordScreen build called with width: $width and height: $height',
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
                    assetPath: AppImages.resetPassword,
                    width: width * 0.3,
                    height: height * 0.2,
                  ),
                  SizedBox(height: height * 0.01),

                  Center(
                    child: Text(
                      "Reset Password",
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
                      "Enter your new password below. Make sure it's strong and secure.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),

                  CustomTextField(
                    label: 'New Password',
                    hintText: 'Enter your new password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    label: 'Confirm Password',
                    hintText: 'Re-enter your new password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),

                  SizedBox(height: height * 0.05),

                  CustomPrimaryButton(
                    title: 'Reset Password',
                    onPressed: () {},
                    // width: double.infinity,
                    // height: 50,
                  ),
                  SizedBox(height: height * 0.02),

                  CustomTextButton(
                    title: 'Remembered Password? Login',
                    fontSize: 13,
                    onPressed: () {
                      int count = 0;
                      NavigatorService.popUntil(
                        (_) => count++ >= 3,
                      ); // Pops 3 screens
                    },
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
