/// Written by Juan Pablo Gutiérrez

import 'package:flutter/material.dart';
import 'package:openxiloggo/widgets/BigText.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: BigText(
          titleText: "OpenXiLogGo",
        ),
      ),
    );
  }
}
