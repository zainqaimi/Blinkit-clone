// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

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
      controller1.nextItem(); // left
      controller2.previousItem(); // reverse direction
      controller3.nextItem(); // left
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
      height: 80,
      child: InfiniteCarousel.builder(
        itemCount: images.length,
        itemExtent: 100,
        center: false,
        controller: controller,
        velocityFactor: 0.1,
        loop: true,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
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
      children: [
        buildSlider(fruits, controller1),
        const SizedBox(height: 10),
        buildSlider(chocolates, controller2),
        const SizedBox(height: 10),
        buildSlider(grocery, controller3),
      ],
    );
  }
}
