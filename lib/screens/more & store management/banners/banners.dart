import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/edit-item/widgets/draggable-button.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/banners/widgets/alerts/alerts.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/banners/widgets/banner-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannersScreen extends StatelessWidget {
  static const id = '/banner';

  const BannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DraggableButton(
        title: 'Add New Banner',
        onPressed: () => showNewBannerAlert(context),
      ),
      appBar: CustomAppBar(title: 'Banners'),
      body: SafeArea(
        child: CustomParentContainer(
          children: [
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: borderColor, width: 1.w),
              ),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: Text(
                  'Customers will see these banners in your store details page',
                  maxLines: 2,
                  style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => BannerCard(),
                separatorBuilder: (context, index) => SizedBox(height: 24.h),

                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
