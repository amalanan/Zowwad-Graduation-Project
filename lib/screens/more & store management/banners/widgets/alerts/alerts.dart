import 'package:Zowwad/screens/more%20&%20store%20management/banners/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/constants.dart';
import '../../../../ad-details/widgets/custom-text-field.dart';
import '../../../../ad-details/widgets/custom-elevated-button.dart';
import '../../../../book/widgets/tab-button.dart';
import '../../../categories/widgets/header-title.dart';

void showNewBannerAlert(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,

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
                        HeaderTitle(title: 'Add New Banner'),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Consumer<BannersProvider>(
                              builder: (context, provider, child) {
                                return TabButton(
                                  width: 165,
                                  label: "العربية",
                                  isSelected: provider.showArabic,
                                  onPressed: () => provider.showArabicTab(),
                                  selectedColor: primaryColor,
                                  unselectedColor: Colors.white,
                                  selectedTextColor: Colors.white,
                                  unselectedTextColor: titleColor,
                                  selectedBorderColor: Colors.transparent,
                                  unselectedBorderColor: containerBorderLight,
                                );
                              },
                            ),
                            SizedBox(width: 10.w),
                            Consumer<BannersProvider>(
                              builder: (context, provider, child) {
                                return TabButton(
                                  width: 165,
                                  label: "English",
                                  isSelected: !provider.showArabic,
                                  onPressed: () => provider.showEnglishTab(),
                                  selectedColor: primaryColor,
                                  unselectedColor: Colors.white,
                                  selectedTextColor: Colors.white,
                                  unselectedTextColor: titleColor,
                                  selectedBorderColor: Colors.transparent,
                                  unselectedBorderColor: containerBorderLight,
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(hint: 'title', label: 'Enter Title'),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hint: 'Addon Name (Arabic)',
                          label: 'Addon Name (Arabic)',
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hint: 'title',
                          label: 'Redirection URl / Link',
                        ),
                        SizedBox(height: 16.h),
                        Consumer<BannersProvider>(
                          builder: (context, provider, child) {
                            return GestureDetector(
                              onTap: provider.pickImage,
                              child:
                                  provider.selectedBanner != null
                                      ? Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.file(
                                              provider.selectedBanner!,
                                              height: 112.h,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: GestureDetector(
                                              onTap: provider.removeBanner,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  shape: BoxShape.circle,
                                                ),
                                                padding: EdgeInsets.all(4),
                                                child: Icon(
                                                  Icons.close,
                                                  size: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                      : SvgPicture.asset(
                                        uploadBannerContainer,
                                        height: 112.h,
                                        width: double.infinity,
                                      ),
                            );
                          },
                        ),

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
