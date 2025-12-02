import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  final double height;
  final double width;
  final String img;

  const ProfileImage({
    super.key,
    required this.height,
    required this.width,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = img.startsWith('http');
    final isLocalFile = File(img).existsSync();

    Widget imageWidget;

    if (isNetworkImage) {
      imageWidget = Image.network(
        img,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallbackImage(),
      );
    } else if (isLocalFile) {
      imageWidget = Image.file(
        File(img),
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallbackImage(),
      );
    } else {
      imageWidget = _fallbackImage(); // Default to asset or icon
    }

    return Container(
      height: height.h,
      width: width.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      clipBehavior: Clip.hardEdge,
      child: imageWidget,
    );
  }

  Widget _fallbackImage() {
    return Image.asset(
      'assets/img.png', // Replace with your fallback asset
      fit: BoxFit.cover,
    );
  }
}
