import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/business,%20expenses/privacy-policy/widgets/policy-section.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class TermsConditionsScreen extends StatelessWidget {
  static const id = '/terms';

  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(title: 'الشروط والأحكام'),
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
                      'اقرأ الشروط والأحكام الخاصة بنا',
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
                  title: 'قبول الشروط',
                  body:
                      'باستخدام تطبيق زواد لاستعارة الكتب، فإنك توافق على الالتزام بهذه الشروط والأحكام، والتي تشكل اتفاقية قانونية ملزمة بينك وبين زواد.',
                ),
                PolicySection(
                  number: '٢',
                  title: 'الخدمات المقدمة',
                  body:
                      'يوفر تطبيق زواد منصة لعرض الكتب المتاحة للاستعارة. جميع الطلبات تتم **خارج التطبيق** باستخدام بيانات التواصل أسفل كل كتاب. التطبيق لا يدير عمليات الدفع أو التسليم.',
                ),
                PolicySection(
                  number: '٣',
                  title: 'مسؤوليات المستخدم',
                  body:
                      'أنت مسؤول عن التواصل المباشر مع صاحب الكتاب عبر البيانات المتوفرة. ويجب الالتزام بالأمانة في التعامل واحترام حقوق الآخرين عند استعارة الكتب.',
                ),
                PolicySection(
                  number: '٤',
                  title: 'الأمان والخصوصية',
                  body:
                      'زواد يضمن حماية معلوماتك الشخصية ويستخدم البيانات فقط لتسهيل التواصل بين المستخدمين. التطبيق لا يخزن أو يتعامل مع تفاصيل الدفع أو المعاملات المالية.',
                ),
                PolicySection(
                  number: '٥',
                  title: 'حدود الخدمة',
                  body:
                      'التطبيق يوفر منصة للإعلانات وعرض الكتب فقط، ولا يتحمل مسؤولية أي نزاع أو ضرر قد ينشأ بين المستخدمين عند استعار الكتب أو التسليم.',
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
