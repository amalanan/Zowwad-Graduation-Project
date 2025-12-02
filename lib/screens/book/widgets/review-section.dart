import 'package:Zowwad/screens/book/widgets/custom-review-card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context, listen: false);
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 16),
      shrinkWrap: true,
      itemCount: provider.reviews.length,
      itemBuilder: (context, index) {
        final review = provider.reviews[index];
        return CustomReviewCard(
          image: review['image'],
          date: review['date'],
          opinion: review['opinion'],
        );
      },
    );
  }
}
