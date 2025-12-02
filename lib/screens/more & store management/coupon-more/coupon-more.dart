import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/edit-item/widgets/draggable-button.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/coupon-more-2/coupon-more-2.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/coupon-more/widgets/coupon-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/constants.dart';

class CouponMoreScreen extends StatelessWidget {
  static const id = '/coupon-more';

  const CouponMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Coupon'),
      body: SafeArea(
        child: CustomParentContainer(
          children: [
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder:
                    (context, index) => CustomCouponCard(
                      title: "Eid El-Adha",
                      infoRows: [
                        AdInfoRowDataCoupon(
                          icon: SvgPicture.asset(
                            timerIcon,
                            height: 16.h,
                            width: 16.w,
                          ),
                          label: "Duration",
                          info: "8 Aug 2024 - 07 May 2025",
                          infoColor: blackColor,
                        ),
                        AdInfoRowDataCoupon(
                          icon: SvgPicture.asset(
                            percentageIcon,
                            height: 16.h,
                            width: 16.w,
                          ),
                          label: "Coupon Type",
                          info: "Amount",
                          infoColor: blackColor,
                        ),
                        AdInfoRowDataCoupon(
                          icon: SvgPicture.asset(
                            discountIcon,
                            height: 16.h,
                            width: 16.w,
                          ),
                          label: "Discount Value",
                          info: "\$20",
                          infoColor: greenColor,
                        ),
                      ],
                    ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DraggableButton(
        title: 'Add New Coupon',
        onPressed: () => Navigator.pushNamed(context, CouponMore2Screen.id),
      ),
    );
  }
}
