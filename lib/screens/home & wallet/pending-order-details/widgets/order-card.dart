import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';
import 'order-row.dart';

class OrderCard extends StatelessWidget {
  final String status;
  final Color statusColor;
  final String orderId;
  final String orderDate;

  const OrderCard({
    super.key,
    required this.status,
    required this.statusColor,
    required this.orderId,
    required this.orderDate,
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
              Text(
                'General Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                  fontSize: 14.sp,
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
          SizedBox(height: 13.h),

          Column(
            children: [
              OrderRow(title: 'Order ID', value: orderId),
              SizedBox(height: 16.h),
              OrderRow(title: 'Order date', value: orderDate),
              SizedBox(height: 16.h),

              OrderRow(
                isRichText: true,
                title: 'Payment',
                value: ' - Jawwal Pay',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
