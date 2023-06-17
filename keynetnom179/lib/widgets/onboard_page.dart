/// Written by Juan Pablo Gutiérrez
/// 16 - 06  - 2023

import 'package:flutter/material.dart';
import 'package:keynetnom179/widgets/text_form.dart';

import '../screens/home_screen.dart';

class OnboardPage extends StatelessWidget {
  final String titleText;
  final String descriptionText;
  final IconData icon;
  final int nextPage;
  final Color backgroundColor;
  final PageController pageController;
  final bool goNextPage;

  const OnboardPage({
    super.key,
    required this.pageController,
    required this.titleText,
    required this.descriptionText,
    required this.icon,
    required this.nextPage,
    required this.backgroundColor,
    required this.goNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: const SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(),
        ),
      ),
    );
  }
}
