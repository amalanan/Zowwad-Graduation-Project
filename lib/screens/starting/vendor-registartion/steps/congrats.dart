import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-elevated-button.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/starting/sign-in/sign-in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CongratulationsScreen extends StatelessWidget {
  static const id = '/congrats';

  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تسجيل حساب جديد'),
      body: CustomParentContainer(
        children: [
          Center(child: SvgPicture.asset(ribbonsIcon)),
          SizedBox(height: 47.h),
          Center(
            child: SvgPicture.asset(successIcon, height: 106.h, width: 106.w),
          ),
          SizedBox(height: 23.h),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              ' 🎉 ! أهلاً بك في عائلة زوّاد',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: Text(
              textAlign: TextAlign.center,

              style: TextStyle(color: titleColor, fontSize: 16.sp),
              '.شكراً لتسجيلك في زوّاد، قم بتأكيد حسابك من خلال بريك الإلكتروني',
            ),
          ),
          SizedBox(height: 32.h),
          CustomElevatedButton(
            text: 'قم بتسجيل الدخول',
            onPressed:
                () => Navigator.pushReplacementNamed(context, SignInScreen.id),
            outlined: true,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
