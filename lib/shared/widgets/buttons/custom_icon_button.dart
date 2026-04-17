import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shapes/core/constants/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.path,
    this.width,
    this.height,
    this.iconSize,
    this.onPressed,
  });
  final String? path;
  final double? width;
  final double? height;
  final double? iconSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (path == null) return SizedBox.shrink();

    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(path ?? '', width: iconSize, height: iconSize),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.lightGrey.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
