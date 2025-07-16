import 'dart:async';
import 'package:blinkit_clone/domain/constants/app_colors.dart';
import 'package:blinkit_clone/repository/screens/login/loginscreen.dart';
import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Uihelper.customimage(img: 'splash.png')],
        ),
      ),
    );
  }
}
