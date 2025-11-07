import 'package:flutter/material.dart';
import 'package:foodie/screens/home/grid_card.dart';
import 'package:foodie/screens/home/list_place.dart';
import 'package:foodie/screens/home/place_card.dart';
import 'package:foodie/screens/home/price_card.dart';
import 'package:foodie/style/color_style.dart';
import 'package:foodie/style/text_style.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Regent Street, 16",
                style: MyText.withWeight(MyText.h1, FontWeight.w500),
              ),
              AnimatedRotation(
                turns: isExpand ? 0.5 : 0,
                duration: Duration(milliseconds: 200),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isExpand = !isExpand;
                    });
                  },
                  icon: Icon(Icons.keyboard_arrow_down, size: 32),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 260,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                MyGridCard(title: "Special of\nthe week", discount: "50%", color: orangeColor,),
                MyGridCard(title: "Pasta", image: "assets/images/pasta.png"),
                MyGridCard(title: "Drinks", image: "assets/images/drinks.png",),
                MyGridCard(title: "Chicken", image: "assets/images/chicken.png",),
                MyGridCard(title: "Sorma", image: "assets/images/sorma.png"),
                MyGridCard(title: "Ramen", image: "assets/images/ramen.png"),
              ],
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            "Places",
            style: MyText.withWeight(MyText.h3, FontWeight.w500),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: places.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final place = places[index];
                return MyPlace(
                  image: place["image"]!,
                  name: place["name"]!,
                  title: place["title"]!,
                  time: place["time"]!,
                  ratings: place["ratings"]!,
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                "Best Price",
                style: MyText.withWeight(MyText.h3, FontWeight.w500),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.discount_outlined,
                size: 28,
                color: Colors.greenAccent,
              ),
            ],
          ),
          const SizedBox(height: 16,),
          MyHomeCard()
        ],
    );
  }
}
