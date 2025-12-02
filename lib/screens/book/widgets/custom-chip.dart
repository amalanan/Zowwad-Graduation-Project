import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final Color backgroundColor;

  const CustomChip({
    super.key,
    required this.label,
    required this.textColor,
    required this.borderColor,
    this.borderRadius = 16,
    this.onTap,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        color: WidgetStatePropertyAll(backgroundColor),
        label: Text(
          label,
          style: GoogleFonts.tajawal(
            textStyle: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
