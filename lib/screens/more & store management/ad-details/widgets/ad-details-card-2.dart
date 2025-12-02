import 'package:Zowwad/screens/ad-details/widgets/custom-title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';

class AdDetailsCard2 extends StatelessWidget {
  const AdDetailsCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),

        border: Border.all(color: containerBorderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitle(title: 'Ad Title'),
          SizedBox(height: 8.h),
          Text(
            'this is an example od the ad Title',

            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: titleColor,
            ),
          ),
          SizedBox(height: 16.h),
          CustomTitle(title: 'Description'),
          SizedBox(height: 8.h),
          Text(
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: titleColor,
            ),
            'this is an example od the description that would be added by the owner',
          ),
          SizedBox(height: 16.h),

          SizedBox(height: 16.h),
          CustomTitle(title: 'Video'),
          SizedBox(height: 8.h),
          Image.asset(widePancakeImg, height: 112.h, width: double.infinity),
        ],
      ),
    );
  }
}
