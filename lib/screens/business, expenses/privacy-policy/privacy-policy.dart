import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/business,%20expenses/privacy-policy/widgets/policy-section.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class PrivacyPolicyScreen extends StatelessWidget {
  static const id = '/policy';

  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(title: 'سياسة الخصوصية'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: CustomParentContainer(
              children: [
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(policiesImg, height: 50.h, width: 50.w),
                    SizedBox(width: 12.w),
                    Text(
                      'اقرأ سياسة الخصوصية الخاصة بنا',
                      style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                PolicySection(
                  number: '١',
                  title: 'جمع البيانات',
                  body:
                      'زواد يجمع معلوماتك الشخصية فقط لتسهيل التواصل بين المستخدمين فيما يتعلق باستعارة الكتب، مثل الاسم ورقم الهاتف والبريد الإلكتروني.',
                ),
                PolicySection(
                  number: '٢',
                  title: 'استخدام البيانات',
                  body:
                      'تُستخدم البيانات لتسهيل التواصل بين المستخدم الذي يريد استعارة الكتاب وصاحب الكتاب. التطبيق لا يخزن معلومات الدفع أو يشاركها مع أي طرف ثالث.',
                ),
                PolicySection(
                  number: '٣',
                  title: 'حماية البيانات',
                  body:
                      'زواد يلتزم بحماية بياناتك الشخصية ويمنع الوصول غير المصرح به لها. جميع المعلومات المستخدمة للتواصل محمية ضمن التطبيق.',
                ),
                PolicySection(
                  number: '٤',
                  title: 'المسؤولية',
                  body:
                      'زواد ليس مسؤولا عن أي نزاع أو ضرر قد يحدث بين المستخدمين خلال استعارة الكتب، أو أي عملية غير مباشرة تتم خارج التطبيق.',
                ),
                PolicySection(
                  number: '٥',
                  title: 'تحديث السياسة',
                  body:
                      'قد يتم تعديل سياسة الخصوصية والشروط من وقت لآخر، وسيتم إعلام المستخدمين بأي تغييرات مهمة لضمان استمرار الاستخدام الآمن للتطبيق.',
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
