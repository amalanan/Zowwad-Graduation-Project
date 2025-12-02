import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadioTile extends StatelessWidget {
  final String value;
  final String groupValue;
  final void Function(String?) onChanged;
  final String title;

  const CustomRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: RadioListTile<String>(
        value: value,

        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(title, style: TextStyle(fontSize: 14.sp)),
        activeColor: primaryColor,

        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      ),
    );
  }
}
