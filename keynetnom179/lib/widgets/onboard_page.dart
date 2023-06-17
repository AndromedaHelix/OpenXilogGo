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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                  top: MediaQuery.of(context).size.height / 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Icon(
                    icon,
                    size: (MediaQuery.of(context).size.height / 4),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      titleText,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      descriptionText,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextForm(
                      text: "Ingresa tu RFC",
                      formText: "RFC",
                      padding: 20,
                      controller: new TextEditingController()),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Curve curve = Curves.ease;
                        goNextPage
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()))
                            : {
                                pageController.animateToPage(nextPage,
                                    duration: const Duration(milliseconds: 500),
                                    curve: curve)
                              };
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
