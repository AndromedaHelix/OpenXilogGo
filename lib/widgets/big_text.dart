import 'package:OpenXilogGo/constants.dart';
import 'package:flutter/material.dart';

/// Written by Juan Pablo Gutiérrez
/// 15 - 06 - 2023

class BigText extends StatelessWidget {
  final String titleText;
  final TextAlign textAlign;

  const BigText({super.key, required this.titleText, required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      textAlign: textAlign,
      style: titleTextStyle
    );
  }
}
