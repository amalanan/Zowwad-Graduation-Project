import 'package:flutter/material.dart';

import '../ad-details/widgets/custom-app-bar.dart';
import '../book/widgets/item-section.dart';

class SearchScreen extends StatelessWidget {
  static const id = '/search';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'بحث'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ItemsSection(home: false, categoriesShown: true),
        ),
      ),
    );
  }
}
