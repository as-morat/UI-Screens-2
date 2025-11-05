import 'package:flutter/material.dart';
import 'package:foodie/style/color_style.dart';
import 'package:foodie/style/food_list.dart';
import 'package:foodie/style/text_style.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: foods.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          return _myCard(
            foods[index]["name"],
            foods[index]["price"],
            foods[index]["image"],
            foods[index]["color"],
          );
        },
      ),
    );
  }

  Widget _myCard(String name, String price, String image, Color color) {
    return SizedBox(
      width: 130,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 125,
                width: 125,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: image.isNotEmpty
                    ? Image.asset(image, fit: BoxFit.contain)
                    : Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(name, style: MyText.h6, overflow: TextOverflow.ellipsis),
              Text(price, style: MyText.withColor(MyText.h8, greyColor)),
            ],
          ),

          Positioned(
            top: 10,
            right: 10,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add, color: Colors.white),
                iconSize: 20,
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
