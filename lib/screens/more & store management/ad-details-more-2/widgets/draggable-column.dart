import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';
import '../../../ad-details/widgets/custom-elevated-button.dart';

class DraggableColumn extends StatelessWidget {
  final Function() onPressed1;
  final String title1;
  final Function() onPressed2;
  final String title2;

  const DraggableColumn({
    super.key,
    required this.onPressed1,
    required this.title1,
    required this.onPressed2,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155.h,
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0.4,
        maxChildSize: 1.0,
        builder: (context, scrollController) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 6.r,
                  spreadRadius: 2.r,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomElevatedButton(
                    text: title1,

                    onPressed: onPressed1,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: CustomElevatedButton(
                    text: title2,
                    outlined: true,
                    onPressed: onPressed2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
