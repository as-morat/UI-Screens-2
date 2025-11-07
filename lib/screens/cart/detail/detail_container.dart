import 'package:flutter/material.dart';
import '../../../style/color_style.dart';
import '../../../style/food_list.dart';
import '../../../style/text_style.dart';
import 'detail_item.dart';

class CartContainer extends StatefulWidget {
  const CartContainer({super.key});

  @override
  State<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  void onIncrement(Map<String, dynamic> food) {
    setState(() {
      food["count"] = (food["count"] ?? 1) + 1;
    });
  }

  void onDecrement(Map<String, dynamic> food) {
    setState(() {
      if ((food["count"] ?? 1) > 1) food["count"]--;
    });
  }

  void onDelete(Map<String, dynamic> food) {
    foodCart.value = List.from(foodCart.value)..remove(food);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ValueListenableBuilder<List<Map<String, dynamic>>>(
      valueListenable: foodCart,
      builder: (_, cart, __) {
        return Container(
          height: size.height * 0.65,
          width: size.width,
          decoration: BoxDecoration(
            color: creamColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: cart.isEmpty
              ? Center(
            child: Text("Empty Cart", style: MyText.withColor(MyText.h3, greyColor)),
          )
              : ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: cart.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final food = cart[index];
              return CartItem(
                food: food,
                onIncrement: () => onIncrement(food),
                onDecrement: () => onDecrement(food),
                onDelete: () => onDelete(food),
              );
            },
          ),
        );
      },
    );
  }
}
