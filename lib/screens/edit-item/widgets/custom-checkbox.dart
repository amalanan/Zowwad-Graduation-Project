import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../provider.dart';

import 'package:custom_check_box/custom_check_box.dart';

class CustomCheckbox extends StatelessWidget {
  final String title;
  final String providerKey;

  const CustomCheckbox({
    super.key,
    required this.title,
    required this.providerKey,
  });

  @override
  Widget build(BuildContext context) {
    final isChecked = context.watch<EditItemProvider>().isChecked(providerKey);

    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: titleColor,
          ),
        ),
        CustomCheckBox(
          value: isChecked,
          shouldShowBorder: true,

          borderColor: titleColor,
          checkedFillColor: primaryColor,
          borderRadius: 4.r,
          borderWidth: 2.w,
          checkBoxSize: 14.w,
          splashColor: Colors.transparent,
          checkedIcon: CupertinoIcons.checkmark_alt,
          onChanged: (val) {
            context.read<EditItemProvider>().toggleCheck(providerKey);
          },
        ),
      ],
    );
  }
}
