import 'package:Zowwad/screens/more%20&%20store%20management/coupon-more/widgets/code-row.dart';
import 'package:Zowwad/screens/book/alerts/alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants/constants.dart';
import '../../ad-details/widgets/ad-details-row.dart';
import '../../edit-coupon/edit-coupon.dart';

class CustomCouponCard extends StatelessWidget {
  final String title;
  final List<AdInfoRowDataCoupon> infoRows;

  const CustomCouponCard({
    super.key,
    required this.title,
    required this.infoRows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: containerBorderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Name: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        color: greenColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                      editCircleIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                    onTap:
                        () => Navigator.pushNamed(context, EditCouponScreen.id),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap:
                        () => showDeleteAlert(
                          context,
                          'Are you sure you want to delete this coupon?',
                          () {},
                        ),
                    child: SvgPicture.asset(
                      deleteCircleIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Divider(height: 24.h, thickness: 0.2, color: verticalDividerColor),
          CodeRow(
            icon: SvgPicture.asset(discountIcon, height: 16.h, width: 16.w),
            label: 'Code',
            code: '#code37',
          ),
          SizedBox(height: 16.h),

          ...infoRows
              .map(
                (row) => Column(
                  children: [
                    AdInfoRow(
                      icon: row.icon,
                      label: row.label,
                      info: row.info,
                      infoColor: row.infoColor,
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              )
              ,
        ],
      ),
    );
  }
}

class AdInfoRowDataCoupon {
  final Widget icon;
  final String label;
  final String info;
  final Color infoColor;

  AdInfoRowDataCoupon({
    required this.icon,
    required this.label,
    required this.info,
    required this.infoColor,
  });
}
