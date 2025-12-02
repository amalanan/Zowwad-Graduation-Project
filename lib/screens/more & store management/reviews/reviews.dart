import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/book/widgets/custom-search-field.dart';
import 'package:Zowwad/screens/book/widgets/review-section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ad-details/widgets/custom-app-bar.dart';

class ReviewsScreen extends StatelessWidget {
  static const id = '/reviews';
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Reviews'),

      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomParentContainer(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0.h),
                child: CustomSearchField(
                  titleColor: titleColor,
                  width: double.infinity,
                  fillColor: greyBgColor,
                  controller: TextEditingController(),
                ),
              ),
              ReviewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
