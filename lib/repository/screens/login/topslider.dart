import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSlider extends StatefulWidget {
  const TopSlider({super.key});

  @override
  State<TopSlider> createState() => _TopSliderState();
}

class _TopSliderState extends State<TopSlider> {
  late InfiniteScrollController controller1;
  late InfiniteScrollController controller2;
  late InfiniteScrollController controller3;
  Timer? timer;

  final List<String> fruits = [
    'assets/images/banana.png',
    'assets/images/fruits.png',
    'assets/images/veg.png',
  ];

  final List<String> chocolates = [
    'assets/images/cocolate.png',
    'assets/images/coffee.png',
    'assets/images/serup.png',
  ];

  final List<String> grocery = [
    'assets/images/spoons.png',
    'assets/images/powder.png',
    'assets/images/hair_oil.png',
  ];

  @override
  void initState() {
    super.initState();

    controller1 = InfiniteScrollController();
    controller2 = InfiniteScrollController();
    controller3 = InfiniteScrollController();

    timer = Timer.periodic(const Duration(milliseconds: 1200), (timer) {
      controller1.nextItem();
      controller2.previousItem();
      controller3.nextItem();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  Widget buildSlider(List<String> images, InfiniteScrollController controller) {
    return SizedBox(
      height: 80.h,
      child: InfiniteCarousel.builder(
        itemCount: images.length,
        itemExtent: 100.w,
        center: false,
        controller: controller,
        velocityFactor: 0.1,
        loop: true,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  12.r,
                ), // ✅ responsive radius
              ),
              child: Image.asset(images[index], fit: BoxFit.contain),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSlider(fruits, controller1),
        SizedBox(height: 10.h),
        buildSlider(chocolates, controller2),
        SizedBox(height: 10.h),
        buildSlider(grocery, controller3),
      ],
    );
  }
}
