import 'package:flutter/material.dart';
import '../../../style/color_style.dart';

class MyOperation extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const MyOperation({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 90,
          decoration: BoxDecoration(color: creamColor, borderRadius: BorderRadius.circular(5)),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove, size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: 18,
              ),
              Text("$quantity"),
              IconButton(
                onPressed: onIncrement,
                icon: const Icon(Icons.add, size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: 18,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline, size: 22, color: Colors.red),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          splashRadius: 20,
        ),
      ],
    );
  }
}
