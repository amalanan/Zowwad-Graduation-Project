import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';
import 'order-row.dart';

class PaymentCard extends StatelessWidget {
  final String subtotal;
  final String tax;
  final String fees;
  final String discount;
  final String? total;
  final bool? hasTotal;

  const PaymentCard({
    super.key,
    required this.subtotal,
    required this.tax,
    required this.fees,
    required this.discount,
    this.total,
    this.hasTotal = false,
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
          Text(
            'Payment Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: blackColor,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 16.h),

          Column(
            children: [
              OrderRow(
                title: 'Subtotal',
                value: subtotal,
                titleColor: titleColor,
                valueColor: titleColor,
              ),
              SizedBox(height: 16.h),
              OrderRow(
                title: 'Tax',
                value: tax,
                titleColor: titleColor,
                valueColor: titleColor,
              ),
              SizedBox(height: 16.h),
              OrderRow(
                title: 'Delivery Fees',
                value: fees,
                titleColor: titleColor,
                valueColor: titleColor,
              ),
              SizedBox(height: 16.h),
              OrderRow(
                title: 'Discount',
                value: discount,
                titleColor: Colors.red,
                valueColor: Colors.red,
              ),
              SizedBox(height: 16.h),
              if (hasTotal!)
                OrderRow(
                  bold: true,
                  title: 'Total',
                  value: total ?? '',
                  titleColor: blackColor,
                  valueColor: blackColor,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
