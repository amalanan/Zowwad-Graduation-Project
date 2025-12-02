import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-elevated-button.dart';
import 'package:Zowwad/screens/starting/reset password/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sign-in/sign-in.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const id = '/reset-password';

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final email = args["email"];
    final otp = args["otp"];

    final provider = Provider.of<ResetPasswordProvider>(context, listen: false);
    provider.setEmail(email);
    provider.setToken(otp);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResetPasswordProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("إعادة تعيين كلمة المرور"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "أدخل رمز التحقق الذي وصلك، ثم قم بتعيين كلمة مرور جديدة.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: Colors.black54),
            ),

            SizedBox(height: 30.h),

            TextField(
              decoration: InputDecoration(
                labelText: "كلمة المرور الجديدة",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: provider.setPassword,
            ),

            SizedBox(height: 16.h),

            TextField(
              decoration: InputDecoration(
                labelText: "تأكيد كلمة المرور",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: provider.setConfirmPassword,
            ),

            SizedBox(height: 30.h),

            provider.loading
                ? Center(child: CircularProgressIndicator())
                : CustomElevatedButton(
                  text: "إعادة تعيين",
                  color: primaryColor, // نفس لون زر تسجيل الدخول
                  onPressed: () async {
                    await provider.resetPassword();

                    if (provider.success != null) {
                      Navigator.pushReplacementNamed(context, SignInScreen.id);
                    }
                  },
                ),

            SizedBox(height: 20.h),

            if (provider.error != null)
              Text(
                provider.error!,
                style: TextStyle(color: Colors.red, fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
            if (provider.success != null)
              Text(
                provider.success!,
                style: TextStyle(color: Colors.green, fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
