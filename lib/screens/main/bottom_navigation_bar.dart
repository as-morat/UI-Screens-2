import 'package:flutter/material.dart';
import 'package:foodie/screens/cart/cart.dart';
import 'package:foodie/screens/home/home.dart';
import 'package:foodie/screens/profile/profile.dart';
import '../../style/food_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [MyHome(), MyCart(), MyProfile()];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom - 4;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
          child: SingleChildScrollView(child: _pages[_selectedIndex]),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: width,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: bottomPadding),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.orange.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 3))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 0),
            _buildCartNavItem(Icons.shopping_cart_outlined, 1),
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
        decoration: BoxDecoration(color: isSelected ? Colors.orange : Colors.transparent, borderRadius: BorderRadius.circular(20)),
        child: Icon(icon, size: isSelected ? 32 : 28, color: isSelected ? Colors.white : Colors.grey),
      ),
    );
  }

  Widget _buildCartNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: isSelected ? Colors.orange : Colors.transparent, borderRadius: BorderRadius.circular(20)),
            child: Icon(icon, size: isSelected ? 32 : 28, color: isSelected ? Colors.white : Colors.grey),
          ),
          Positioned(
            top: -4,
            right: -4,
            child: ValueListenableBuilder<List<Map<String, dynamic>>>(
              valueListenable: foodCart,
              builder: (_, cart, __) {
                if (cart.isEmpty) return const SizedBox.shrink();
                return Container(
                  height: 20,
                  width: 24,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                  child: Text(
                    '${cart.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
