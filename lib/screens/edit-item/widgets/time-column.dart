import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constants.dart';

class TimeColumn extends StatelessWidget {
  final String title;
  final List<String> options;
  final int selectedIndex;
  final Function(int) onSelect; // ✅ إضافة callback

  const TimeColumn({
    super.key,
    required this.title,
    required this.options,
    required this.selectedIndex,
    required this.onSelect, // ✅
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: containerBorderLight, width: 1.w),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: titleColor,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: 70.h,
            child: ListView(
              children:
                  options.asMap().entries.map((entry) {
                    int index = entry.key;
                    String value = entry.value;
                    bool isSelected = index == selectedIndex;
                    return GestureDetector(
                      onTap: () => onSelect(index), // ✅ تحديث الاختيار
                      child: Container(
                        width: 80.w,
                        height: 30.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? const Color(0xFFF9E5E5)
                                  : Colors.white,
                        ),
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color:
                                isSelected
                                    ? const Color(0xFF7F001D)
                                    : blackColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
