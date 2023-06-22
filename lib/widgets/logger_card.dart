/// Written by Juan Pablo Gutiérrez
/// 20 - 06 - 2023

import 'package:OpenXilogGo/screens/logger_info_page.dart';
import 'package:flutter/material.dart';

class LoggerCard extends StatelessWidget {
  final serial;
  final name;
  final channels;
  final latitude;
  final longitude;

  const LoggerCard(
      {super.key,
      required this.serial,
      required this.name,
      required this.channels,
      required this.latitude,
      required this.longitude});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoggerInfoPage(serialNumber: serial,))),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.red),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Seial Number: $serial"),
            Text("Logger Name: $name"),
            Text("Availabe Channels: $channels"),
            Text("Latitude: $latitude"),
            Text("Longitude: $longitude"),
          ],
        ),
      ),
    );
  }
}
