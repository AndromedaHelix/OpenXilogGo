/// Written by Juan Pablo Gutiérrez
/// 15 - 06 - 2023

import 'package:flutter/material.dart';

import '../../widgets/onboard_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController introController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: introController,
        children: [
          OnboardPage(
            pageController: introController,
            titleText: "Bienvenido usuario",
            nextPage: 1,
            backgroundColor: Colors.lightBlue,
            goNextScreen: false,
            pageIcon: Icons.people,
          ),
          OnboardPage(
            pageController: introController,
            titleText: "Visualiza información de sus loggers en tiempo real",
            nextPage: 2,
            backgroundColor: Colors.cyan,
            goNextScreen: false,
            pageIcon: Icons.data_object,
          ),
          OnboardPage(
            pageController: introController,
            titleText: "Interfaz rediseñada",
            nextPage: 1,
            backgroundColor: Colors.blueAccent,
            goNextScreen: true,
            pageIcon: Icons.update,
          ),
        ],
      ),
    );
  }
}
