import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String hint;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final double? height;
  final double? width;
  final int? maxLines;
  final Function()? suffixMethod;
  final TextEditingController? controller;
  final bool? isPhoneNum;
  final bool? obscure;

  const CustomTextField({
    super.key,
    this.label,
    required this.hint,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.height = 42,
    this.width = 344,
    this.maxLines = 1,
    this.suffixMethod,
    this.controller,
    this.isPhoneNum = false,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              textDirection: TextDirection.rtl,
              label!,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
          ),
        Container(
          width: width?.w,
          height: height?.h,
          decoration: BoxDecoration(
            border: Border.all(color: cardBorder),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: AlwaysDisabledFocusNode(),
                  obscureText: obscure! ? true : false,
                  obscuringCharacter: '*',
                  maxLines: maxLines,
                  keyboardType: keyboardType,
                  onChanged: onChanged,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                  decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: titleColor,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    suffixIcon:
                        suffixIcon != null
                            ? GestureDetector(
                              onTap: suffixMethod,
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: Center(child: suffixIcon),
                                ),
                              ),
                            )
                            : null,
                  ),
                ),
              ),
              if (isPhoneNum ?? false) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    children: [
                      SizedBox(width: 8.w),

                      Container(width: 0.5.w, height: 20.h, color: cardBorder),
                      SizedBox(width: 8.w),

                      Text(
                        '٥٠',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(width: 8.w),

                      SvgPicture.asset(
                        palestineIcon,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => true;
}
