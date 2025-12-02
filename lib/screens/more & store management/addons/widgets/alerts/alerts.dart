import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-elevated-button.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/categories/widgets/header-title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showNewAddonAlert(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height:
              MediaQuery.of(context).size.height * 0.6, // 👈 limit height here

          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            child: Align(
              alignment: Alignment.bottomCenter,
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
                      children: [
                        HeaderTitle(title: 'Add New Addon'),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hint: 'Addon Name (English)',
                          label: 'Addon Name (English)',
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hint: 'Addon Name (Arabic)',
                          label: 'Addon Name (Arabic)',
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(hint: 'Price', label: 'Price'),
                        SizedBox(height: 16.h),
                        CustomElevatedButton(
                          text: 'Add',
                          onPressed: () {},
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -8,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        closeIcon,
                        height: 32.h,
                        width: 32.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
