import 'package:flutter/material.dart';
import 'package:foodie/style/card_style.dart';
import 'package:foodie/style/color_style.dart';
import 'package:foodie/style/food_list.dart';
import 'package:foodie/style/text_style.dart';

class MyHomeCard extends StatefulWidget {
  const MyHomeCard({super.key});

  @override
  State<MyHomeCard> createState() => _MyHomeCardState();
}

class _MyHomeCardState extends State<MyHomeCard> {
  void addToCart(Map<String, dynamic> food) {
    final cart = foodCart.value;
    final existingIndex = cart.indexWhere((item) => item["id"] == food["id"]);

    if (existingIndex != -1) {
      cart[existingIndex]["count"] = (cart[existingIndex]["count"] ?? 1) + 1;
    } else {
      cart.add({...food, "count": 1});
    }

    foodCart.value = List<Map<String, dynamic>>.from(cart);
    setState(() {});
    if (mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: MediaQuery.of(context).size.width * 0.43,
          behavior: SnackBarBehavior.floating,
          backgroundColor: creamColor,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          duration: const Duration(seconds: 2),
          content: Row(
            children: [
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 16),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Added to cart",
                  style: MyText.withColor(MyText.h7, Colors.black54),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: foods.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          final food = foods[index];
          return _buildCard(food);
        },
      ),
    );
  }

  Widget _buildCard(Map<String, dynamic> food) {
    final name = food["name"] ?? "Unknown";
    final double price = food["price"] ?? 0;
    final String image = food["image"] ?? "";
    final Color color = food["color"] ?? Colors.grey;

    return SizedBox(
      width: 130,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCard(image: image, color: color),
              const SizedBox(height: 5),
              Text(name, style: MyText.h6, overflow: TextOverflow.ellipsis),
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: MyText.withColor(MyText.h8, greyColor),
              ),
            ],
          ),

          Positioned(
            top: 8,
            right: 10,
            child: Container(
              height: 26,
              width: 26,
              decoration: const BoxDecoration(
                color: Colors.deepOrangeAccent,
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
                onPressed: () => addToCart(food),
                icon: const Icon(Icons.add, color: Colors.white),
                iconSize: 16,
                padding: EdgeInsets.zero,
                splashRadius: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
