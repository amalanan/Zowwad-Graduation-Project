import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PolicySection extends StatelessWidget {
  const PolicySection({
    super.key,
    required this.number,
    required this.title,
    required this.body,
  });

  final String number;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. $title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            body,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey.shade800,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
