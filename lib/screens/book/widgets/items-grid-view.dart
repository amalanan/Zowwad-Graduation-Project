import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/dto/FacultyBook/book_dto.dart';
import 'package:Zowwad/screens/book/widgets/product-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsGridView extends StatelessWidget {
  final List<BookDto> items;
  final bool? stock;
  const ItemsGridView({super.key, required this.items, this.stock = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,

          crossAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return ProductGridItem(
            stock: stock,
            imagePath: item.image??uniBook,
            title: item.title ?? "",
            available: item.status=='غير متوفر'? false : true,
            contact: item.author ?? '',
            id: item.id
          );
        },
      ),
    );
  }
}
