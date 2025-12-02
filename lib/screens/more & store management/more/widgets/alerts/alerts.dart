import 'package:Zowwad/screens/more%20&%20store%20management/categories/widgets/header-title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/constants.dart';
import '../../../../business, expenses/change-pass/provider.dart';
import '../../../../edit-item/widgets/draggable-button.dart';
import '../../../../starting/vendor-registartion/widgets/custom-option.dart';

Future<void> showPassChangedAlert(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 385.h,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      SvgPicture.asset(
                        passChangedIcon,
                        height: 215.h,
                        width: 230.w,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Password Changed Successfully',
                        style: TextStyle(
                          color: greenColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      DraggableButton(
                        title: 'Go Back',
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
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

Future<void> showLanguageAlert(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 330.h,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                  child: Consumer<ChangePassProvider>(
                    builder:
                        (context, provider, child) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w),

                          child: Column(
                            children: [
                              SizedBox(height: 16.h),
                              HeaderTitle(title: 'Choose Your Language'),
                              SizedBox(height: 24.h),

                              CustomOption(
                                title: 'Arabic',
                                isSelected: provider.isArabic,
                                onTap: provider.toggleArabic,
                                icon: SvgPicture.asset(
                                  palestineFlag,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                              ),
                              SizedBox(height: 16.h),

                              CustomOption(
                                title: 'English',
                                isSelected: provider.isEnglish,
                                onTap: provider.toggleEnglish,
                                icon: SvgPicture.asset(
                                  ukFlag,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                              ),
                              SizedBox(height: 16.h),

                              CustomOption(
                                title: 'Spanish',
                                isSelected: provider.isSpanish,
                                onTap: provider.toggleSpanish,
                                icon: Image.asset(
                                  spainFlag,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                              ),
                              SizedBox(height: 16.h),

                              CustomOption(
                                title: 'Bengali',
                                isSelected: provider.isBengali,
                                onTap: provider.toggleBengali,
                                icon: Image.asset(
                                  bangladeshFlag,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                        ),
                  ),
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
