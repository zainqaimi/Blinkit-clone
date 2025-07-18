import 'package:blinkit_clone/repository/widgets/CustomHeader/customheader.dart';
import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  // ✅ Dummy Product List
  final List<Map<String, dynamic>> dummyCart = const [
    {"name": "Ice Cream", "price": 150, "image": "assets/images/icecream.png"},
    {"name": "Pizza", "price": 299, "image": "assets/images/pizza.png"},
    {"name": "Burger", "price": 120, "image": "assets/images/burger.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(
            deliveryTime: "16 minutes",
            location: "Sujal Dave, Ratanada, Jodhpur (Raj)",
          ),

          // ✅ Expanded for Empty Cart Message
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.customimage(img: 'shopping-cart.png'),
                SizedBox(height: 8.h),
                Uihelper.customText(
                  text: "Reordering will be easy",
                  color: Color(0xff000000),
                  fontweight: FontWeight.bold,
                  fontsize: 16.sp,
                  fontfamily: 'bold',
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 0.6.sw,
                  child: Uihelper.customText(
                    text:
                        "Items you order will show up here so you can buy them again easily.",
                    color: Color(0xff000000),
                    fontweight: FontWeight.w500,
                    fontsize: 10.sp,
                  ),
                ),
              ],
            ),
          ),

          // ✅ Horizontal Product Cards at Bottom
          Container(
            height: 160.h,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            color: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    "Recommended for you",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyCart.length,
                    itemBuilder: (context, index) {
                      final product = dummyCart[index];

                      return Container(
                        width: 130.w,
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(product["image"], height: 60.h),
                            SizedBox(height: 6.h),
                            Text(
                              product["name"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "₹${product["price"]}",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
