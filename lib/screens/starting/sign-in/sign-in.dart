import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-elevated-button.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-checkbox.dart';
import 'package:Zowwad/screens/starting/forgot-pass/forgot-pass.dart';
import 'package:Zowwad/screens/starting/sign-in/provider.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../main/ui/screens/main_screen.dart';
import '../../book/widgets/tab-button.dart';

class SignInScreen extends StatelessWidget {
  static const id = '/sign-in';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Center(
            child: Consumer<SignInProvider>(
              builder:
                  (context, tabProvider, child) => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 48.h),
                        Image.asset(logo, height: 100.h, width: 100.w),
                        SizedBox(height: 24.h),
                        Text(
                          'تسجيل دخول',
                          style: TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'اختر الطريقة التي تنطبق عليك',
                          style: TextStyle(
                            color: titleColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TabButton(
                              width: 168,
                              label: "طالب جامعي",
                              isSelected: tabProvider.showStudent,
                              onPressed: () => tabProvider.showStudentTab(),
                              selectedColor: primaryColor,
                              unselectedColor: Colors.white,
                              selectedTextColor: Colors.white,
                              unselectedTextColor: titleColor,
                              selectedBorderColor: Colors.transparent,
                              unselectedBorderColor: containerBorderLight,
                            ),
                            const SizedBox(width: 10),
                            TabButton(
                              width: 168,
                              label: "خريج",
                              isSelected: !tabProvider.showStudent,
                              onPressed: () => tabProvider.showGraduateTab(),
                              selectedColor: primaryColor,
                              unselectedColor: Colors.white,
                              selectedTextColor: Colors.white,
                              unselectedTextColor: titleColor,
                              selectedBorderColor: Colors.transparent,
                              unselectedBorderColor: containerBorderLight,
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),
                        tabProvider.showStudent
                            ? CustomTextField(
                              hint: '220201195',
                              label: 'الرقم الجامعي',

                              controller: idController,
                            )
                            : CustomTextField(
                              hint: '408124345',
                              label: 'رقم الهوية',

                              controller: idController,
                            ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          controller: passwordController,
                          obscure: !tabProvider.isVisible1,
                           hint: 'ادخل كلمة المرور',
                          label: 'كلمة المرور',

                          suffixIcon: SvgPicture.asset(
                            tabProvider.isVisible1
                                ? visibleEyeIcon
                                : invisibleEyeIcon,
                          ),

                          suffixMethod: () => tabProvider.toggleVisibility(1),

                          onChanged: tabProvider.showStudent? tabProvider.updateStuPassword : tabProvider.updateGradPassword ,
                        ),
                      

                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap:
                                  () => Navigator.pushNamed(
                                    context,
                                    ForgotPassScreen.id,
                                  ),
                              child: Text(
                                'نسيت كلمة المرور؟',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            CustomCheckbox(
                              title: 'تذكرني',
                              providerKey: 'remember-me',
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),
                        CustomElevatedButton(
                          text: 'تسجيل الدخول',
                          onPressed: () async {
                            final provider = context.read<SignInProvider>();

                            try {
                              final success = await provider.login(
                                idController.text.trim(),
                                passwordController.text.trim(),
                              );

                              if (success) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  MainScreen.id,
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            }
                          },
                          color: primaryColor,
                        ),
                        SizedBox(height: 24.h),
                        GestureDetector(
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                RegistrationScreen.id,
                              ),
                          child: Text(
                            '! انضم إلينا',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: titleColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
