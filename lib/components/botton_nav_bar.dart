import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: GNav(
          onTabChange: onTabChange,
          color: Colors.grey.shade300,
          activeColor: Colors.white,
          tabActiveBorder: Border.all(color: Colors.white),
          mainAxisAlignment: MainAxisAlignment.center,
          gap: 10,
          tabs: const [
            // магазин
            GButton(
              icon: Icons.home,
              text: "Магазин",
            ),
            // Корзина
            GButton(
              icon: Icons.shopping_bag,
              text: "Корзина",
            ),
            GButton(
              icon: Icons.settings,
              text: "Настройки",
            ),
          ]),
    );
  }
}
