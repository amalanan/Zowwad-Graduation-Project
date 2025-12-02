import 'package:Zowwad/screens/book/provider.dart';
import 'package:Zowwad/screens/book/widgets/item-section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ad-details/widgets/custom-app-bar.dart';

class HomeBookScreen extends StatelessWidget {
  static const id = '/categories';

  const HomeBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(title: 'الرئيسية'),
      body: SafeArea(
        child: FutureBuilder(
          future: provider.loadFaculties(),  // Call the data-fetching function
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text("فشل تحميل البيانات"));
            }

            return SingleChildScrollView(
              child: ItemsSection(
                home: true,
                categoriesShown: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
