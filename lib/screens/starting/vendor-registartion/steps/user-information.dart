import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-title.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  void initState() {
    super.initState();

    // Fetch location on entering this step
    Future.microtask(() {
      Provider.of<RegistrationProvider>(context, listen: false)
          .getCurrentLocation();
    });

    print(
      'current location: ${Provider.of<RegistrationProvider>(
        context,
        listen: false,
      ).currentPosition}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);

    return Column(
      children: [
        // =======================
        //     USER INFO SECTION
        // =======================
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              CustomTitle(title: 'معلومات المستخدم'),
              SizedBox(height: 16.h),

              // FULL NAME
              CustomTextField(
                controller: provider.fullNameController,
                hint: 'أدخل اسمك رباعي',
                label: 'الاسم كاملا',
                onChanged: provider.updateFullName,
              ),
              SizedBox(height: 16.h),

              // EMAIL
              CustomTextField(
                controller: provider.emailController,
                hint: 'example@email.com',
                label: 'البريد الإلكتروني',
                onChanged: provider.updateEmail,
              ),
              SizedBox(height: 16.h),

              // PHONE
              CustomTextField(
                controller: provider.phoneController,
                isPhoneNum: true,
                hint: '059XXXXXXX',
                label: 'رقم الجوال',
                onChanged: provider.updatePhone,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: provider.addressController,
                hint: 'غزة',
                label: 'العنوان ',
                onChanged: provider.updateAddress,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),

        // =======================
        //      STUDY INFO
        // =======================
        CustomParentContainer(
          children: [
            SizedBox(height: 16.h),
            CustomTitle(title: 'المعلومات الدراسية'),
            SizedBox(height: 16.h),

            // STUDY LEVEL
            CustomTextField(
              controller: provider.studyLevelController,
              hint: 'طالب / خريج',
              label: 'المستوى الدراسي',
              onChanged: provider.updateStudyLevel,
            ),
            SizedBox(height: 16.h),

            // UNI ID OR NATIONAL ID
            CustomTextField(
              controller: provider.idController,
              hint: provider.isStudent ? 'رقمك الجامعي' : 'رقم الهوية',
              label:
              'أدخل رقمك الجامعي\n(إن كنت خريجاً قم بإدخال رقم الهوية)',
              onChanged: provider.updateId,
            ),
            SizedBox(height: 16.h),

            // UNIVERSITY NAME
            CustomTextField(
              controller: provider.universityController,
              hint: 'الجامعة الإسلامية بغزة',
              label: 'اسم الجامعة',
              onChanged: provider.updateUniversityName,
            ),
            SizedBox(height: 16.h),

            // DEPARTMENT
            CustomTextField(
              controller: provider.departmentController,
              hint: 'هندسة الحاسوب',
              label: 'اسم التخصص',
              onChanged: provider.updateDepartment,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ],
    );
  }
}
