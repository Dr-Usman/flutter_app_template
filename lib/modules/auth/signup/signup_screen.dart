import 'package:flutter/material.dart';
import 'package:shapes/core/constants/app_colors.dart';
import 'package:shapes/shared/widgets/buttons/custom_primary_button.dart';
import 'package:shapes/shared/widgets/buttons/custom_text_button.dart';
import 'package:shapes/shared/widgets/textfields/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    print('SignupScreen build called with width: $width and height: $height');

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
                      "Create Account",
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
                      "Create an account to get started with Shapes and achieve your fitness goals!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),

                  CustomTextField(
                    label: 'Full Name',
                    hintText: 'Usman Shahbaz',
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    label: 'Email',
                    hintText: 'abc@mail.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    label: 'Mobile Number',
                    hintText: '03234567890',
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(label: 'Password', obscureText: true),
                  SizedBox(height: height * 0.02),

                  CustomTextField(label: 'Confirm Password', obscureText: true),

                  // SizedBox(height: height * 0.01),
                  SizedBox(height: height * 0.05),

                  CustomPrimaryButton(
                    title: 'Register',
                    onPressed: () {},
                    // width: double.infinity,
                    // height: 50,
                  ),
                  SizedBox(height: height * 0.02),

                  CustomTextButton(
                    title: 'Already have an account? Login',
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
