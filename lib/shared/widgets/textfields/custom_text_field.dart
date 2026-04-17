import 'package:flutter/material.dart';
import 'package:shapes/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.label,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.fillColor,
    this.controller,
  });

  final String? label, hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? fillColor;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(12.0);
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText && !isPasswordVisible,
      keyboardType: widget.keyboardType,

      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.label,
        filled: true,
        hintStyle: TextStyle(
          color: AppColors.textPrimary.withValues(alpha: 0.2),
        ),
        fillColor:
            widget.fillColor ?? AppColors.primary.withValues(alpha: 0.07),

        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: AppColors.errorColor, width: 2.0),
        ),

        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.textPrimary.withValues(alpha: 0.5),
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              )
            : null,
      ),

      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
