import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';

import 'package:Zowwad/screens/edit-item/provider.dart';
import 'package:Zowwad/screens/edit-item/widgets/arabic-section.dart';
import 'package:Zowwad/screens/edit-item/widgets/draggable-button.dart';
import 'package:Zowwad/screens/edit-item/widgets/english-section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../book/widgets/tab-button.dart';

class EditItemScreen extends StatelessWidget {
  static const id = '/edit-item';

  const EditItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Item'),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Consumer<EditItemProvider>(
                            builder: (context, provider, child) {
                              return TabButton(
                                label: "العربية",
                                isSelected: provider.showArabic,
                                onPressed: () => provider.showArabicTab(),
                                selectedColor: primaryColor,
                                unselectedColor: Colors.white,
                                selectedTextColor: Colors.white,
                                unselectedTextColor: titleColor,
                                selectedBorderColor: Colors.transparent,
                                unselectedBorderColor: containerBorderLight,
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Consumer<EditItemProvider>(
                            builder: (context, provider, child) {
                              return TabButton(
                                label: "English",
                                isSelected: !provider.showArabic,
                                onPressed: () => provider.showEnglishTab(),
                                selectedColor: primaryColor,
                                unselectedColor: Colors.white,
                                selectedTextColor: Colors.white,
                                unselectedTextColor: titleColor,
                                selectedBorderColor: Colors.transparent,
                                unselectedBorderColor: containerBorderLight,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Consumer<EditItemProvider>(
                builder: (context, provider, child) {
                  return provider.showArabic
                      ? ArabicSection()
                      : EnglishSection();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DraggableButton(title: 'Save', onPressed: () {}),
    );
  }
}
