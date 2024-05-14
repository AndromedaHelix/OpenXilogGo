/// Written by Juan Pablo Gutiérrez
/// 27 04 2024

import 'package:OpenXilogGo/constants.dart';
import 'package:OpenXilogGo/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class IntroBar extends StatelessWidget {
  final String apiKey = dotenv.get("API_KEY");

  IntroBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.5, right: 12.5),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(titleText: "Welcome back", textAlign: TextAlign.center),
              Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Device Key: $apiKey",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.visible,
                  style: substitleStyle,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
