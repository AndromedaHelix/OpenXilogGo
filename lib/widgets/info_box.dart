/// Written by Juan Pablo Gutiérrez
///
/// 12 05 2024

import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String timeStampData;
  final String valueData;

  const InfoBox({super.key, required this.timeStampData, required this.valueData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.only(
              top: 12.0, bottom: 12.0, left: 25.0, right: 25.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.blue),
          child: Column(
            children: [
              Text(
                  "Timestamp: $timeStampData"),
              Text(
                  "Value: $valueData"),
            ],
          ),
        ),
      ],
    );
  }
}
