import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/edit-item/widgets/small-button.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/conversations/conversations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpAndSupportProvider extends ChangeNotifier {
  List<Map<String, dynamic>> contactInfo(BuildContext context) => [
    {
      'title': 'العنوان',
      'icon': locationImg,
      'description': 'الجامعة الإسلامية بغزة',
      'suffixIcon': null,
    },
    {
      'title': 'اتصل بنا',
      'icon': callImg,
      'description': '٦٣٥٠٨٠٧٩٥٠',
      'suffixIcon': null,
    },
    {
      'title': 'البريد الإلكتروني',
      'icon': messageImg,
      'description': 'zowad@gmail.com',
      'suffixIcon': null,
    },
    {
      'title': 'واتساب',
      'icon': whatsAppImg,
      'description': '٦٣٥٠٨٠٧٩٥٠٧٩+',
      'suffixIcon': CustomSmallButton(
        title: 'رسالة',
        height: 28.h,
        width: 91.w,
        textColor: Colors.white,
        backgroundColor: greenColor,
        onPressed: () => Navigator.pushNamed(context, ChatsScreen.id),
      ),
    },
  ];
}
