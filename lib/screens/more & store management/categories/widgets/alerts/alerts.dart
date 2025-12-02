import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-elevated-button.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/categories/widgets/header-title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showAddCategoryAlert(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.white,
          elevation: 10.h,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8.h),
                    HeaderTitle(title: 'Add New Category'),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hint: 'Category Name (English)',
                      label: 'Category Name (English)',
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hint: 'Category Name (Arabic)',
                      label: 'Category Name (Arabic)',
                    ),
                    SizedBox(height: 16.h),
                    SvgPicture.asset(uploadCategory, width: double.infinity),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                      text: 'Add',
                      onPressed: () {},
                      color: primaryColor,
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
              Positioned(
                top: -10,
                left: 16,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(closeIcon, height: 32.h, width: 32.w),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
