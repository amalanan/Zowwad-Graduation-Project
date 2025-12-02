import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/edit-item/widgets/draggable-button.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details-more-2/ad-details-more-2.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details/widgets/AdDetailsCard.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details/widgets/ad-details-card-2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/constants.dart';

class AdDetailsScreen extends StatelessWidget {
  static const id = '/ad-details-more';

  const AdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ad Details'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomParentContainer(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: AdDetailsCard(
                  adId: "#100003",
                  status: "Running",
                  statusColor: greenColor,
                  infoRows: [
                    AdInfoRowData(
                      icon: SvgPicture.asset(
                        calendarIcon,
                        height: 16.h,
                        width: 16.w,
                      ),
                      label: "Ads Created",
                      info: "8 Aug 2024 2:50 AM",
                      infoColor: blackColor,
                    ),
                    AdInfoRowData(
                      icon: SvgPicture.asset(
                        timerIcon,
                        height: 16.h,
                        width: 16.w,
                      ),
                      label: "Duration",
                      info: "8 Aug 2024 - 07 May 2025",
                      infoColor: blackColor,
                    ),
                    AdInfoRowData(
                      icon: SvgPicture.asset(
                        statusIcon,
                        height: 16.h,
                        width: 16.w,
                      ),
                      label: "Ad Type",
                      info: "Video Promotion",
                      infoColor: blackColor,
                    ),
                    AdInfoRowData(
                      icon: SvgPicture.asset(
                        dollarIcon,
                        height: 16.h,
                        width: 16.w,
                      ),
                      label: "Payment Status",
                      info: "Paid",
                      infoColor: greenColor,
                    ),
                  ],
                ),
              ),
              AdDetailsCard2(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DraggableButton(
        title: 'Edit Ad',
        onPressed: () => Navigator.pushNamed(context, EditAdScreen.id),
        outlined: true,
      ),
    );
  }
}
