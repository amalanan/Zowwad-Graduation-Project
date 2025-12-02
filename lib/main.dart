import 'package:Zowwad/screens/ad-details/provider.dart';
import 'package:Zowwad/screens/business,%20expenses/change-pass/provider.dart';
import 'package:Zowwad/screens/business,%20expenses/help,%20support/provider.dart';
import 'package:Zowwad/screens/edit-item/provider.dart';
import 'package:Zowwad/screens/home%20&%20wallet/home/provider.dart';
import 'package:Zowwad/screens/home%20&%20wallet/notfications/provider.dart';
import 'package:Zowwad/screens/home%20&%20wallet/books/provider.dart';
import 'package:Zowwad/screens/home%20&%20wallet/pending-order-details/provider.dart';
import 'package:Zowwad/screens/home%20&%20wallet/wallet/provider.dart';
import 'package:Zowwad/screens/main/ui/screens/provider.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details-more-2/provider.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/advertisement/provider.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/banners/provider.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/conversations/provider.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/coupon-more-2/provider.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/more/provider.dart';
import 'package:Zowwad/screens/starting/forgot-pass/provider.dart';
import 'package:Zowwad/screens/starting/reset%20password/provider.dart';
import 'package:Zowwad/screens/starting/sign-in/provider.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/provider.dart';
import 'package:Zowwad/screens/book/provider.dart';
import 'package:Zowwad/screens/starting/verify%20otp/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my-material-app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => EmailProvider()),
        ChangeNotifierProvider(create: (_) => BookProvider()),
        ChangeNotifierProvider(create: (_) => CreateAdProvider()),
        ChangeNotifierProvider(create: (_) => EditItemProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => BannersProvider()),
        ChangeNotifierProvider(create: (_) => AdvertisementProvider()),
        ChangeNotifierProvider(create: (_) => AdDetailsMore2Provider()),
        ChangeNotifierProvider(create: (_) => CouponMore2Provider()),
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => RegistrationProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => NotificationsProvider()),
        ChangeNotifierProvider(create: (_) => OrderDetailsProvider()),
        ChangeNotifierProvider(create: (_) => BooksProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => MoreScreenProvider()),
        ChangeNotifierProvider(create: (_) => ChangePassProvider()),
        ChangeNotifierProvider(create: (_) => HelpAndSupportProvider()),
        ChangeNotifierProvider(create: (_) => VerifyOtpProvider()),
        ChangeNotifierProvider(create: (_) => ResetPasswordProvider()),
      ],
      child: MyMaterialApp(),
    ),
  );
}
