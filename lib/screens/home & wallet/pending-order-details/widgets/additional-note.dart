import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdditionalNoteCard extends StatelessWidget {
  final String note;
  const AdditionalNoteCard({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Additional Note',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          Text(note, style: TextStyle(fontSize: 12.sp, color: titleColor)),
        ],
      ),
    );
  }
}
