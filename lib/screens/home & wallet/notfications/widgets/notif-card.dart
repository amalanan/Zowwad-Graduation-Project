import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NotifCard extends StatelessWidget {
  final String title;
  final String timeText;
  final String actionText;
  final String description;
  final VoidCallback onActionPressed;
  final bool read;

  const NotifCard({
    super.key,
    required this.title,
    required this.timeText,
    required this.actionText,
    required this.description,
    required this.onActionPressed,
    required this.read,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: !read ? Colors.white : greyBgColor,
        border: !read ? Border.all(color: containerBorderLight) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!read)
            Image.asset(avatarIcon, height: 40.h, width: 40.w)
          else
            Padding(
              padding: EdgeInsets.only(top: 6.0.h),
              child: Icon(Icons.circle, size: 10.w, color: greenColor),
            ),
          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                SizedBox(height: 6.h),

                Text(
                  description,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14.sp, color: titleColor),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          SizedBox(width: 12.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                timeText,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
