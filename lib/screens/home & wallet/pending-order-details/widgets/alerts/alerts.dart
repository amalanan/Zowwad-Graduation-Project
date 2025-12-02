import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/home%20&%20wallet/confirmed-order-details/confirmed-order-details.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/coupon-more-2/widgets/confirm-cancel-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../more & store management/categories/widgets/header-title.dart';
import '../../provider.dart';
import '../custom-radio-tile.dart';

void showConfirmOrderAlert(BuildContext context) {
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
                    HeaderTitle(title: 'Confirm Order'),
                    SizedBox(height: 16.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(warningIcon, height: 44.h, width: 44.w),
                        SizedBox(width: 16.h),

                        Text(
                          textAlign: TextAlign.left,
                          'Are you sure you want to confirm\nthis order?',
                          style: TextStyle(fontSize: 16.sp, color: titleColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    ConfirmCancelButton(
                      onPressed: () {},
                      onCancelPressed: () {
                        Navigator.pop(context);
                        showOrderCancellationDialog(context);
                      },
                    ),
                    SizedBox(height: 40.h),
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

void showOrderCancellationDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.white,
              elevation: 10,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0.h),
                          child: HeaderTitle(title: 'Order Cancellation'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(warningIcon, height: 44.h, width: 44.w),
                            SizedBox(width: 16.h),

                            Text(
                              textAlign: TextAlign.left,
                              'Are you sure you want to confirm\nthis order?',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: titleColor,
                              ),
                            ),
                          ],
                        ),
                        Consumer<OrderDetailsProvider>(
                          builder: (context, provider, _) {
                            return Column(
                              children: [
                                CustomRadioTile(
                                  value: 'Product Shortage',
                                  groupValue: provider.selectedReason ?? '',
                                  onChanged: (val) => provider.setReason(val!),
                                  title: 'Product Shortage',
                                ),
                                SizedBox(height: 16.h),
                                CustomRadioTile(
                                  value: 'Now is the restaurant closing hour',
                                  groupValue: provider.selectedReason ?? '',
                                  onChanged: (val) => provider.setReason(val!),
                                  title: 'Now is the restaurant closing hour',
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 24.h),

                        // ConfirmCancelButton(
                        //   onPressed:
                        //       () => Navigator.pushNamed(
                        //         context,
                        //         ConfirmedOrderDetailsScreen.id,
                        //       ),
                        //   onCancelPressed: () => Navigator.pop(context),
                        // ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -10,
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
          );
        },
      );
    },
  );
}
