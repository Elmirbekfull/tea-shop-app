import 'package:bubble_tea_app/pages/card_page.dart';
import 'package:bubble_tea_app/pages/settings_page.dart';
import 'package:bubble_tea_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

import 'components/botton_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  // pages to display

  final List<Widget> _pages = [
    // shop page
    const ShopPage(),
    // cart page
    const CardPage(),
    // settings page
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
