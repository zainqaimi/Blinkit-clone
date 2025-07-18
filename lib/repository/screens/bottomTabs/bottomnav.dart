import 'package:blinkit_clone/repository/screens/cart/cart.dart';
import 'package:blinkit_clone/repository/screens/category/category.dart';
import 'package:blinkit_clone/repository/screens/home/home.dart';
import 'package:blinkit_clone/repository/screens/print/print.dart';
import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Bottomnavscreen extends StatefulWidget {
  const Bottomnavscreen({super.key});

  @override
  State<Bottomnavscreen> createState() => _BottomnavscreenState();
}

class _BottomnavscreenState extends State<Bottomnavscreen> {
  int current = 0;
  List<Widget> pages = [Home(), Cart(), Category(), Printscreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: current, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Uihelper.customimage(img: 'home 1.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Uihelper.customimage(img: 'shopping-bag 1.png'),
            label: 'shopping',
          ),
          BottomNavigationBarItem(
            icon: Uihelper.customimage(img: 'category 1.png'),
            label: 'category',
          ),
          BottomNavigationBarItem(
            icon: Uihelper.customimage(img: 'printer 1.png'),
            label: 'print',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
    );
  }
}
