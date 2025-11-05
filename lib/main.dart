import 'package:flutter/material.dart';
import 'package:foodie/screens/main/bottom_navigation_bar.dart';
import 'package:foodie/screens/onboarding/onboarding.dart';
import 'package:foodie/style/color_style.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOnboardingDone = false;

  void completeOnboarding(){
    setState(() {
      isOnboardingDone = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Foodie",
      theme: ThemeData(
        fontFamily: "Serif",
        colorScheme: const ColorScheme.light(
          primary: orangeColor,
          secondary: greyColor,
          surface: creamColor,
        ),
        useMaterial3: false
      ),
      debugShowCheckedModeBanner: false,
      home: isOnboardingDone ? MainScreen() : Onboarding(done: completeOnboarding,),
    );
  }
}


