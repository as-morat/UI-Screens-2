import 'package:flutter/material.dart';
import 'package:foodie/style/color_style.dart';
import 'package:foodie/style/text_style.dart';

class MyGridCard extends StatelessWidget {
  final String? title;
  final String? image;
  final String? discount;
  final Color? color;

  const MyGridCard({
    super.key,
    this.title,
    this.image,
    this.discount,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color ?? Colors.orange.shade200,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(
                  title!,
                  style: MyText.withColor(
                    MyText.withWeight(MyText.h6, FontWeight.w700),
                    color != null ? Colors.white : Colors.black,
                  ),
                ),
              const SizedBox(height: 8),
              if (discount != null)
                Container(
                  height: 32,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    discount!,
                    style: MyText.withColor(
                      MyText.withWeight(MyText.h7, FontWeight.w600),
                      orangeColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
          if (image != null)
            Positioned(
              bottom: -20,
              right: -22,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(85),
                  ),
                  image: DecorationImage(
                    image: AssetImage(image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
