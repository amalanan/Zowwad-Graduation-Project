import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-title.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/home%20&%20wallet/home/provider.dart';
import 'package:Zowwad/screens/home%20&%20wallet/home/widgets/checking-container.dart';
import 'package:Zowwad/screens/home%20&%20wallet/home/widgets/filled-container.dart';
import 'package:Zowwad/screens/home%20&%20wallet/home/widgets/sales-boost.dart';
import 'package:Zowwad/screens/home%20&%20wallet/notfications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../books/widgets/books.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150.w,
        leading: Row(
          children: [
            SizedBox(width: 16.w),
            Image.asset(walmartSymbol, height: 32.h, width: 32.w),
            SizedBox(width: 8.w),
            Text(
              'Walmart',

              style: GoogleFonts.tajawal(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, NotificationsScreen.id),
              child: SvgPicture.asset(
                notificationIcon,
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Consumer<HomeProvider>(
          builder:
              (context, provider, child) => SingleChildScrollView(
                child: CustomParentContainer(
                  children: [
                    SizedBox(height: 16.h),
                    checkingContainer(title: 'Restaurant Temporarily Closed'),
                    SizedBox(height: 24.h),
                    SizedBox(
                      height: 150.h,
                      child: Row(
                        children: [
                          FilledContainer(
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          greenNotesIcon,
                                          height: 32.h,
                                          width: 32.w,
                                        ),
                                        SizedBox(height: 24.h),
                                        Text(
                                          'Today',
                                          style: TextStyle(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(height: 16.h),
                                        Text(
                                          '*****',
                                          style: TextStyle(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 70.w),
                                  ],
                                ),
                                Positioned(
                                  top: 0.h,
                                  right: 0.w,
                                  child: SvgPicture.asset(
                                    eyeBlackIcon,
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: FilledContainer(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'This Week',
                                          style: TextStyle(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(height: 3.5.h),
                                        Text(
                                          '******',
                                          style: TextStyle(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Expanded(
                                  child: FilledContainer(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'This Month',
                                          style: TextStyle(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(height: 3.5.h),
                                        Text(
                                          '******',
                                          style: TextStyle(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Image.asset(bannerImg, width: double.infinity),
                    SizedBox(height: 24.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tips to Grow Your Business',
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SvgPicture.asset(
                          invisibleEyeIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    SizedBox(
                      height: 82.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder:
                            (context, index) => SizedBox(width: 16.w),
                        itemCount: provider.outlinedBoostItems.length,
                        itemBuilder: (context, index) {
                          final item = provider.outlinedBoostItems[index];
                          return SalesBoostRow(
                            outlined: true,
                            title: item['title'],
                            description: item['description'],
                            backgroundColor: Colors.white,
                            icon: item['icon'],
                            onTap: item['onTap'],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: containerBorderLight,
                          width: 1.w,
                        ),
                      ),
                      child: Column(
                        children: [
                          CustomTitle(title: 'Important Updates'),
                          SizedBox(height: 16.h),
                          ...List.generate(
                            provider.booksItems.length * 2 - 1,
                            (i) =>
                                i.isEven
                                    ? SalesBoostRow(
                                      title:
                                          provider.booksItems[i ~/ 2]['title'],
                                      description:
                                          provider.booksItems[i ~/
                                              2]['description'],
                                      backgroundColor:
                                          provider.booksItems[i ~/
                                              2]['bgColor'],
                                      icon: provider.booksItems[i ~/ 2]['icon'],
                                      onTap:
                                          provider.booksItems[i ~/ 2]['onTap'],
                                    )
                                    : SizedBox(height: 8.h),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: CustomTitle(title: 'All books'),
                    ),

                    Consumer<HomeProvider>(
                      builder:
                          (context, provider, child) =>
                              booksSection(checkbox: true, allTypes: true),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
