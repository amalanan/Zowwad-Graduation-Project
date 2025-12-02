import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/custom-option.dart';

class StudentOrGraduate extends StatelessWidget {
  const StudentOrGraduate({super.key});

  @override
  Widget build(BuildContext context) {


    final provider = Provider.of<RegistrationProvider>(context, listen: false);
    return Container(
      height: MediaQuery.sizeOf(context).height,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomOption(
                    title: "طالب",
                    isSelected: provider.isStudent,
                    onTap:
                        () => provider.toggleCommissionType(
                          true,
                        ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomOption(
                    title: "خريج",
                    isSelected: !provider.isStudent,
                    onTap:
                        () => provider.toggleCommissionType(
                          false,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            if (provider.isStudent)
              Text(
                textDirection: TextDirection.rtl,
                style: TextStyle(color: titleColor, fontSize: 14.sp),

                'يرجى التأكد من إدخال جميع بياناتك الجامعية بدقة، بما في ذلك اسم الجامعة والكلية ورقم الطالب، حتى تتمكن من استعارة الكتب بسهولة وتتبع طلباتك دون أي مشاكل',
              ),
            if (!provider.isStudent) ...[
              Text(
                textDirection: TextDirection.rtl,
                style: TextStyle(color: titleColor, fontSize: 14.sp),
                'يجوز للخريجين استخدام التطبيق لمساعدة زملائهم الأصغر سناً في إعارة الكتب الدراسية، يرجى ادخال رقم هويتك بدلاً من الرقم الجامعي، وملء بيانات جامعتك السابقة والتخصص.',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
