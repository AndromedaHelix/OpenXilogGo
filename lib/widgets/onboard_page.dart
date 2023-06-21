/// Written by Juan Pablo Gutiérrez
/// 16 - 06  - 2023

import 'package:OpenXilogGo/screens/home_screen.dart';
import 'package:OpenXilogGo/widgets/big_text.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatelessWidget {
  final String titleText;
  final int nextPage;
  final Color backgroundColor;
  final PageController pageController;
  final bool goNextScreen;

  const OnboardPage({
    super.key,
    required this.pageController,
    required this.titleText,
    required this.nextPage,
    required this.backgroundColor,
    required this.goNextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.people,
                          size: 300,
                        ),
                        BigText(titleText: titleText),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          goNextScreen
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()))
                              : pageController.animateToPage(nextPage,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeIn);
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
 return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: Column(
                children: [
                  BigText(titleText: "Bienvenido usuario"),
                  TextForm(
                      text: "Ingresa un correo electrónico",
                      formText: "Email",
                      topPadding: 30,
                      controller: null),
                  TextForm(
                      text: "Ingresa una contraseña",
                      formText: "Contraseña",
                      topPadding: 30,
                      controller: null),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text("Submit"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    */