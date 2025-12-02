import 'package:Zowwad/screens/starting/forgot-pass/provider.dart';
import 'package:Zowwad/screens/starting/verify%20otp/verify-otp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-elevated-button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassScreen extends StatelessWidget {
  static const id = '/forgot-pass-screen';

  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailProvider = Provider.of<EmailProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: 'نسيت كلمة المرور'),
      backgroundColor: Colors.white,
      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 105.h),
                  Image.asset(logo, height: 100.h),
                  SizedBox(height: 24.h),
                  Text(
                    'نسيت كلمة المرور',
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    textAlign: TextAlign.center,
                    'الرجاء ادخال الايميل المربوط بحسابك حتى نستطيع مساعدتك في استرجاعه',
                    style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    hint: 'example@gmail.com',
                    label: 'الايميل ',
                    onChanged: (value) => emailProvider.setEmail(value),
                  ),
                  SizedBox(height: 32.h),
          
                  // Show loading indicator or the confirm button
                  emailProvider.isLoading
                      ? CircularProgressIndicator()
                      : CustomElevatedButton(
                    text: 'تأكيد',
                    onPressed: () async {
                      await emailProvider.sendForgotPassword();
          
                      if (emailProvider.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(emailProvider.error!)),
                        );
                      } else if (emailProvider.success != null) {
                        // Navigate to MainScreen after success
                        Navigator.pushNamed(context, VerifyOtpScreen.id, arguments: emailProvider.email,);
                      }
                    },
                    color: primaryColor,
                  ),
          
                  SizedBox(height: 16.h),
          
                  // Show error or success messages
                  if (emailProvider.error != null)
                    Text(
                      emailProvider.error!,
                      style: TextStyle(color: Colors.red),
                    ),
                  if (emailProvider.success != null)
                    Text(
                      emailProvider.success!,
                      style: TextStyle(color: Colors.green),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
