import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ad-details/widgets/custom-elevated-button.dart';

class DraggableButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Widget? icon;
  final bool? button;
  final Widget? child;
  final bool? outlined;
  final Widget? upperWidget;

  const DraggableButton({
    super.key,
    this.title,
    this.onPressed,
    this.icon,
    this.button = true,
    this.child,
    this.outlined = false,
    this.upperWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: upperWidget != null ? 140.h : 87.h,
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
            child:
                button!
                    ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        upperWidget != null
                            ? Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0.w,
                                vertical: 8.h,
                              ),

                              child: upperWidget!,
                            )
                            : SizedBox(height: 16.h),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomElevatedButton(
                            icon: icon,
                            text: title ?? '',
                            outlined: outlined,
                            onPressed: onPressed ?? () {},
                            color: outlined! ? Colors.white : primaryColor,
                          ),
                        ),
                      ],
                    )
                    : child,
          );
        },
      ),
    );
  }
}
