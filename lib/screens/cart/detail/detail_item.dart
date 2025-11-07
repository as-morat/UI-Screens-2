import 'package:flutter/material.dart';
import '../../../style/card_style.dart';
import '../../../style/color_style.dart';
import '../../../style/text_style.dart';
import 'detail_operation.dart';

class CartItem extends StatelessWidget {
  final Map<String, dynamic> food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const CartItem({
    super.key,
    required this.food,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final count = food["count"] ?? 1;
    final double price = (food["price"] ?? 0) * count;

    return Row(
      children: [
        MyCard(
          image: food["image"],
          color: food["color"],
          height: 115,
          width: 100,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 120,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(offset: Offset(0.5, 2), blurRadius: 2, color: Colors.black12),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(food["name"], style: MyText.h5, overflow: TextOverflow.ellipsis),
                    ),
                    Text(food["quantityType"], style: MyText.withColor(MyText.h6, greyColor)),
                  ],
                ),
                const SizedBox(height: 5),
                Text("\$${price.toStringAsFixed(2)}", style: MyText.withColor(MyText.h6, Colors.deepOrange)),
                const SizedBox(height: 8),
                MyOperation(
                  quantity: count,
                  onIncrement: onIncrement,
                  onDecrement: onDecrement,
                  onDelete: onDelete,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
