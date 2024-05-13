/// Written by Juan Pablo Gutiérrez
/// 
/// 12 - 07 - 2023

import 'package:flutter/material.dart';

class StandardSpacer extends StatelessWidget {
  final double height;
  const StandardSpacer({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}