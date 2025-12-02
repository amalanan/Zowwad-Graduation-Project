import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransferCard extends StatelessWidget {
  final String amount;
  final String type;
  final String date;
  final String status;
  final Color statusColor;

  const TransferCard({
    super.key,
    required this.amount,
    required this.type,
    required this.date,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              amount,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(type, style: TextStyle(fontSize: 10.sp, color: titleColor)),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(date, style: TextStyle(color: titleColor, fontSize: 10.sp)),
            SizedBox(height: 8.h),
            Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
