/// Written by Juan Pablo Gutiérrez
/// 12 - 10 - 2022

import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  final Color color;
  const BackIcon({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BackButton(),
        const SizedBox(
          width: 5,
        ),
        Text(
          "Back",
          style: TextStyle(
            fontFamily: "Manrope",
            fontSize: 18,
            color: color,
          ),
        ),
      ],
    );
  }
}
