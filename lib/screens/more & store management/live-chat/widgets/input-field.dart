import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/constants.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: 14.sp,
                color: titleColor,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Type text',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.h,
                  horizontal: 12.w,
                ),
                suffixIcon: SvgPicture.asset(attachIcon, fit: BoxFit.scaleDown),
                suffixIconConstraints: BoxConstraints(
                  minHeight: 30.h,
                  minWidth: 30.w,
                  maxHeight: 30.h,
                  maxWidth: 30.w,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: cardBorder),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: cardBorder),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),

          SizedBox(width: 8.w),
          IconButton(
            icon: SvgPicture.asset(sendFilledIcon, height: 28.h, width: 28.w),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
