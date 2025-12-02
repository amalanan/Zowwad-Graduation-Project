import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/constants.dart';
import '../provider.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String label;
  final List<String> items;
  final String providerKey;
  final double? width;
  final String? hint;

  const CustomDropdownFormField({
    required this.label,
    required this.items,
    required this.providerKey,
    super.key,
    this.width = double.infinity,
    this.hint = '',
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditItemProvider>(context);
    final selectedValue = provider.getValue(providerKey);

    return GestureDetector(
      onTap: () {
        provider.toggleExpanded();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 14.sp, color: blackColor),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 42.h,
            width: width,
            child: DropdownButtonFormField<String>(
             // initialValue: selectedValue,
              hint: Text(
                hint != '' ? hint! : label,
                style: GoogleFonts.poppins(fontSize: 14.sp, color: titleColor),
              ),
              items:
                  items.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: (value) {
                if (value != null) {
                  provider.setValue(providerKey, value);
                }
              },
              decoration: InputDecoration(
                labelStyle: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: titleColor,
                ),
                suffixIcon: Icon(
                  provider.isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: blackColor,
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: cardBorder, width: 1),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: cardBorder, width: 1),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: cardBorder, width: 1),
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
              iconEnabledColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
