import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/constants.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String publishDate; // تاريخ النشر
  final VoidCallback onTap;

  const BookCard({
    super.key,
    required this.title,
    required this.publishDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // اتجاه النص عربي
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: containerBorderLight),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // عنوان الكتاب
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                SizedBox(height: 8.h),

                Text(
                  'تاريخ النشر: $publishDate',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: greenColor,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(arrowLeftIcon, height: 20.h, width: 20.w),
            ),
          ],
        ),
      ),
    );
  }
}
