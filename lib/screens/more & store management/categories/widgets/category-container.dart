import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryContainer extends StatelessWidget {
  final String image;
  final String title;

  const CategoryContainer({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          height: 80.h,
          width: 110.w,
          child: Center(
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 8.h),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
