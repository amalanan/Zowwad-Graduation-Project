import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../ad-details/widgets/custom-text-field.dart';

class AlignedCustomTextFields extends StatelessWidget {
  final String label1;
  final String label2;
  final String hint1;
  final String hint2;
  final Widget? suffixIcon1;
  final TextInputType? keyboardType1;
  final ValueChanged<String>? onChanged1;
  final Widget? suffixIcon2;
  final TextInputType? keyboardType2;
  final ValueChanged<String>? onChanged2;
  final TextEditingController? controller1;
  final TextEditingController? controller2;

  final int? maxLines1;
  final int? maxLines2;
  final Function()? suffixMethod1;
  final Function()? suffixMethod2;

  const AlignedCustomTextFields({
    super.key,
    required this.label1,
    required this.label2,
    required this.hint1,
    required this.hint2,
    this.suffixIcon1,
    this.keyboardType1,
    this.onChanged1,
    this.suffixIcon2,
    this.keyboardType2,
    this.onChanged2,
    this.maxLines1,
    this.maxLines2,
    this.suffixMethod1,
    this.suffixMethod2,
    this.controller1,
    this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTextField(
                controller: controller1,
                label: label1,
                hint: hint1,
                suffixIcon: suffixIcon1,
                suffixMethod: suffixMethod1,
                maxLines: maxLines1,
                keyboardType: keyboardType1,
                onChanged: onChanged1,
              ),
            ),
            SizedBox(width: 16.h),
            Expanded(
              child: CustomTextField(
                controller: controller2,
                label: label2,
                hint: hint2,
                suffixIcon: suffixIcon2,
                suffixMethod: suffixMethod2,
                maxLines: maxLines2,
                keyboardType: keyboardType2,
                onChanged: onChanged2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
