import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBadge extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const ProductBadge({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 40.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Stack(
              children: [
                Image.asset(
                  imageUrl,
                  height: 40.h,
                  width: 40.w,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 40.h,
                  width: 40.w,
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
