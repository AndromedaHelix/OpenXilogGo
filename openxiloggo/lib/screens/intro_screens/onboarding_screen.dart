/// Written by Juan Pablo Gutiérrez
/// 15 - 06 - 2023

import 'package:flutter/material.dart';
import 'package:openxiloggo/widgets/onboard_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late final PageController introController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: introController,
        onPageChanged: (index) {
          setState() => currentIndex = index;
        },
        children: [
          OnboardPage(
              pageController: introController,
              titleText: "Introduce un RFC",
              descriptionText: "",
              icon: Icons.people,
              nextPage: 1,
              backgroundColor: Colors.red,
              goNextPage: false),
          OnboardPage(
              pageController: introController,
              titleText: "Introduce el numero de serie del dispositivo",
              descriptionText: "",
              icon: Icons.device_hub,
              nextPage: 2,
              backgroundColor: Colors.blue,
              goNextPage: false),
          OnboardPage(
              pageController: introController,
              titleText: "Bienvenido",
              descriptionText: "",
              icon: Icons.people,
              nextPage: 1,
              backgroundColor: Colors.green,
              goNextPage: true),
        ],
      ),
    );
  }
}
