import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreviewCard extends StatelessWidget {
  final Widget img;

  const PreviewCard({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: orangeColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      width: 80.w,
      height: 85.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: img,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 23.h,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Preview',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4.w),

                  SvgPicture.asset(whiteEyeIcon, height: 16.h, width: 16.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
