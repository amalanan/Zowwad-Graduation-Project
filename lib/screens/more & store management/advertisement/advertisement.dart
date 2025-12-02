import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/edit-item/widgets/draggable-button.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/advertisement/widgets/ads-section.dart';
import 'package:flutter/material.dart';

import '../ad-details/ad-details.dart';

class AdvertisementScreen extends StatelessWidget {
  static const id = '/ads';

  const AdvertisementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomParentContainer(children: [AdsSection()])),
      appBar: CustomAppBar(title: 'Advertisement'),
      bottomNavigationBar: DraggableButton(
        title: 'Add New Ad',
        onPressed: () => Navigator.pushNamed(context, AdDetailsScreen.id),
      ),
    );
  }
}
