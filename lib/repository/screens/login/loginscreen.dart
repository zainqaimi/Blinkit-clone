// ignore_for_file: file_names

import 'package:blinkit_clone/repository/screens/bottomTabs/bottomnav.dart';
import 'package:blinkit_clone/repository/screens/login/topslider.dart';
import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 20.h), // ✅ scaled height
          const TopSlider(),
          SizedBox(height: 20.h),
          Uihelper.customimage(img: 'blinkit_logo.png'),
          SizedBox(height: 10.h),
          Uihelper.customText(
            text: "India's last minute app",
            fontweight: FontWeight.bold,
            color: Colors.black,
            fontsize: 20.sp, // ✅ scaled font
            fontfamily: 'bold',
          ),
          SizedBox(height: 20.h),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r), // ✅ responsive radius
            ),
            child: Container(
              height: 200.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Uihelper.customText(
                    text: 'zain',
                    color: Colors.black,
                    fontweight: FontWeight.w500,
                    fontsize: 14.sp, // ✅ scaled font
                  ),
                  SizedBox(height: 5.h),
                  Uihelper.customText(
                    text: '7827XXXX',
                    color: const Color(0xff9C9C9C),
                    fontweight: FontWeight.bold,
                    fontsize: 14.sp,
                    fontfamily: "bold",
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 48.h,
                    width: 290.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Bottomnavscreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Uihelper.customText(
                            text: 'Login with',
                            color: Colors.white,
                            fontweight: FontWeight.bold,
                            fontsize: 14.sp,
                            fontfamily: "bold",
                          ),
                          SizedBox(width: 5.w),
                          Uihelper.customimage(img: 'zomato.png'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Uihelper.customText(
                    text:
                        'Access your saved addresses from Zomato automatically!',
                    color: const Color(0xff9C9C9C),
                    fontweight: FontWeight.normal,
                    fontsize: 9.sp,
                  ),
                  SizedBox(height: 10.h),
                  TextButton(
                    onPressed: () {},
                    child: Uihelper.customText(
                      text: 'or login with phone number',
                      color: const Color(0xff269237),
                      fontweight: FontWeight.w400,
                      fontsize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
