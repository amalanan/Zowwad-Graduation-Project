import 'package:Zowwad/screens/ad-details/widgets/custm-switch-tile.dart';
import 'package:Zowwad/screens/home%20&%20wallet/home/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class checkingContainer extends StatelessWidget {
  final String title;

  const checkingContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Consumer<HomeProvider>(
        builder:
            (context, provider, child) => CustomSwitchTile(
              isBold: true,
              title: 'Restaurant Temporarily Closed',
              value: provider.restClosed,
              onChanged: (value) => provider.toggleRestClosed(value),
            ),
      ),
    );
  }
}
