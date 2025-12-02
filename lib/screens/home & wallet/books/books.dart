import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/home%20&%20wallet/books/provider.dart';
import 'package:Zowwad/screens/home%20&%20wallet/books/widgets/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class booksScreen extends StatelessWidget {
  const booksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'كتبي'),

      body: CustomParentContainer(
        children: [
          SizedBox(height: 16.h),
          Consumer<BooksProvider>(
            builder:
                (context, provider, child) => booksSection(allTypes: false),
          ),
        ],
      ),
    );
  }
}
