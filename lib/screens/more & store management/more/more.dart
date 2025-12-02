import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-title.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/more/provider.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/more/widgets/info-row.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/more/widgets/options-container.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/more/widgets/small-container.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/profile/profile.dart';
import 'package:Zowwad/screens/starting/sign-in/sign-in.dart';
import 'package:Zowwad/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  static const id = '/more';
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MoreScreenProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(title: 'المزيد'),
      body: FutureBuilder(
        future: provider.loadProfile(), // Load profile only once
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          if (provider.profile == null) {
            return const Center(child: Text('لم يتم تحميل البيانات'));
          }

          return _buildContent(context, provider);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, MoreScreenProvider provider) {
    final profile = provider.profile!;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                height: 80.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: SmallContainer(
                          color: containerColor,
                          title: 'تفاصيل',
                        ),
                        onTap:
                            () =>
                                Navigator.pushNamed(context, ProfileScreen.id),
                      ),
                      // InfoRow(
                      //   image: ClipOval(
                      //     child: profile.image != null && profile.image!.isNotEmpty
                      //         ? Image.network(
                      //       profile.image!,
                      //       width: 48.w,
                      //       height: 48.h,
                      //       fit: BoxFit.cover,
                      //       errorBuilder: (_, __, ___) => Image.asset(
                      //         person,
                      //         width: 48.w,
                      //         height: 48.h,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     )
                      //         : Image.asset(
                      //       person,
                      //       width: 48.w,
                      //       height: 48.h,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      //   name: profile.name,
                      //   number: '+${profile.phoneNumber}',
                      // ),
                      InfoRow(
                        image: profile.image ?? person, // ← فقط String
                        name: profile.name,
                        number: "+${profile.phoneNumber}",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              CustomTitle(title: 'إدارة المكتبة'),
              SizedBox(height: 16.h),
              OptionsContainer(items: provider.bookManagementItems(context)),
              SizedBox(height: 16.h),
              CustomTitle(title: 'المساعدة والخصوصية'),
              SizedBox(height: 16.h),
              OptionsContainer(items: provider.settingsItems(context)),
              SizedBox(height: 16.h),
              OptionsContainer(
                noArrow: true,
                items: [
                  {
                    'title': 'تسجيل الخروج',
                    'icon': logoutCircle,
                    'onTap': () async {
                      await LocalStorage.clearToken();

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        SignInScreen.id,
                        (route) => false,
                      );
                    },
                  },
                ],
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to load network image with fallback
  Widget _buildProfileImage(String? imageUrl) {
    const double size = 48;

    if (imageUrl != null && imageUrl.isNotEmpty) {
      return ClipOval(
        child: Image.network(
          imageUrl,
          height: size.h,
          width: size.w,
          fit: BoxFit.cover,
          errorBuilder:
              (_, __, ___) =>
                  SvgPicture.asset(person, height: size.h, width: size.w),
        ),
      );
    }

    return ClipOval(
      child: SvgPicture.asset(person, height: size.h, width: size.w),
    );
  }
}
