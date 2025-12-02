import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/home%20&%20wallet/notfications/provider.dart';
import 'package:Zowwad/screens/home%20&%20wallet/notfications/widgets/notif-card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  static const id = '/notifs';
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationsProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(title: 'Notifications'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.notifs.length,
                itemBuilder: (context, index) {
                  final item = provider.notifs[index];
                  return NotifCard(
                    title: item['title'],
                    timeText: item['timeText'],
                    actionText: item['actionText'],
                    description: item['description'],
                    read: item['read'],
                    onActionPressed: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
