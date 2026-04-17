import 'package:flutter/material.dart';
import 'package:shapes/core/constants/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    this.title,
    this.fontWeight,
    this.color = AppColors.black,
    this.fontSize = 16,
  });
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        // padding: EdgeInsets.zero,
        // minimumSize: Size(0, 0),
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        title ?? '',
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
