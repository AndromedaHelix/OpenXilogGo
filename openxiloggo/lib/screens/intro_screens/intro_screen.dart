import 'package:flutter/material.dart';

/// Written by Juan Pablo Gutiérrez
/// 15 - 06 - 2023

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
          Container(
            decoration: BoxDecoration(color: Colors.red),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
