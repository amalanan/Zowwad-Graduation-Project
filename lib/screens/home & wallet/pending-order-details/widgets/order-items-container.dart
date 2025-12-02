import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class OrderItemList extends StatelessWidget {
  const OrderItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderDetailsProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: containerBorderLight, width: 1.w),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Items",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: 16.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.orderItems.length,
            separatorBuilder: (context, index) => SizedBox(height: 24.h),
            itemBuilder: (context, index) {
              final item = provider.orderItems[index];
              return Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        item["image"],
                        width: 73.w,
                        height: 73.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item["name"], style: TextStyle(fontSize: 14.sp)),
                        SizedBox(height: 29.h),
                        Text(
                          "₪${item["price"].toStringAsFixed(2)}",
                          style: TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 73.h,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "${item["quantity"]} ${item["quantity"] == 1 ? "Item" : "Items"}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: greenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
