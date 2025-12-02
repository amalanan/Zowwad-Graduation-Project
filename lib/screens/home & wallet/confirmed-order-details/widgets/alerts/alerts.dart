import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/constants.dart';
import '../../../../more & store management/categories/widgets/header-title.dart';
import '../../../../more & store management/coupon-more-2/widgets/confirm-cancel-button.dart';
import '../../../cooking-order-details/cooking-order-details.dart';

void showCookInfoAlert(BuildContext context) {
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
                    SizedBox(height: 16.h),
                    HeaderTitle(title: 'Cooking Confirmation'),
                    SizedBox(height: 16.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(timerImage, height: 40.h, width: 26.w),
                        SizedBox(width: 16.h),

                        Text(
                          textAlign: TextAlign.left,
                          'Enter Estimated Processing time in\nminutes',
                          style: TextStyle(fontSize: 16.sp, color: titleColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(hint: '8', label: 'Time'),

                    SizedBox(height: 24.h),
                    // ConfirmCancelButton(
                    //   onPressed:
                    //       () => Navigator.pushNamed(
                    //         context,
                    //         CookingOrderDetailsScreen.id,
                    //       ),
                    //   onCancelPressed: () {},
                    // ),
                    SizedBox(height: 24.h),
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
