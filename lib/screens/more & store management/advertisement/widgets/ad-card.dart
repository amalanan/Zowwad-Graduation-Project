import 'package:Zowwad/screens/book/alerts/alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/constants.dart';
import '../../../book/widgets/custom-popup.dart';
import '../../ad-details/ad-details.dart';

class AdCard extends StatelessWidget {
  final String adId;
  final String type;
  final String placedDate;
  final String duration;
  final VoidCallback onTap;

  const AdCard({
    super.key,
    required this.adId,
    required this.type,
    required this.placedDate,
    required this.duration,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: containerBorderLight),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Ad ID: ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                  children: [
                    TextSpan(
                      text: '#$adId',
                      style: TextStyle(
                        color: greenColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),

              Text(
                type,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: titleColor,
                ),
              ),
              SizedBox(height: 8.h),

              Text(
                'Ad Placed: $placedDate',
                style: TextStyle(fontSize: 10.sp, color: titleColor),
              ),

              Text(
                'Duration: $duration',
                style: TextStyle(fontSize: 10.sp, color: titleColor),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 12,
          right: 18,
          child: SvgPicture.asset(navCircle, height: 25.h, width: 25.w),
        ),

        Positioned(
          top: 8,
          right: 8,
          child: InkWell(
            onTapDown: (details) {
              final productCenter = Offset(
                details.globalPosition.dx - 60,
                details.globalPosition.dy - -90,
              );

              CustomPopup.show(
                context,
                productCenter,
                actions: [
                  PopupActionItem(
                    iconPath: greyEyeIcon,
                    label: 'View Ad',
                    textColor: blackColor,
                    onTap:
                        () => Navigator.pushNamed(context, AdDetailsScreen.id),
                  ),
                  PopupActionItem(
                    iconPath: greyDeleteIcon,
                    label: 'Edit',
                    textColor: blackColor,
                    onTap:
                        () => Navigator.pushNamed(context, AdDetailsScreen.id),
                  ),
                  PopupActionItem(
                    iconPath: pauseIcon,
                    label: 'Pause Ad',
                    textColor: blackColor,
                    onTap: () {},
                  ),
                  PopupActionItem(
                    iconPath: greyCopyIcon,
                    label: 'Copy Ad',
                    textColor: blackColor,
                    onTap: () {},
                  ),
                  PopupActionItem(
                    iconPath: greyDeleteIcon,
                    label: 'Delete Ad',
                    textColor: blackColor,
                    onTap:
                        () => showDeleteAlert(
                          context,
                          'Are you sure you want to delete this ad?',
                          () {},
                        ),
                  ),
                ],
              );
            },
            child: SvgPicture.asset(moreContainer, width: 40.w, height: 40.h),
          ),
        ),
      ],
    );
  }
}
