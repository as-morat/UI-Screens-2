import 'package:flutter/material.dart';

import '../../style/color_style.dart';
import '../../style/text_style.dart';

class MyPlace extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  final String time;
  final String ratings;

  const MyPlace({
    super.key,
    required this.image,
    required this.name,
    required this.title,
    required this.time,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: 160,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: MyText.h6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ratings,
                    style: MyText.withColor(MyText.h8, orangeColor),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.star, size: 16, color: orangeColor),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "$title · $time",
            style: MyText.withColor(MyText.h8, greyColor),
          ),
        ],
      ),
    );
  }
}
