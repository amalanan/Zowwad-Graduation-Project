import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/widgets/custom-app-bar.dart';
import 'package:Zowwad/screens/edit-item/widgets/custom-parent-container.dart';
import 'package:Zowwad/screens/home%20&%20wallet/home/widgets/filled-container.dart';
import 'package:Zowwad/screens/home%20&%20wallet/wallet/provider.dart';
import 'package:Zowwad/screens/home%20&%20wallet/wallet/widgets/money-column.dart';
import 'package:Zowwad/screens/home%20&%20wallet/wallet/widgets/money-row.dart';
import 'package:Zowwad/screens/home%20&%20wallet/wallet/widgets/payment-section.dart';
import 'package:Zowwad/screens/home%20&%20wallet/wallet/widgets/tansaction-button.dart';
import 'package:Zowwad/screens/home%20&%20wallet/wallet/widgets/withdraw-section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../book/widgets/tab-button.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wallet'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomParentContainer(
            children: [
              SizedBox(height: 16.h),
              FilledContainer(
                symmetricPadding: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Current Balance',
                          style: TextStyle(color: titleColor, fontSize: 16.sp),
                        ),
                        Text(
                          '₪590.00',
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TransactionButton(title: 'Transaction'),
                      ],
                    ),
                    Image.asset(paymentImage, width: 150.w),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: FilledContainer(
                      child: MoneyColumn(
                        title: 'Cash In Hand',
                        amount: '₪590.00',
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: FilledContainer(
                      child: MoneyColumn(
                        title: 'Withdrawable',
                        amount: '₪590.00',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.w),
              FilledContainer(
                child: MoneyRow(title: 'Pending Withdraw', amount: '₪590.00'),
              ),
              SizedBox(height: 16.w),
              FilledContainer(
                child: MoneyRow(title: 'Already Withdrawn', amount: '₪342.00'),
              ),
              SizedBox(height: 16.w),
              FilledContainer(
                child: MoneyRow(title: 'Total Earning', amount: '766.00'),
              ),
              SizedBox(height: 24.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Consumer<WalletProvider>(
                      builder: (context, provider, child) {
                        return TabButton(
                          label: "Withdraw Request",
                          isSelected: provider.showWithdraw,
                          onPressed: () => provider.showWithdrawTab(),
                          selectedColor: primaryColor,
                          unselectedColor: Colors.white,
                          selectedTextColor: Colors.white,
                          unselectedTextColor: titleColor,
                          selectedBorderColor: Colors.transparent,
                          unselectedBorderColor: containerBorderLight,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Consumer<WalletProvider>(
                      builder: (context, provider, child) {
                        return TabButton(
                          label: "Payment History",
                          isSelected: !provider.showWithdraw,
                          onPressed: () => provider.showPaymentTab(),
                          selectedColor: primaryColor,
                          unselectedColor: Colors.white,
                          selectedTextColor: Colors.white,
                          unselectedTextColor: titleColor,
                          selectedBorderColor: Colors.transparent,
                          unselectedBorderColor: containerBorderLight,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Consumer<WalletProvider>(
                builder: (context, provider, child) {
                  return provider.showWithdraw
                      ? WithDrawSection()
                      : PaymentSection();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
