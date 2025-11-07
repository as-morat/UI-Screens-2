import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String image;
  final Color color;
  final double? height;
  final double? width;

  const MyCard({
    super.key,
    required this.image,
    required this.color,
    this.height = 125,
    this.width = 125,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height!,
      width: width!,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0.5, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: image.isNotEmpty
          ? Image.asset(image, fit: BoxFit.contain)
          : Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
    );
  }
}
