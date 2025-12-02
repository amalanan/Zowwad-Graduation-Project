import 'package:Zowwad/screens/book/widgets/alert-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/constants.dart';

Future<void> showDeleteAlert(
  BuildContext context,
  String title,
  Function() onConfirm,
) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 174.h,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 32.h,
                      horizontal: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          title,
                          style: TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomAlertButton(
                              text: 'No, Cancel',
                              onPressed: () => Navigator.pop(context),
                              fillColor: Colors.white,
                              isOutlined: true,
                              textColor: blackColor,
                              borderColor: blackColor,
                            ),
                            SizedBox(width: 16.w),
                            CustomAlertButton(
                              text: 'Yes, Delete',
                              onPressed: () => onConfirm,
                              fillColor: deleteColor,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -10,
                left: 16,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(closeIcon, height: 32.h, width: 32.w),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
