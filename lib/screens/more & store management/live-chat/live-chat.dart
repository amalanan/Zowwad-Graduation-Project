import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/edit-item/widgets/draggable-button.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/live-chat/widgets/active-order-card.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/live-chat/widgets/chat-msg.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/live-chat/widgets/input-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../edit-item/widgets/custom-parent-container.dart';

class LiveChatScreen extends StatelessWidget {
  static const id = '/live-chat';

  const LiveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Row(
          children: [
            CircleAvatar(child: Image.asset(person, height: 40.h, width: 40.w)),
            SizedBox(width: 4.w),
            Text(
              'Mohammed AbuTair',
              style: GoogleFonts.tajawal(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),

      body: CustomParentContainer(
        children: [
          SizedBox(height: 28.h),
          ActiveOrderCard(),
          Expanded(child: const ChatMessages()),
        ],
      ),
      bottomNavigationBar: DraggableButton(
        button: false,
        child: ChatInputField(),
      ),
    );
  }
}
