/// Written by Juan Pablo Gutiérrez

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'screens/intro_screens/onboarding_screen.dart';

Future main() async {
  await dotenv.load();
  runApp(const AppManager());
}

class AppManager extends StatelessWidget {
  const AppManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenXilogGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
