import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: containerBorderLight),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          Image.asset(bannerImg, width: double.infinity),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Redericetion URL: N/A',
                  style: TextStyle(
                    fontSize: 12,
                    color: titleColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Title: Banner 1',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                  fontSize: 12.sp,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(editCircleIcon, height: 20.h, width: 20.w),
                  SizedBox(width: 16.w),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
