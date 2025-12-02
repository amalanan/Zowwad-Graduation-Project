import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/home%20&%20wallet/wallet/widgets/alerts/alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionButton extends StatelessWidget {
  final String title;
  const TransactionButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPayTypeAlert(context),
      child: Container(
        height: 36.h,
        width: 121.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
