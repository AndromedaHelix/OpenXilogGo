import 'package:OpenXilogGo/constants.dart';
import 'package:flutter/material.dart';

/// Written by Juan Pablo Gutiérrez
/// 15 - 06 - 2023

class BigText extends StatelessWidget {
  final titleText;

  const BigText({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      textAlign: TextAlign.center,
      style: bigTextStyle
    );
  }
}
