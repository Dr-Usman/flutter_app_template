import 'package:flutter/material.dart';
import 'package:shapes/core/constants/app_colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    this.onPressed,
    this.title,
    this.width,
    this.height,
    this.color = AppColors.orange,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.borderRadius = 8,
  });

  final VoidCallback? onPressed;
  final String? title;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 4,
        shadowColor: color?.withValues(alpha: 0.3),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
        backgroundColor: color,
        minimumSize: Size(width ?? double.infinity, height ?? 50),
      ),
      child: Text(
        title ?? '',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
