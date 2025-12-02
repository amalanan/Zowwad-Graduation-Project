import 'package:flutter/cupertino.dart';

class AdvertisementProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> tabs = [
    {"label": "All (4)", "selected": true},
    {"label": "pending(5)", "selected": false},
    {"label": "running(9)", "selected": false},
    {"label": "running(9)", "selected": false},
    {"label": "running(9)", "selected": false},
    {"label": "running(9)", "selected": false},
  ];
  final List<Map<String, String>> adList = [
    {
      "adId": "100003",
      "type": "Video Promotion",
      "placedDate": "07 Aug 2025",
      "duration": "03 Nov 2024 - 07 May 2025",
    },
    {
      "adId": "100004",
      "type": "Banner Ad",
      "placedDate": "01 Sep 2025",
      "duration": "01 Jan 2025 - 01 Jul 2025",
    },
    {
      "adId": "100005",
      "type": "Sponsored Post",
      "placedDate": "15 Jul 2025",
      "duration": "01 Jun 2025 - 01 Dec 2025",
    },
  ];
}
