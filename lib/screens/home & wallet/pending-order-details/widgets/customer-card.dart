import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerDetailsCard extends StatelessWidget {
  final String name;
  final String address;
  final String imageUrl;
  final VoidCallback onChatPressed;

  const CustomerDetailsCard({
    super.key,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.onChatPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(imageUrl),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        address,
                        style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20.w),
              SizedBox(
                height: 36.h,
                width: 88.w,
                child: ElevatedButton.icon(
                  onPressed: onChatPressed,
                  icon: SvgPicture.asset(chatIcon, height: 16.h, width: 16.w),
                  label: Text(
                    'Chat',
                    style: GoogleFonts.tajawal(
                      textStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 7.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
