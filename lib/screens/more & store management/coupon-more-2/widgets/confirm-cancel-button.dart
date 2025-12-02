import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmCancelButton extends StatelessWidget {
  final Function() onPressed;
  final Function() onCancelPressed;
  const ConfirmCancelButton({
    super.key,
    required this.onPressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onCancelPressed,
            style: ElevatedButton.styleFrom(
              textStyle: GoogleFonts.tajawal(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                side: BorderSide(color: blackColor, width: 0.5),
              ),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(color: blackColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              textStyle: GoogleFonts.tajawal(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              backgroundColor: primaryColor,
              //   minimumSize: Size(120.w, 42.h),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
