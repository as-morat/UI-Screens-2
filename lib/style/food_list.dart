import 'package:flutter/material.dart';

final List<Map<String, dynamic>> foods = [
  {
    "id": "1",
    "image": "assets/images/food/latte.png",
    "name": "Iced Latte",
    "price": 3.50,
    "color": Colors.orangeAccent.shade100,
    "quantityType": "250 ml",
  },
  {
    "id": "2",
    "image": "assets/images/food/cake.png",
    "name": "Chocolate Cake",
    "price": 4.20,
    "color": Colors.brown.shade200,
    "quantityType": "120 g",
  },
  {
    "id": "3",
    "image": "assets/images/food/fries.png",
    "name": "French Fries",
    "price": 2.90,
    "color": Colors.amber.shade100,
    "quantityType": "150 g",
  },
  {
    "id": "4",
    "image": "assets/images/food/smoothie.png",
    "name": "Strawberry Smoothie",
    "price": 3.80,
    "color": Colors.pink.shade100,
    "quantityType": "300 ml",
  },
  {
    "id": "5",
    "image": "assets/images/food/muffin.png",
    "name": "Blueberry Muffin",
    "price": 2.70,
    "color": Colors.blue.shade100,
    "quantityType": "100 g",
  },
  {
    "id": "6",
    "image": "assets/images/food/nuggets.png",
    "name": "Chicken Nuggets",
    "price": 4.10,
    "color": Colors.orange.shade100,
    "quantityType": "200 g",
  },
  {
    "id": "7",
    "image": "assets/images/food/caramel.png",
    "name": "Caramel Milkshake",
    "price": 3.90,
    "color": Colors.amber.shade200,
    "quantityType": "350 ml",
  },
  {
    "id": "8",
    "image": "assets/images/food/velvet.png",
    "name": "Red Velvet Cake",
    "price": 4.50,
    "color": Colors.red.shade100,
    "quantityType": "150 g",
  },
];

final ValueNotifier<List<Map<String, dynamic>>> foodCart = ValueNotifier([]);
