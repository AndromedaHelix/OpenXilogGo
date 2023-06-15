/// Written by Juan Pablo Gutiérrez

import 'package:flutter/material.dart';
import 'package:openxiloggo/screens/home_screen.dart';

void main() => runApp(const AppManager());

class AppManager extends StatelessWidget {
  const AppManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenXilogGo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
