// ignore_for_file: deprecated_member_use

import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeader extends StatelessWidget {
  final String deliveryTime;
  final String location;
  final Color bgColor;
  final Color textColor;

  const CustomHeader({
    super.key,
    required this.deliveryTime,
    required this.location,
    this.bgColor = const Color(0xFFFFD54F),
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: bgColor, // ✅ header ke color ke saath match karega
        statusBarIconBrightness:
            bgColor.computeLuminance() > 0.5
                ? Brightness.dark
                : Brightness.light,
        statusBarBrightness:
            bgColor.computeLuminance() > 0.5
                ? Brightness.light
                : Brightness.dark,
      ),
      child: SafeArea(
        // ✅ Status bar ke neeche se start karega
        bottom: false,
        child: Container(
          width: 1.sw,
          color: bgColor,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Uihelper.customText(
                        text: 'Blinkit in',
                        color: textColor,
                        fontweight: FontWeight.w500,
                        fontsize: 14.sp,
                      ),
                      Uihelper.customText(
                        text: deliveryTime,
                        color: textColor,
                        fontweight: FontWeight.bold,
                        fontsize: 22.sp,
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 18.r,
                    backgroundColor:
                        bgColor == const Color(0xFFFFD54F)
                            ? Colors.white
                            : Colors.black,
                    child: Icon(Icons.person, color: textColor, size: 20.sp),
                  ),
                ],
              ),
              SizedBox(height: 6.h),

              // 🔹 Location Row
              Row(
                children: [
                  Uihelper.customText(
                    text: "HOME",
                    color: textColor,
                    fontweight: FontWeight.bold,
                    fontsize: 12.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          location,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: textColor.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: textColor,
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              // 🔹 Search Bar
              Container(
                height: 42.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 8.w),
                    Icon(Icons.search, color: Colors.grey, size: 20.sp),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 14.sp),
                        decoration: InputDecoration(
                          hintText: 'Search “ice-cream”',
                          hintStyle: TextStyle(fontSize: 13.sp),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.mic, color: Colors.grey, size: 20.sp),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
