import 'package:flutter/material.dart';
import 'package:foodie/style/color_style.dart';
import 'package:foodie/style/text_style.dart';

class Onboarding extends StatefulWidget {
  final VoidCallback done;

  const Onboarding({super.key, required this.done});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<Map<String, String>> _pages = [
    {
      "image": "assets/images/snacks.png",
      "title": "Fresh & Healthy Meals",
      "description":
      "Discover a wide variety of fresh salads and healthy meals delivered right to your doorstep.",
    },
    {
      "image": "assets/images/salad.png",
      "title": "Grab Fresh Fruits",
      "description":
      "Get seasonal fruits and fresh produce from local markets anytime, anywhere.",
    },
    {
      "image": "assets/images/chicken.png",
      "title": "Sweet Treats Delivered",
      "description":
      "Indulge in your favorite desserts and sweet treats without leaving your home.",
    },
  ];

  int currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: creamColor,
        body: Container(
          height: size.height,
          width: size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() => currentIndex = index);
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          page["image"]!,
                          height: size.height * 0.4,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 50),
                        Text(
                          page["title"]!,
                          textAlign: TextAlign.center,
                          style: MyText.responsive(MyText.h1, context),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          page["description"]!,
                          textAlign: TextAlign.center,
                          style: MyText.responsive(MyText.h5, context),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                      (index) => Container(
                    height: 10,
                    width: currentIndex == index ? 12 : 7,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? orangeColor
                          : orangeColor.withValues(alpha: .3),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              currentIndex < _pages.length - 1
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _controller.animateToPage(
                      _pages.length - 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: Text(
                      "Skip",
                      style: MyText.responsive(
                        MyText.withColor(MyText.h3, greyColor),
                        context,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: orangeColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (currentIndex < _pages.length - 1) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.bounceOut,
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
                  : ElevatedButton(
                onPressed: widget.done,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(size.width * 0.9, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  "Get Started",
                  textAlign: TextAlign.center,
                  style: MyText.responsive(
                    MyText.withColor(MyText.h3, Colors.white),
                    context,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
