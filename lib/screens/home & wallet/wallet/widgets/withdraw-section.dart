import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-title.dart';
import 'package:Zowwad/screens/home%20&%20wallet/wallet/widgets/transfer-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithDrawSection extends StatelessWidget {
  const WithDrawSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitle(title: 'Transaction History'),
        SizedBox(height: 16.h),
        SizedBox(
          height: 800.h,
          child: ListView.separated(
            itemBuilder:
                (context, index) => TransferCard(
                  amount: '₪590.00',
                  type: 'Transfer to Card',
                  date: '10 Apr 2025, 12:22 PM',
                  status: 'Pending',
                  statusColor: pendingColor,
                ),
            separatorBuilder:
                (context, index) =>
                    Divider(color: verticalDividerColor, thickness: 1),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
