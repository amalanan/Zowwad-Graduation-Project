import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsContainer extends StatelessWidget {
  final bool? noArrow;
  final List<Map<String, dynamic>> items;

  const OptionsContainer({
    super.key,
    required this.items,
    this.noArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children:
            items
                .map(
                  (item) => ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item['title'],
                          style: GoogleFonts.tajawal(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        SvgPicture.asset(
                          item['icon'],
                          height: 36.h,
                          width: 36.w,
                        ),
                      ],
                    ),

                    leading:
                        noArrow!
                            ? SizedBox()
                            : item['isLanguageTile']
                            ? Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                SvgPicture.asset(
                                  arrowLeftIcon,
                                  height: 20.h,
                                  width: 20,
                                ),
                                SvgPicture.asset(
                                  ukFlag,
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                SizedBox(width: 4.w),
                              ],
                            )
                            : SvgPicture.asset(
                              arrowLeftIcon,
                              height: 20.h,
                              width: 20,
                            ),
                    onTap: item['onTap'],
                  ),
                )
                .toList(),
      ),
    );
  }
}
