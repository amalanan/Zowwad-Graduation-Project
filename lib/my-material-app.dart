import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/ad-details/create-ad.dart';
import 'package:Zowwad/screens/book/book.dart';
import 'package:Zowwad/screens/business,%20expenses/change-pass/change-pass.dart';
import 'package:Zowwad/screens/business,%20expenses/help,%20support/help,%20support.dart';
import 'package:Zowwad/screens/business,%20expenses/help,%20support/terms-conditions/terms-conditions.dart';
import 'package:Zowwad/screens/business,%20expenses/privacy-policy/privacy-policy.dart';
import 'package:Zowwad/screens/edit-item/edit-item.dart';
import 'package:Zowwad/screens/home%20&%20wallet/confirmed-order-details/confirmed-order-details.dart';
import 'package:Zowwad/screens/home%20&%20wallet/cooking-order-details/cooking-order-details.dart';
import 'package:Zowwad/screens/home%20&%20wallet/delivered-order-details/delivered-order-details.dart';
import 'package:Zowwad/screens/home%20&%20wallet/handover-order-details/handover-order-details.dart';
import 'package:Zowwad/screens/home%20&%20wallet/notfications/notifications.dart';
import 'package:Zowwad/screens/home%20&%20wallet/on-way-order-details/on-way-order-details.dart';
import 'package:Zowwad/screens/home%20&%20wallet/pending-order-details/pending-order-details.dart';
import 'package:Zowwad/screens/main/ui/screens/main_screen.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details-more-2/ad-details-more-2.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/ad-details/ad-details.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/addons/addons.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/advertisement/advertisement.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/banners/banners.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/categories/categories.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/conversations/conversations.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/coupon-more-2/coupon-more-2.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/coupon-more/coupon-more.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/edit-coupon/edit-coupon.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/live-chat/live-chat.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/low-stock/low-stock.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/more/more.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/personal-care/personal-care.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/profile/profile.dart';
import 'package:Zowwad/screens/more%20&%20store%20management/reviews/reviews.dart';
import 'package:Zowwad/screens/search/search.dart';
import 'package:Zowwad/screens/starting/forgot-pass/forgot-pass.dart';
import 'package:Zowwad/screens/starting/reset%20password/reset-password.dart';
import 'package:Zowwad/screens/starting/sign-in/sign-in.dart';
import 'package:Zowwad/screens/starting/splash/splash.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/registration.dart';
import 'package:Zowwad/screens/starting/vendor-registartion/steps/congrats.dart';
import 'package:Zowwad/screens/starting/verify%20otp/verify-otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MaterialApp(
            navigatorKey: GlobalKey<NavigatorState>(),
            debugShowCheckedModeBanner: false,
            title: 'زوّاد',
            theme: ThemeData(
              fontFamily: GoogleFonts.tajawal().fontFamily,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                scrolledUnderElevation: 0,
                centerTitle: true,
              ),
              scaffoldBackgroundColor: greyBgColor,
              textTheme: TextTheme(
                bodySmall: GoogleFonts.tajawal(
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
                bodyMedium: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
                bodyLarge: GoogleFonts.tajawal(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
            ),
            initialRoute: SplashScreen.id,
            routes: {
              MainScreen.id: (context) => MainScreen(),
              CreateAdScreen.id: (context) => CreateAdScreen(),
              EditItemScreen.id: (context) => EditItemScreen(),
              HomeBookScreen.id: (context) => HomeBookScreen(),
              CategoryProductsScreen.id: (context) => CategoryProductsScreen(),
              ProfileScreen.id: (context) => ProfileScreen(),
              AddonsScreen.id: (context) => AddonsScreen(),
              LowStockScreen.id: (context) => LowStockScreen(),
              ChatsScreen.id: (context) => ChatsScreen(),
              ReviewsScreen.id: (context) => ReviewsScreen(),
              BannersScreen.id: (context) => BannersScreen(),
              LiveChatScreen.id: (context) => LiveChatScreen(),
              AdDetailsScreen.id: (context) => AdDetailsScreen(),
              AdvertisementScreen.id: (context) => AdvertisementScreen(),
              EditAdScreen.id: (context) => EditAdScreen(),
              CouponMoreScreen.id: (context) => CouponMoreScreen(),
              MoreScreen.id: (context) => MoreScreen(),
              CouponMore2Screen.id: (context) => CouponMore2Screen(),
              EditCouponScreen.id: (context) => EditCouponScreen(),
              SplashScreen.id: (context) => SplashScreen(),
              ForgotPassScreen.id: (context) => ForgotPassScreen(),
              ResetPasswordScreen.id: (context) => ResetPasswordScreen(),
              VerifyOtpScreen.id: (context) => VerifyOtpScreen(),
              SignInScreen.id: (context) => SignInScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              CongratulationsScreen.id: (context) => CongratulationsScreen(),
              NotificationsScreen.id: (context) => NotificationsScreen(),
              // ConfirmedOrderDetailsScreen.id:
              //     (context) => ConfirmedOrderDetailsScreen(),
              // PendingOrderDetailsScreen.id:
              //     (context) => PendingOrderDetailsScreen(),
              // CookingOrderDetailsScreen.id:
              //     (context) => CookingOrderDetailsScreen(),
              // HandoverOrderDetailsScreen.id:
              //     (context) => HandoverOrderDetailsScreen(),
              // OnWayOrderDetailsScreen.id:
              //     (context) => OnWayOrderDetailsScreen(),
              // DeliveredOrderDetailsScreen.id:
              //     (context) => DeliveredOrderDetailsScreen(),

              ChangePassScreen.id: (context) => ChangePassScreen(),
              HelpAndSupportScreen.id: (context) => HelpAndSupportScreen(),
              PrivacyPolicyScreen.id: (context) => PrivacyPolicyScreen(),
              TermsConditionsScreen.id: (context) => TermsConditionsScreen(),
              SearchScreen.id: (context) => SearchScreen(),
              BookPage.id: (context) => BookPage(),
            },
          ),
        );
      },
    );
  }
}
