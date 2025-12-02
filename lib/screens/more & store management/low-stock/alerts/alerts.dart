import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-elevated-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showAddStockAlert(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                  vertical: 36.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(hint: 'New Stock', label: 'New Stock'),
                    SizedBox(height: 16.h),

                    CustomElevatedButton(
                      text: 'Update',
                      onPressed: () {},
                      color: primaryColor,
                    ),
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
