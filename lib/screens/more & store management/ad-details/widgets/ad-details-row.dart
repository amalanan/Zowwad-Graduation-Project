import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdInfoRow extends StatelessWidget {
  final Widget icon;
  final String label;
  final String info;
  final Color infoColor;

  const AdInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.info,
    required this.infoColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ],
        ),
        Text(
          info,
          style: TextStyle(
            color: infoColor,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
