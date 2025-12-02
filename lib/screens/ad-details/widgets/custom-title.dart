import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final Widget? suffix;
  const CustomTitle({super.key, required this.title, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        suffix ?? SizedBox(),

        Text(
          title,

          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
        ),
      ],
    );
  }
}
