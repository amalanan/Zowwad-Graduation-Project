import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/constants.dart';

class HomeProvider extends ChangeNotifier {
  bool restClosed = false;
  final List<Map<String, dynamic>> allOrderTabs = [
    {"label": "All (4)", "selected": true},
    {"label": "pending(5)", "selected": false},
    {"label": "running(9)", "selected": false},
    {"label": "running(9)", "selected": false},
    {"label": "running(9)", "selected": false},
    {"label": "running(9)", "selected": false},
  ];
  final List<Map<String, dynamic>> booksItems = [
    {
      'title': 'Order #1234',
      'bgColor': yellowBgColor,
      'description': 'Requires confirmation within 5 minutes',
      'icon': SvgPicture.asset(boostYellowIcon, height: 40.h, width: 40.w),
      'onTap': () {},
    },
    {
      'title': '3 Orders',
      'description': 'are ready for delivery to the courier',
      'bgColor': blueBgColor,

      'icon': SvgPicture.asset(boostBlueIcon, height: 40.h, width: 40.w),
      'onTap': () {},
    },
    {
      'title': '5 Courier',
      'description': 'Are available for delivery',
      'bgColor': greenBgColor,

      'icon': SvgPicture.asset(boostGreenIcon, height: 40.h, width: 40.w),
      'onTap': () {},
    },
  ];

  final List<Map<String, dynamic>> outlinedBoostItems = [
    {
      'title': 'Sales Boost',
      'description': 'Activate weekly offers on your best-selling products',
      'icon': SvgPicture.asset(boostBlueIcon, height: 40.h, width: 40.w),
      'onTap': () {},
    },
    {
      'title': 'Promotion',
      'description': 'Get more exposure with featured listing',
      'icon': SvgPicture.asset(boostYellowIcon, height: 40.h, width: 40.w),
      'onTap': () {},
    },
    {
      'title': 'Flash Sale',
      'description': 'Boost sales with time-limited deals',
      'icon': SvgPicture.asset(boostGreenIcon, height: 40.h, width: 40.w),
      'onTap': () {},
    },
  ];

  void toggleRestClosed(bool value) {
    restClosed = value;
    notifyListeners();
  }
}
