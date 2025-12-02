import 'dart:io';

import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/provider.dart';
import 'package:Zowwad/screens/ad-details/widgets/custm-switch-tile.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-map.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-title.dart';
import 'package:Zowwad/screens/ad-details/widgets/upload-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../edit-item/widgets/draggable-button.dart';

class CreateAdScreen extends StatelessWidget {
  static const id = '/create-new-ad';

  const CreateAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateAdProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: CustomAppBar(title: 'إضافة كتاب'),
        body: Padding(
          padding: EdgeInsets.only(top: 16.0.h),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔽 Book images (logo + cover)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Book Image
                      UploadContainer(
                        title: "صورة للكتاب",
                        ratio: '1:1',
                        image: GestureDetector(
                          onTap: provider.pickLogoImage,
                          child: provider.logoImage != null
                              ? _imagePreview(provider.logoImage!, provider.removeLogoImage)
                              : SvgPicture.asset(uploadContainer, height: 90.h, width: 90.w),
                        ),
                      ),
                      SizedBox(width: 16.w),

                      // Cover Image
                      UploadContainer(
                        title: "الغلاف",
                        ratio: '1:3',
                        image: GestureDetector(
                          onTap: provider.pickCoverImage,
                          child: provider.coverImage != null
                              ? _imagePreview(provider.coverImage!, provider.removeCoverImage, isWide: true)
                              : SvgPicture.asset(uploadContainer, height: 90.h, width: 270.w),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // 🔽 Book Info
                  CustomTitle(title: "معلومات الكتاب"),
                  SizedBox(height: 16.h),

                  CustomTextField(
                    label: 'اسم الكتاب',
                    hint: 'اسم الكتاب...',
                    controller: provider.bookTitleController,
                  ),
                  SizedBox(height: 16.h),

                  CustomTextField(
                    label: 'اسم الكلية',
                    hint: 'اسم الكلية...',
                    controller: provider.facultyNameController,
                  ),
                  SizedBox(height: 16.h),

                  // The rest of the UI is unchanged, just left as-is:
                  CustomTextField(
                    label: 'الكلية (English)',
                    hint: 'الكلية (English)',
                  ),
                  SizedBox(height: 16.h),

                  CustomTextField(
                    isPhoneNum: true,
                    label: 'رقم الجوال',
                    hint: '٩٤٣٢١٠٩٨٥',
                  ),
                  SizedBox(height: 16.h),

                  CustomTitle(title: 'معلومات الموقع'),
                  CustomMap(assetPath: mapIcon),
                  SizedBox(height: 16.h),

                  CustomTextField(
                    label: 'العنوان (English)',
                    hint: 'العنوان (English)',
                  ),
                  SizedBox(height: 16.h),

                  CustomTextField(
                    label: 'العنوان(Arabic)',
                    hint: 'العنوان (Arabic)',
                  ),
                  SizedBox(height: 16.h),

                  CustomTitle(title: 'التفضيلات'),
                  SizedBox(height: 16.h),

                  CustomSwitchTile(
                    title: 'توصيل',
                    value: provider.delivery,
                    onChanged: provider.toggleDelivery,
                  ),
                  SizedBox(height: 16.h),

                  CustomSwitchTile(
                    title: 'استلام',
                    value: provider.takeAway,
                    onChanged: provider.toggleTakeAway,
                  ),
                ],
              ),
            ),
          ),
        ),

        // 🔽 Bottom Button: Submit
        bottomNavigationBar: DraggableButton(
          title: provider.isLoading ? 'جاري الإضافة...' : 'إضافة',
          onPressed: provider.isLoading
              ? null
              : () async {
            await provider.submitBook();

            if (provider.creationSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تمت إضافة الكتاب بنجاح!')),
              );
              provider.resetForm();
              Navigator.pop(context);
            } else if (provider.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(provider.errorMessage!)),
              );
            }
          },
        ),
      ),
    );
  }

  // Helper widget for image preview
  Widget _imagePreview(File image, VoidCallback onRemove, {bool isWide = false}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image.file(
            image,
            height: 90.h,
            width: isWide ? 270.w : 90.w,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 4.h,
          right: 4.w,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(4),
              child: Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }
}
