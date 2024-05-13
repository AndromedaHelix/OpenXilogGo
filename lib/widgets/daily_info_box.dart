/// Written by Juan Pablo Gutiérrez
///
/// 12 - 05 - 2024

import 'package:flutter/material.dart';

class DailyInfoBox extends StatelessWidget {
  final String date;
  final String minTime;
  final String maxTime;
  final String minValue;
  final String maxValue;
  final String totaliser;
  const DailyInfoBox(
      {super.key,
      required this.date,
      required this.minTime,
      required this.maxTime,
      required this.minValue,
      required this.maxValue,
      required this.totaliser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.blue),
      child: Column(
        children: [
          Text(
              "Date: $date"),
          Text(
              "Min Time: $minTime"),
          Text(
              "Max Time: $maxTime"),
          Text(
              "Min Value: $minValue"),
          Text(
              "Max Value: $maxValue"),
          Text(
              "Totaliser: $totaliser"),
        ],
      ),
    );
  }
}
