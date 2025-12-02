import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/constants.dart';

class EnglishSection2 extends StatelessWidget {
  const EnglishSection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        CustomTextField(hint: 'Title (English)', label: 'Title'),
        SizedBox(height: 16.h),
        CustomTextField(hint: 'Filled', label: 'Description'),
        SizedBox(height: 16.h),
        CustomTitle(title: 'Upload File(s)'),
        SizedBox(height: 12.h),
        SvgPicture.asset(
          uploadAdContainer,
          width: double.infinity,
          height: 125.h,
        ),
      ],
    );
  }
}
