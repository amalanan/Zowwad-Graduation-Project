import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'details-row.dart';

class ContactDetailsContainer extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;
  final Widget? suffixIcon;

  const ContactDetailsContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: containerBorderLight, width: 1),
      ),
      child:
          suffixIcon == null
              ? DetailsRow(icon: icon, title: title, description: description)
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  suffixIcon!,
                  DetailsRow(
                    icon: icon,
                    title: title,
                    description: description,
                  ),
                ],
              ),
    );
  }
}
