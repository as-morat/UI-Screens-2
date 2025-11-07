import 'package:flutter/material.dart';
import 'package:foodie/style/color_style.dart';
import 'package:foodie/style/text_style.dart';

import 'detail/detail_container.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int selectedIndex = -1;

  void selectOption(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                style: MyText.withWeight(MyText.h1, FontWeight.w500),
                children: [
                  const TextSpan(text: "Cart, "),
                  TextSpan(
                    text: "3 items",
                    style: MyText.withColor(
                      MyText.withWeight(MyText.h1, FontWeight.w500),
                      greyColor,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close, size: 32),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          children: [
            _myRow("Standard delivery, ", "40-60 minutes", "free", 0),
            Divider(color: Colors.grey.shade300, thickness: 1),
            _myRow("Express, ", "15-25 minutes", "\$2.00", 1),
            Divider(color: Colors.grey.shade300, thickness: 1),
          ],
        ),
        const SizedBox(height: 8),
        CartContainer(),
      ],
    );
  }

  Widget _myRow(String title, String times, String price, int index) {
    bool isSelected = selectedIndex == index;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(title, style: MyText.h7),
            const SizedBox(width: 2),
            Text(times, style: MyText.h7),
            const SizedBox(width: 5),
            Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                color: creamColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(price, style: MyText.h7),
            ),
          ],
        ),
        IconButton(
          onPressed: () => selectOption(index),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: isSelected ? orangeColor : Colors.grey,
          ),
        ),
      ],
    );
  }

}
