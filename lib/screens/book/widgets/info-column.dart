import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoColumn extends StatelessWidget {
  final Widget icon;
  final String title;
  final String label;
  final Color titleColor;
  final Color labelColor;

  const InfoColumn({
    super.key,
    required this.icon,
    required this.title,
    required this.label,
    required this.titleColor,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        SizedBox(height: 6),

        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: titleColor,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 4.h),

        /// النص الذي كان يكسر كل شيء — الآن مضبوط 100%
        SizedBox(
          width: 90.w, // مسافة محسوبة حتى يناسب التصميم
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: labelColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
