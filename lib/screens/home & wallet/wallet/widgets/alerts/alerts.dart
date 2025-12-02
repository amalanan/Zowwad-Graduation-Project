import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-elevated-button.dart';
import 'package:Zowwad/screens/home%20&%20wallet/wallet/provider.dart';
import 'package:Zowwad/screens/main/ui/screens/main_screen.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/categories/widgets/header-title.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/widgets/custom-option.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/constants.dart';

Future<void> showPayTypeAlert(BuildContext context) async {
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
                height: 255.h,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 32.h,
                      horizontal: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0.h),
                          child: HeaderTitle(title: 'Choose Type'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 150.w,
                                  height: 112.h,
                                  child: DottedBorder(
                                    options: RoundedRectDottedBorderOptions(
                                      dashPattern: [4, 4],
                                      strokeWidth: 1.5,
                                      color: containerBorderLight,
                                      radius: Radius.circular(16.r),
                                      padding: EdgeInsets.all(16.w),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.r),
                                      child: Center(
                                        // ✅ Center the image
                                        child: Image.asset(
                                          withdrawImage,
                                          height: 66.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Withdraw',
                                  style: TextStyle(
                                    color: titleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 8.w,
                            ), // ✅ Exact spacing between them
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () => showBankTransferAlert(context),
                                  child: SizedBox(
                                    width: 150.w,
                                    height: 112.h,
                                    child: DottedBorder(
                                      options: RoundedRectDottedBorderOptions(
                                        dashPattern: [4, 4],
                                        strokeWidth: 1.5,
                                        color: containerBorderLight,
                                        radius: Radius.circular(16.r),
                                        padding: EdgeInsets.all(16.w),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                        child: Center(
                                          // ✅ Center the image
                                          child: Image.asset(
                                            payImage,
                                            height: 66.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Pay Now',
                                  style: TextStyle(
                                    color: titleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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

Future<void> showBankTransferAlert(BuildContext context) async {
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
                height: 520.h,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 32.h,
                      horizontal: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HeaderTitle(title: 'Bank Transfer'),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hint: 'Enter card holder name',
                          label: 'Account Name',
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hint: 'Enter account number',
                          label: 'Account Number',
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hint: 'Enter your email',
                          label: 'Email',
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hint: 'Enter Amouunt',
                          label: 'Enter Amouunt',
                        ),
                        SizedBox(height: 24.h),
                        CustomElevatedButton(
                          text: 'Confirm',
                          onPressed: () => showPayingMethodAlert(context),
                          color: primaryColor,
                        ),
                        SizedBox(height: 16.h),
                      ],
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

Future<void> showPayingMethodAlert(BuildContext context) async {
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
                height: 300.h,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 32.h,
                      horizontal: 20.w,
                    ),
                    child: Consumer<WalletProvider>(
                      builder:
                          (context, provider, child) => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              HeaderTitle(title: 'Choose Method'),
                              SizedBox(height: 16.h),
                              Expanded(
                                child: CustomOption(
                                  icon: SvgPicture.asset(
                                    paypalIcon,
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                  title: 'Paypal',
                                  isSelected: provider.isPaypal,
                                  onTap:
                                      () => provider.togglePayingType(
                                        !provider.isPaypal,
                                      ),
                                ),
                              ),
                              SizedBox(height: 12.h),

                              Expanded(
                                child: CustomOption(
                                  icon: SvgPicture.asset(
                                    instaPayIcon,
                                    width: 20.w,
                                  ),
                                  title: 'Instapay',
                                  isSelected: !provider.isPaypal,
                                  onTap:
                                      () => provider.togglePayingType(
                                        !provider.isPaypal,
                                      ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              CustomElevatedButton(
                                text: 'Confirm',
                                onPressed:
                                    () => Navigator.pushReplacementNamed(
                                      context,
                                      MainScreen.id,
                                    ),
                                color: primaryColor,
                              ),
                              SizedBox(height: 20.h),
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
