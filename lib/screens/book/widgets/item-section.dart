import 'package:Zowwad/screens/book/widgets/custom-chip.dart';
import 'package:Zowwad/screens/book/widgets/custom-search-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../ad-details/create-ad.dart';
import '../provider.dart';
import 'items-grid-view.dart';

class ItemsSection extends StatelessWidget {
  final bool categoriesShown;
  final bool home;
  const ItemsSection({
    super.key,
    required this.categoriesShown,
    required this.home,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder:
          (context, provider, child) => Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child:
                      categoriesShown
                          ? Row(
                            children: [
                              Expanded(
                                child: CustomSearchField(
                                  titleColor: titleColor,
                                  fillColor: greyBgColor,
                                  controller:
                                      home
                                          ? provider.homeController
                                          : provider.searchController,
                                  onChanged: (value) async {
                                    await provider.filterBooks(value);
                                  }, // 🔥 Add this

                                ),
                              ),
                              SizedBox(width: 16.w),
                              GestureDetector(
                                onTap:
                                    () => Navigator.pushNamed(
                                      context,
                                      CreateAdScreen.id,
                                    ),
                                child: SvgPicture.asset(
                                  addContainer,
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ],
                          )
                          : SizedBox(),
                ),
                categoriesShown
                    ? SizedBox(
                      height: 70.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Consumer<BookProvider>(
                          builder: (context, provider, child) {
                            return ListView.separated(
                              reverse: true,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder:
                                  (_, __) => SizedBox(width: 10.w),
                              itemCount: provider.faculties.length,
                              itemBuilder: (context, index) {
                                final faculty = provider.faculties[index];
                                final isSelected =
                                    provider.selectedCategoryIndex == index;

                                return GestureDetector(
                                  onTap: () => provider.selectFaculty(index),
                                  child: CustomChip(
                                    label: faculty.name,
                                    textColor:
                                        isSelected ? Colors.white : titleColor,
                                    backgroundColor:
                                        isSelected
                                            ? primaryColor
                                            : Colors.white,
                                    borderColor: borderColor,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    )
                    : SizedBox(),

                SizedBox(height: 8.h),
                if (provider.isLoadingBooks)
                  Center(child: CircularProgressIndicator())
                else if (provider.selectedFacultyBooks.isEmpty)
                  Center(child: Text("لا توجد كتب متاحة لهذا التخصص"))
                else
                  ItemsGridView(items: provider.selectedFacultyBooks),
              ],
            ),
          ),
    );
  }
}
