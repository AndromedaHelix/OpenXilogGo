/// Written by Juan Pablo Gutiérrez

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'screens/intro_screens/onboarding_screen.dart';
import 'api/apimanager.dart';

Future main() async {
  await dotenv.load();
  runApp(const AppManager());
  getDailyData("2304402", "2023-06-02", "2023-06-05");
}

class AppManager extends StatelessWidget {
  const AppManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KeynetNom179',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
