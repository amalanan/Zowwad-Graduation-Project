import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-text-field.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-title.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details-more-2/provider.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details-more-2/widgets/arabic-section.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details-more-2/widgets/draggable-column.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details-more-2/widgets/english-section.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details-more-2/widgets/preview-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../book/widgets/tab-button.dart';

class EditAdScreen extends StatelessWidget {
  static const id = '/ad-details-more-2';

  const EditAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ad Details'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomParentContainer(
            children: [
              SizedBox(height: 16.h),
              CustomTitle(title: 'Advertise Info'),
              SizedBox(height: 16.h),
              CustomTextField(hint: 'Video Promotion', label: 'Promo Type'),
              SizedBox(height: 16.h),
              CustomTextField(
                hint: '19/8/2025 - 31/12/2025',
                label: 'Validity',
                suffixIcon: SvgPicture.asset(
                  calendarIcon,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer<AdDetailsMore2Provider>(
                    builder: (context, provider, child) {
                      return TabButton(
                        width: 165,
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
                  SizedBox(width: 10.w),
                  Consumer<AdDetailsMore2Provider>(
                    builder: (context, provider, child) {
                      return TabButton(
                        width: 165,
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
                ],
              ),
              Consumer<AdDetailsMore2Provider>(
                builder:
                    (context, provider, child) =>
                        provider.showArabic
                            ? ArabicSectionMore()
                            : EnglishSection2(),
              ),
              SizedBox(height: 35.h),
              Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 85.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    separatorBuilder: (context, index) => SizedBox(width: 12.w),
                    itemBuilder:
                        (context, index) =>
                            PreviewCard(img: Image.asset(uniBook)),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DraggableColumn(
        onPressed1: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        title1: 'Confirm',
        onPressed2: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        title2: 'Reset',
      ),
    );
  }
}
