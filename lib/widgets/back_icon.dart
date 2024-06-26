/// Written by Juan Pablo Gutiérrez
/// 12 - 10 - 2022

import 'package:OpenXilogGo/constants.dart';
import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BackButton(
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text("Back", style: defaultStyle),
      ],
    );
  }
}
