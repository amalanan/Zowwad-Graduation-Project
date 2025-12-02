import 'package:Zowwad/screens/more%20&%20store%20management/live-chat/widgets/product-badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';

class ActiveOrderCard extends StatelessWidget {
  const ActiveOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: containerBorderLight),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: [
          ProductBadge(imageUrl: uniBook, title: '+2', subtitle: 'more'),
          SizedBox(width: 10.w),
          Text(
            "Active order: ",
            style: TextStyle(
              color: titleColor,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
          Text(
            "#12345",
            style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          const Spacer(),
          Text(
            "Inquiring this",
            style: TextStyle(
              color: greenColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
