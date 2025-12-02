import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/constants.dart';

class CustomReviewCard extends StatelessWidget {
  final String date;
  final String opinion;
  final Widget image;
  const CustomReviewCard({
    super.key,
    required this.date,
    required this.opinion,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: containerBorderLight),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    date,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      5,
                      (index) =>
                          SvgPicture.asset(starIcon, height: 14.h, width: 14.w),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  Text(
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                    opinion,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        Padding(
          padding: EdgeInsets.only(bottom: 65.h),
          child: Container(
            height: 56.h,
            width: 56.w,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: image,
          ),
        ),
      ],
    );
  }
}
