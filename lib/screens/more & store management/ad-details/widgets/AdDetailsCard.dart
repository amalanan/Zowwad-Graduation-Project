import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/constants.dart';
import 'ad-details-row.dart';


class AdDetailsCard extends StatelessWidget {
  final String adId;
  final String status;
  final Color statusColor;
  final List<AdInfoRowData> infoRows;

  const AdDetailsCard({
    super.key,
    required this.adId,
    required this.status,
    required this.statusColor,
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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Ad ID: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: adId,
                      style: TextStyle(
                        color: greenColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),

          Divider(height: 24.h, thickness: 0.2, color: verticalDividerColor),

          // Dynamic Info Rows
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

class AdInfoRowData {
  final Widget icon;
  final String label;
  final String info;
  final Color infoColor;

  AdInfoRowData({
    required this.icon,
    required this.label,
    required this.info,
    required this.infoColor,
  });
}
