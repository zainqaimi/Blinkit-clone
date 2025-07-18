import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeader extends StatelessWidget {
  final String deliveryTime;
  final String location;
  final Color bgColor; // 🔹 background color prop
  final Color textColor; // 🔹 text color prop

  const CustomHeader({
    super.key,
    required this.deliveryTime,
    required this.location,
    this.bgColor = const Color(0xFFFFD54F), // default yellow
    this.textColor = Colors.black, // default black text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: bgColor,
        // borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
      ),
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
                    color: textColor, // ✅ now using prop
                    fontweight: FontWeight.w500,
                    fontsize: 14.sp,
                  ),
                  Uihelper.customText(
                    text: deliveryTime,
                    color: textColor, // ✅ now using prop
                    fontweight: FontWeight.bold,
                    fontsize: 22.sp,
                  ),
                ],
              ),
              CircleAvatar(
                radius: 18.r,
                backgroundColor:
                    bgColor == const Color(0xFFFFD54F)
                        ? Colors
                            .white // agar yellow header ho to white
                        : Colors.black, // warna black
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
                        // ignore: deprecated_member_use
                        color: textColor.withOpacity(0.8), // little lighter
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
    );
  }
}
