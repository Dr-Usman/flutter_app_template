import 'package:flutter/material.dart';
import 'package:shapes/core/constants/app_assets.dart';
import 'package:shapes/core/constants/app_colors.dart';
import 'package:shapes/modules/auth/reset_password/reset_password_screen.dart';
import 'package:shapes/services/navigator/navigator_service.dart';
import 'package:shapes/shared/widgets/buttons/custom_primary_button.dart';
import 'package:shapes/shared/widgets/buttons/custom_text_button.dart';
import 'package:shapes/shared/widgets/images/custom_svg_widget.dart';
import 'package:shapes/shared/widgets/textfields/custom_pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    print('OtpScreen build called with width: $width and height: $height');

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
                    assetPath: AppImages.otpVerification,
                    width: width * 0.3,
                    height: height * 0.2,
                  ),
                  SizedBox(height: height * 0.01),
                  Center(
                    child: Text(
                      "OTP Verification",
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
                      "Enter the OTP sent to your email or phone number.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),

                  CustomPinput(),
                  SizedBox(height: height * 0.02),

                  SizedBox(height: height * 0.05),

                  CustomPrimaryButton(
                    title: 'Verify OTP',
                    onPressed: () {
                      NavigatorService.push(ResetPasswordScreen(email: email));
                    },
                    // width: double.infinity,
                    // height: 50,
                  ),
                  SizedBox(height: height * 0.02),

                  CustomTextButton(
                    title: 'Didn\'t receive OTP? Resend',
                    fontSize: 13,
                    onPressed: () {
                      // Navigator.pop(context);
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
