import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/addons/data.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/addons/widgets/alerts/alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../edit-item/widgets/draggable-button.dart';

class AddonsScreen extends StatelessWidget {
  static const id = '/addons';
  const AddonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Addons'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: addons.length,
              separatorBuilder:
                  (context, index) => Divider(
                    color: verticalDividerColor,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
              itemBuilder: (context, index) {
                final item = addons[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['name']!,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        item['price']!,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: DraggableButton(
        title: 'Add New Addon',
        onPressed: () => showNewAddonAlert(context),
      ),
    );
  }
}
