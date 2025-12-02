import 'package:Zowwad/screens/book/book.dart';
import 'package:Zowwad/screens/book/provider.dart';
import 'package:Zowwad/screens/home%20&%20wallet/books/books.dart';
import 'package:Zowwad/screens/home%20&%20wallet/books/provider.dart';
import 'package:Zowwad/screens/main/ui/screens/provider.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/categories/categories.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/more/more.dart';
import 'package:Zowwad/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants/constants.dart';

class MainScreen extends StatelessWidget {
  static const id = '/';

  MainScreen({super.key});

  final List<String> icons = [
    homeIcon,
    walletIcon,
    zowwadLogoCropped,
    searchIcon,
    moreIcon,
  ];

  final List<Widget> screens = [
    HomeBookScreen(),
    const booksScreen(),
    HomeBookScreen(), // سيتم استبداله عند الضغط
    const SearchScreen(),
    const MoreScreen(),
  ];

  final List<String> labels = const [
    "الرئيسية",
    "كتبي",
    "المجتمع",
    'بحث',
    "المزيد",
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: screens[bottomNavProvider.currentIndex],
      floatingActionButton: SizedBox(height: 56.h, width: 56.w),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 72.h,
            color: Colors.transparent,
            child: BottomNavigationBar(
              currentIndex: bottomNavProvider.currentIndex,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: primaryColor,
              unselectedItemColor: titleColor,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14.sp,
              ),
              unselectedLabelStyle: TextStyle(
                color: titleColor,
                fontSize: 14.sp,
              ),

              onTap: (index) async {
                if (index == 2) {
                  final booksProvider = context.read<BooksProvider>();

                  bool opened = await booksProvider.openLastBook();

                  if (opened) {
                    // Get the ID we just loaded
                    final lastId = booksProvider.lastOpenedBookId;
                    if (lastId != null) {
                       // Tell the Book details provider to load this book
                       context.read<BookProvider>().selectBook(lastId);
                       Navigator.pushNamed(context, BookPage.id);
                       return;
                    }
                  }
                }

                bottomNavProvider.setIndex(index);
              },

              items: List.generate(icons.length, (index) {
                return BottomNavigationBarItem(
                  icon:
                      index == 2
                          ? Image.asset(
                            icons[index],
                            width: 28.sp,
                            height: 28.sp,
                          )
                          : SvgPicture.asset(
                            icons[index],
                            width: 24.sp,
                            height: 24.sp,
                            color:
                                bottomNavProvider.currentIndex == index
                                    ? primaryColor
                                    : titleColor,
                          ),
                  label: labels[index],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
