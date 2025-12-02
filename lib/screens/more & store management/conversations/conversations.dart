import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/conversations/provider.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/conversations/widgets/chat-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatsScreen extends StatelessWidget {
  static const id = '/chats';

  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(title: 'Conversations'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0.h),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 32.h),
                      itemCount: provider.chatData.length,
                      itemBuilder: (context, index) {
                        final chat = provider.chatData[index];
                        return ChatListItem(
                          name: chat['name'],
                          message: chat['message'],
                          time: chat['time'],
                          unreadCount: chat['unread'],
                          imageUrl: chat['imageUrl'],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
