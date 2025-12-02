import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-title.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PassInformation extends StatelessWidget {
  const PassInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, child) => Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              CustomTitle(title: 'تعيين كلمة المرور'),
              SizedBox(height: 16.h),

              // ==========================
              //       PASSWORD
              // ==========================
              CustomTextField(
                controller: provider.passwordController,
                obscure: !provider.isVisible1,
                hint: '*********',
                label: 'كلمة المرور',

                suffixIcon: SvgPicture.asset(
                  provider.isVisible1 ? visibleEyeIcon : invisibleEyeIcon,
                ),

                suffixMethod: () => provider.toggleVisibility(1),

                onChanged: provider.updatePassword,
              ),
              SizedBox(height: 16.h),

              // ==========================
              //     CONFIRM PASSWORD
              // ==========================
              CustomTextField(
                controller: provider.confirmPasswordController,
                obscure: !provider.isVisible2,
                hint: '*********',
                label: 'تأكيد كلمة المرور',

                suffixIcon: SvgPicture.asset(
                  provider.isVisible2 ? visibleEyeIcon : invisibleEyeIcon,
                ),

                suffixMethod: () => provider.toggleVisibility(2),

                onChanged: provider.updateConfirmPassword,
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
