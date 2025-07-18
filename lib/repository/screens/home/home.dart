import 'package:blinkit_clone/repository/widgets/CustomHeader/customheader.dart';
import 'package:blinkit_clone/repository/widgets/HorizontalProductList/HorizontalProductList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Map<String, dynamic>> sampleProducts = [
    {
      "name": "Golden Glass Wooden Lid Candle",
      "price": 79,
      "image": "assets/images/candle.png",
    },
    {
      "name": "Royal Gulab Jamun By Bikano",
      "price": 79,
      "image": "assets/images/gulabjamun.png",
    },
    {"name": "Bikaji Bhujia", "price": 79, "image": "assets/images/Candle.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ✅ Fixed Header (Not scrolling)
          CustomHeader(
            deliveryTime: "16 minutes",
            location: "Sujal Dave, Ratanada, Jodhpur (Raj)",
            bgColor: Color(0xffEC0505),
            textColor: Color(0xffFFFFFF),
          ),

          // ✅ Scrollable Body
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 🔹 Banner Section
                  Container(
                    width: 375.w,
                    height: 250.h,
                    padding: EdgeInsets.all(10),
                    color: Color(0xffEC0505),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        HorizontalProductList(
                          title: "Mega Diwali Sale",
                          products: sampleProducts,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // 🔹 Multiple Horizontal Lists
                  HorizontalProductList(
                    title: "Grocery & Kitchen",
                    products: sampleProducts,
                  ),
                  SizedBox(height: 20),

                  HorizontalProductList(
                    title: "Snacks & Beverages",
                    products: sampleProducts,
                  ),
                  SizedBox(height: 20),

                  HorizontalProductList(
                    title: "Household Essentials",
                    products: sampleProducts,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
