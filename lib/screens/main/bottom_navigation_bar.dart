import 'package:flutter/material.dart';
import 'package:foodie/screens/cart/cart.dart';
import 'package:foodie/screens/home/home.dart';
import 'package:foodie/screens/profile/profile.dart';
import 'package:foodie/style/color_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    MyHome(),
    MyCart(),
    MyProfile(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom -7;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],

      bottomNavigationBar: Container(
        height: 70,
        width: width,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: bottomPadding),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 0),
            _buildNavItem(Icons.shopping_cart_outlined, 1),
            _buildNavItem(Icons.person_outline, 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected
              ? orangeColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          size: isSelected ? 32 : 28,
          color: isSelected
              ? Colors.white
              : greyColor,
        ),
      ),
    );
  }
}
