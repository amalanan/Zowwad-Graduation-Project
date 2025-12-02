import 'package:Zowwad/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String? imageUrl;

  const ChatListItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageUrl != null
              ? CircleAvatar(
                backgroundImage: AssetImage(imageUrl ?? ""),
                radius: 20.r,
              )
              : CircleAvatar(
                backgroundColor: greenColor,
                radius: 20.r,
                child: Text(
                  name.isNotEmpty ? name.substring(0, 2).toUpperCase() : '',
                  style: const TextStyle(color: Colors.white),
                ),
              ),

          SizedBox(width: 12.w),


          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  message,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 12.sp, color: titleColor),
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(time, style: TextStyle(fontSize: 14.sp, color: titleColor)),
              SizedBox(height: 6.h),
              if (unreadCount > 0)
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: greenColor,
                  child: Text(
                    unreadCount.toString(),
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
