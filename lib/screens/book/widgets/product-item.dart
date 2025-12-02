import 'package:Zowwad/screens/book/book.dart';
import 'package:Zowwad/screens/book/provider.dart';
import 'package:Zowwad/screens/edit-item/edit-item.dart';
import 'package:Zowwad/screens/book/alerts/alerts.dart';
import 'package:Zowwad/screens/book/widgets/custom-popup.dart';
import 'package:Zowwad/screens/home%20&%20wallet/books/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:Zowwad/screens/home%20&%20wallet/books/provider.dart';

import '../../../constants/constants.dart';
import '../../more & store management/low-stock/alerts/alerts.dart';

class ProductGridItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool available;
  final bool? stock;
  final dynamic contact;
  final id ;

  const ProductGridItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.available,
    required this.id ,
    this.stock = false,
    this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: (){
            // Save as last viewed book
            Provider.of<BooksProvider>(context, listen: false).setCurrentBook(id);
            
            Provider.of<BookProvider>(context, listen: false).selectBook(id);
              Navigator.pushNamed(context, BookPage.id);
          },
          child: Container(
            width: 164.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.network(
                    imagePath,
                    width: 107.w,
                    height: 107.h,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        uniBook, // your fallback image
                        width: 107.w,
                        height: 107.h,
                        fit: BoxFit.contain,
                      );
                    },
                  )

                ),
                stock!
                    ? Positioned(
                      bottom: 6.h,
                      right: 8.w,
                      child: InkWell(
                        onTap: () => showAddStockAlert(context),
                        child: SvgPicture.asset(
                          addContainer,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    )
                    : Positioned(
                      bottom: 4.h,
                      right: 4.w,
                      child: InkWell(
                        onTapDown: (details) {
                          final productCenter = Offset(
                            details.globalPosition.dx - 60,
                            details.globalPosition.dy - -90,
                          );

                          CustomPopup.show(
                            context,
                            productCenter,
                            actions: [
                              PopupActionItem(
                                iconPath: editGreen,
                                label: 'Edit',
                                textColor: greenColor,

                                onTap:
                                    () => Navigator.pushNamed(
                                      context,
                                      EditItemScreen.id,
                                    ),
                              ),
                              PopupActionItem(
                                iconPath: deleteIcon,
                                label: 'Delete',
                                textColor: deleteColor,
                                onTap:
                                    () => showDeleteAlert(
                                      context,
                                      'Are you sure you want to delete this item?',
                                      () {},
                                    ),
                              ),
                            ],
                          );
                        },
                        child: SvgPicture.asset(
                          moreContainer,
                          width: 40.w,
                          height: 40.h,
                        ),
                      ),
                    ),
                if (stock!)
                  Positioned(
                    top: 6.h,
                    left: 8.w,
                    child: Container(
                      height: 25.h,
                      width: 25.w,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: deleteColor,
                      ),
                      child: Center(
                        child: Text(
                          '9',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: 164,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                textDirection: TextDirection.rtl,
                title,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2.h),
              Text(
                available ? 'متوفر' : 'غير متوفر',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: available ? greenColor : redColor,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                contact,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
