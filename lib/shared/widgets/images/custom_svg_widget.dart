import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgWidget extends StatelessWidget {
  const CustomSvgWidget({
    super.key,
    this.url,
    this.assetPath,
    this.width,
    this.height,
  });

  final String? url;
  final String? assetPath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (assetPath != null) {
      return _buildSvgAsset(assetPath, width, height);
    } else if (url != null) {
      return _buildSvgNetwork(url, width, height);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildSvgAsset(String? assetPath, double? width, double? height) {
    return SvgPicture.asset(assetPath!, width: width, height: height);
  }

  Widget _buildSvgNetwork(String? url, double? width, double? height) {
    return SvgPicture.network(url!, width: width, height: height);
  }
}
