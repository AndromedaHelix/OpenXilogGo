/// Written by Juan Pablo Gutiérrez
/// 27 04 2024

import 'package:OpenXilogGo/widgets/big_text.dart';
import 'package:flutter/material.dart';

class IntroBar extends StatelessWidget {
  const IntroBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BigText(titleText: "Welcome", textAlign: TextAlign.center),
      ],
    );
  }
}
