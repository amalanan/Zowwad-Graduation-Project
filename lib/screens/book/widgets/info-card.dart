import 'package:Zowwad/screens/book/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import 'info-column.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookProvider>();
    final book = provider.selectedBook;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: cardBorder, width: 1),
          ),
          child: Column(
            children: [
              /// TOP SECTION
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Sound Icon
                  Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      color: containerColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(soundIcon, height: 24.h),
                    ),
                  ),

                  const Spacer(),

                  /// Text Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        book.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        book.status,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: book.status == "متوفر"
                              ? greenColor
                              : redColor,
                          fontWeight: FontWeight.w500,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),

                  /// Book Image
                  Container(
                    height: 78.h,
                    width: 78.w,
                    decoration: BoxDecoration(
                      color: greyBgColor,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: containerBorderLight),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.r),
                      child: Image.network(
                        provider.selectedBookDto.image ?? '',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            uniBook,
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// BOTTOM INFO SECTION
              Row(
                children: [
                  Expanded(
                    child: InfoColumn(
                      icon: SvgPicture.asset(basketIcon, height: 18.h),
                      title: "تواصل",
                      label: book.email,
                      titleColor: titleColor,
                      labelColor: primaryColor,
                    ),
                  ),

                  _divider(),

                  Expanded(
                    child: InfoColumn(
                      icon: SvgPicture.asset(clockIcon, height: 18.h),
                      title: "مدى التوفر",
                      label: book.status == "available" ? "فوري" : "قريباً",
                      titleColor: titleColor,
                      labelColor: primaryColor,
                    ),
                  ),

                  _divider(),

                  Expanded(
                    child: InfoColumn(
                      icon: SvgPicture.asset(locationIcon, height: 18.h),
                      title: "عرض",
                      label: "الموقع",
                      labelColor: primaryColor,
                      titleColor: redColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),
              Divider(color: verticalDividerColor, height: 24.h),
              SizedBox(height: 8.h),

              /// FOOTER
              Text(
                "يمكنك التواصل مع مالك الكتاب باستخدام البريد الإلكتروني أعلاه",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: greenColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _divider() => SizedBox(
        height: 50.h,
        child: VerticalDivider(color: verticalDividerColor),
      );
}
