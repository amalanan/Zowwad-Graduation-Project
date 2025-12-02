import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-elevated-button.dart';
import 'package:Zowwad/screens/starting/verify otp/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../reset password/reset-password.dart';

class VerifyOtpScreen extends StatefulWidget {
  static const id = '/verify-otp';

  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  String email = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Read the passed email
    email = ModalRoute.of(context)!.settings.arguments as String;

    // Save inside provider
    Provider.of<VerifyOtpProvider>(context, listen: false).setEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VerifyOtpProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("تأكيد الرمز"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "تم إرسال رمز التحقق إلى:",
              style: TextStyle(fontSize: 16.sp, color: Colors.black54),
            ),

            SizedBox(height: 10.h),

            Text(
              email,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40.h),

            TextField(
              decoration: InputDecoration(
                labelText: "رمز التحقق (OTP)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: provider.setOtp,
            ),

            SizedBox(height: 25.h),

            provider.loading
                ? CircularProgressIndicator()
                : CustomElevatedButton(
                  text: 'تحقق',
                  color: primaryColor,
                  onPressed: () async {
                    await provider.verifyOtp();

                    if (provider.success != null) {
                      Navigator.pushNamed(
                        context,
                        ResetPasswordScreen.id,
                        arguments: {
                          "email": provider.email,
                          "otp": provider.otp,
                        },
                      );
                    }
                  },
                ),

            SizedBox(height: 20.h),

            if (provider.error != null)
              Text(
                provider.error!,
                style: TextStyle(color: Colors.red, fontSize: 14.sp),
              ),

            if (provider.success != null)
              Text(
                provider.success!,
                style: TextStyle(color: Colors.green, fontSize: 14.sp),
              ),
          ],
        ),
      ),
    );
  }
}
