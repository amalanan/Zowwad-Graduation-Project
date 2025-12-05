import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onBack;

  const CustomAppBar({super.key, this.title, this.onBack, this.titleWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.arrow_forward_sharp),
          onPressed: onBack ?? () => Navigator.of(context).pop(),
        ),
      ],
      title:
          titleWidget ??
          Text(
            title ?? '',
            style: GoogleFonts.tajawal(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
          ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
