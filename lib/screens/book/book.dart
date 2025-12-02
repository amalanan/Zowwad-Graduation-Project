import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/book/provider.dart';
import 'package:Zowwad/screens/book/widgets/info-card.dart';
import 'package:Zowwad/screens/book/widgets/item-section.dart';
import 'package:Zowwad/screens/book/widgets/review-section.dart';
import 'package:Zowwad/screens/book/widgets/tab-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BookPage extends StatefulWidget {
  static const id = '/home-book';
  const BookPage({super.key});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<BookProvider>(context, listen: false).loadBookDetails();
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'الكتاب'),
      body: SafeArea(
        child: provider.isLoadingSelectedBook
            ? const Center(child: CircularProgressIndicator())
            : _buildContent(provider),
      ),
    );
  }

  Widget _buildContent(BookProvider provider) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.network(
                provider.selectedBookDto.coverImage ?? '', // Replace with your source
                height: 178.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    booksCover, // your local asset variable
                    height: 178.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: SvgPicture.asset(
                  editIcon,
                  height: 32.h,
                  width: 32.w,
                ),
              ),
              Positioned(
                top: 140.h, // lowered slightly
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const InfoCard(),
                ),
              ),

            ],
          ),
          SizedBox(height: 220.h),

          // Tabs section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TabButton(
                    label: "جميع الكتب",
                    isSelected: provider.showItems,
                    onPressed: () => provider.showAllItems(),
                    selectedColor: primaryColor,
                    unselectedColor: Colors.white,
                    selectedTextColor: Colors.white,
                    unselectedTextColor: titleColor,
                    selectedBorderColor: Colors.transparent,
                    unselectedBorderColor: containerBorderLight,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TabButton(
                    label: "المراجعات",
                    isSelected: !provider.showItems,
                    onPressed: () => provider.showReviews(),
                    selectedColor: primaryColor,
                    unselectedColor: Colors.white,
                    selectedTextColor: Colors.white,
                    unselectedTextColor: titleColor,
                    selectedBorderColor: Colors.transparent,
                    unselectedBorderColor: containerBorderLight,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Tab content
          provider.showItems
              ? ItemsSection(home: false, categoriesShown: false)
              : Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: const ReviewsSection(),
          ),
        ],
      ),
    );
  }
}
