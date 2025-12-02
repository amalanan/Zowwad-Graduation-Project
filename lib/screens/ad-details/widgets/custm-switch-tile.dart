import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool? isBold;

  const CustomSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 42.h,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 40.w,
            height: 22.h,
            child: FittedBox(
              fit: BoxFit.fill,
              child: FlutterSwitch(
                width: 40.0,
                height: 24.0,
                toggleSize: 20.0,
                value: value,
                borderRadius: 30.0.r,
                padding: 2.0.h,
                activeColor: greenColor,
                inactiveColor: borderColor,
                toggleColor: Colors.white,
                onToggle: onChanged,
                activeToggleBorder: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
                inactiveToggleBorder: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
                switchBorder: Border.all(color: Colors.transparent, width: 0),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: isBold! ? FontWeight.bold : FontWeight.w400,
              color: isBold! ? blackColor : titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
