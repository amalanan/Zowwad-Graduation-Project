import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';

class PopupActionItem {
  final String iconPath;
  final String label;
  final Color textColor;
  final VoidCallback onTap;

  PopupActionItem({
    required this.iconPath,
    required this.label,
    required this.textColor,
    required this.onTap,
  });
}

class CustomPopup {
  static void show(
    BuildContext context,
    Offset position, {
    required List<PopupActionItem> actions,
    double width = 164,
    double itemHeight = 48,
  }) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final double height = itemHeight * actions.length;
    final double left = position.dx - width / 2;
    final double top = position.dy - height;
    final double right = overlay.size.width - position.dx - width / 2;
    final double bottom = overlay.size.height - position.dy;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        left.clamp(0, overlay.size.width - width),
        top.clamp(0, overlay.size.height - height),
        right.clamp(0, overlay.size.width),
        bottom.clamp(0, overlay.size.height),
      ),
      constraints: BoxConstraints(
        minWidth: width,
        maxWidth: width,
        minHeight: height,
        maxHeight: height,
      ),
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: containerBorderLight, width: 1),
      ),
      shadowColor: Colors.black.withOpacity(0.08),
      menuPadding: EdgeInsets.all(8),
      items:
          actions
              .map(
                (action) => PopupMenuItem(
                  height: itemHeight,
                  value: action,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        action.iconPath,
                        height: 16.w,
                        width: 16.w,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        action.label,
                        style: TextStyle(color: action.textColor, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    ).then((selectedItem) {
      if (selectedItem is PopupActionItem) {
        selectedItem.onTap();
      }
    });
  }
}
