/// Written by Juan Pablo Gutiérrez
///
/// 27 04 2024

import 'package:flutter/material.dart';

class MultiStyleText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final TextStyle firstStyle;
  final TextStyle? secondStyle;

  const MultiStyleText({super.key , required this.firstText, required this.secondText, required this.firstStyle, required this.secondStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(firstText, style: firstStyle, overflow: TextOverflow.visible),
        Expanded(child: Text(secondText, style: secondStyle, overflow: TextOverflow.visible,)),
      ],
    );
  }
}
