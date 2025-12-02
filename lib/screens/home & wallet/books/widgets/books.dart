import 'package:Zowwad/screens/home & wallet/books/widgets/book-card.dart';
import 'package:Zowwad/screens/main/ui/screens/main_screen.dart';
import 'package:Zowwad/screens/main/ui/screens/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/constants.dart';
import '../../../book/widgets/tab-button.dart';
import '../provider.dart';

class booksSection extends StatelessWidget {
  final bool allTypes;
  final bool? checkbox;

  const booksSection({
    super.key,
    required this.allTypes,
    this.checkbox = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tabs section
        Consumer<BooksProvider>(
          builder: (context, provider, child) {
            return allTypes
                ? SizedBox(
              height: 36.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => SizedBox(width: 10.w),
                itemCount: provider.orderTabs.length,
                itemBuilder: (_, index) {
                  final tab = provider.orderTabs[index];
                  return TabButton(
                    height: 36.h,
                    label: tab["label"],
                    useFixedWidth: false,
                    isSelected: provider.selectedTabIndex == index,
                    onPressed: () => provider.selectTab(index),
                    selectedColor: primaryColor,
                    unselectedColor: Colors.white,
                    selectedTextColor: Colors.white,
                    unselectedTextColor: titleColor,
                    selectedBorderColor: Colors.transparent,
                    unselectedBorderColor: containerBorderLight,
                  );
                },
              ),
            )
                : Center(
              child: Wrap(
                spacing: 10.w,
                children: List.generate(provider.orderTabs.length, (index) {
                  final tab = provider.orderTabs[index];
                  return TabButton(
                    height: 36.h,
                    label: tab["label"],
                    useFixedWidth: false,
                    isSelected: provider.selectedTabIndex == index,
                    onPressed: () => provider.selectTab(index),
                    selectedColor: primaryColor,
                    unselectedColor: Colors.white,
                    selectedTextColor: Colors.white,
                    unselectedTextColor: titleColor,
                    selectedBorderColor: Colors.transparent,
                    unselectedBorderColor: containerBorderLight,
                  );
                }),
              ),
            );
          },
        ),

        SizedBox(height: 16.h),

        if (checkbox == true) ...[
          // Add Checkbox logic here if needed
        ],

        // Book list section
        Consumer<BooksProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.bookList.isEmpty) {
              return Center(
                child: Text("لا توجد كتب", style: TextStyle(color: titleColor)),
              );
            }

            final booksToShow = provider.bookList;

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: booksToShow.length,
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
              itemBuilder: (_, index) {
                final book = booksToShow[index];
                return GestureDetector(
                  // onTap: () => Navigator.pushNamed(
                  //   context,
                  //   OnWayOrderDetailsScreen.id,
                  //   arguments: book, // You can send full data to the detail page
                  // ),
                  child: BookCard(
                    publishDate: book.createdAt ?? '',
                    title: book.title, // Dynamic title
                    onTap: () {
                      final navProvider = Provider.of<BottomNavProvider>(context, listen: false);
                      navProvider.setIndex(1);
                      Navigator.pushNamed(context, MainScreen.id);
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
