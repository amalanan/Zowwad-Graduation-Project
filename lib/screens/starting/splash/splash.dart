import 'package:Zowwad/constants/constants.dart';
import 'package:Zowwad/screens/starting/sign-in/sign-in.dart';
import 'package:Zowwad/screens/main/ui/screens/main_screen.dart';
import 'package:Zowwad/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  static const id = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final token = await LocalStorage.getToken();

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, MainScreen.id);
    } else {
      Navigator.pushReplacementNamed(context, SignInScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(logo, height: 250.h, width: 250.w),
      ),
    );
  }
}
