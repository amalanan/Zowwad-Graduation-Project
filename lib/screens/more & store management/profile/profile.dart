
import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/more/more.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/more/widgets/profile-img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../edit-item/widgets/custom-parent-container.dart';
import '../../edit-item/widgets/draggable-button.dart';
import '../more/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const id = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoreScreenProvider>(
      builder: (context, provider, child) {
        // Start by loading profile if not done yet
        if (provider.profile == null && !provider.isLoadingProfile) {
          provider.loadProfile();
        }

        return Scaffold(
          appBar: CustomAppBar(title: 'الملف الشخصي'),
          body: SafeArea(
            child: provider.isLoadingProfile
                ? const Center(child: CircularProgressIndicator())
                : provider.errorMessage != null
                ? Center(child: Text(provider.errorMessage!))
                : SingleChildScrollView(
              child: CustomParentContainer(
                children: [
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 122.0.w),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap: provider.pickImage,
                          child: ProfileImage(
                            height: 120,
                            width: 120,
                            img: provider.imageFile != null
                                ? provider.imageFile!.path // local picked image path
                                : provider.profile?.image ?? person, // network URL or asset fallback
                          ),

                        ),
                        Positioned(
                          bottom: -8.h,
                          right: -20.w,
                          child: SvgPicture.asset(
                            editOrange,
                            height: 32.h,
                            width: 32.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // الاسم كاملا
                  CustomTextField(
                    controller: provider.nameController,
                    label: 'الاسم كاملا',
                    hint: provider.profile?.name ?? '',
                  ),
                  SizedBox(height: 16.h),

                  // البريد الإلكتروني
                  CustomTextField(
                    controller: provider.emailController,
                    label: 'البريد الإلكتروني',
                    hint: provider.profile?.email ?? '',
                  ),
                  SizedBox(height: 16.h),

                  // رقم الجوال
                  CustomTextField(
                    controller: provider.phoneController,
                    label: 'رقم الجوال',
                    isPhoneNum: true,
                    hint: provider.profile?.phoneNumber ?? '',
                  ),
                  SizedBox(height: 16.h),

                  // المستوى الدراسي (role)
                  CustomTextField(
                    controller: provider.levelController,
                    label: 'المستوى الدراسي',
                    hint: provider.profile?.role ?? '',
                  ),
                  SizedBox(height: 16.h),

                  // الرقم الجامعي / رقم الهوية
                  CustomTextField(
                    controller: provider.nationalIdController,
                  
                    label: 'الرقم الجامعي / رقم الهوية',
                    hint: provider.profile?.nationalId?.isNotEmpty == true
                        ? provider.profile!.nationalId!
                        : (provider.profile?.universityId ?? ''),
                  ),
                  SizedBox(height: 16.h),

                  // اسم الجامعة
                  CustomTextField(
                    controller: provider.universityController,
                    label: 'اسم الجامعة',
                    hint: provider.profile?.university ?? '',
                  ),
                  SizedBox(height: 16.h),

                  // اسم التخصص (department)
                  CustomTextField(
                    controller: provider.departmentController,
                    label: 'اسم التخصص',
                    hint: provider.profile?.department ?? '',
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
          bottomNavigationBar: DraggableButton(
            title: provider.isSaving ? 'جار حفظ التغييرات...' : 'حفظ التغييرات',
            onPressed: provider.isSaving
                ? null // Disable while saving
                : () async {
              await provider.saveProfile();
              if (provider.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(provider.errorMessage!)),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم حفظ التغييرات بنجاح')),
                );
                Navigator.pushNamed(context, MoreScreen.id);
              }
            },
          ),
        );
      },
    );
  }
}
