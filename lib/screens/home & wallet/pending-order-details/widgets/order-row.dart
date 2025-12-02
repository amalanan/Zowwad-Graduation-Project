import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';

class OrderRow extends StatelessWidget {
  final String title;
  final String value;
  final bool? isRichText;
  final Color? titleColor;
  final Color? valueColor;
  final bool? bold;

  const OrderRow({
    super.key,
    required this.title,
    required this.value,
    this.isRichText = false,
    this.titleColor,
    this.valueColor,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: titleColor ?? blackColor,
            fontWeight: bold! ? FontWeight.bold : FontWeight.w100,
          ),
        ),
        !isRichText!
            ? Text(
              value,
              style: TextStyle(
                fontWeight: bold! ? FontWeight.bold : FontWeight.w100,
                fontSize: 14.sp,
                color: valueColor ?? blackColor,
              ),
            )
            : Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Paid',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: greenColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(text: value, style: TextStyle(fontSize: 14.sp)),
                ],
              ),
            ),

        //
      ],
    );
  }
}
