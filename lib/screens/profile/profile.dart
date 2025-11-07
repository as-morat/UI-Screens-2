import 'package:flutter/material.dart';
import 'package:foodie/style/color_style.dart';
import 'package:foodie/style/text_style.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_ios_new, size: 32, color: greyColor),
              Icon(Icons.settings, size: 32, color: greyColor),
            ],
          ),
          const SizedBox(height: 20),
          _profileContainer(size),
          const SizedBox(height: 24),
          _myInfo("Payment", Icons.payment_outlined),
          const SizedBox(height: 16),
          _myInfo("Address", Icons.location_on_outlined),
          const SizedBox(height: 16),
          _myInfo("Favorites", Icons.favorite_border),
        ],
      ),
    );
  }

  Widget _profileContainer(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: creamColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 5), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black26, offset: Offset(0, 5), blurRadius: 8),
              ],
              image: DecorationImage(
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhtEXrsEisBBL_xoQSiirFUtFiuLOGumA8xv0ZlTj5nkEvvwwxYjEg2f2I1nRjmM9TFhE&usqp=CAU",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text("Mr. Brocolli", style: MyText.withColor(MyText.h4, greyColor)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent Orders", style: MyText.withColor(MyText.h7, greyColor)),
              Text("View All", style: MyText.withColor(MyText.h7, greyColor)),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              _myOrder("14\" Medium Pizza", 18),
              _myOrder("Cheeseburger", 12),
              _myOrder("Veggie Wrap", 10),
              _myOrder("Chicken Tacos", 15),
              _myOrder("Grilled Salmon", 22),
            ],
          )
        ],
      ),
    );
  }

  Widget _myOrder(String name, double price) {
    return Container(
      height: 52,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: orangeColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: MyText.withColor(MyText.h5, orangeColor)),
          Text("\$ $price", style: MyText.withColor(MyText.h5, orangeColor)),
        ],
      ),
    );
  }

  Widget _myInfo(String name, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: creamColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 36, color: orangeColor.withValues(alpha: 0.35)),
          const SizedBox(width: 16),
          Text(name, style: MyText.withColor(MyText.h5, greyColor)),
        ],
      ),
    );
  }
}
