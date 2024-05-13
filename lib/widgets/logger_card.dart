/// Written by Juan Pablo Gutiérrez
/// 20 - 06 - 2023

import 'package:OpenXilogGo/constants.dart';
import 'package:OpenXilogGo/screens/logger/logger_info_page.dart';
import 'package:OpenXilogGo/widgets/multi_style_text.dart';
import 'package:flutter/material.dart';

class LoggerCard extends StatelessWidget {
  final String serial;
  final String name;
  final String channels;
  final String latitude;
  final String longitude;

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
          context,
          MaterialPageRoute(
              builder: (context) => LoggerInfoPage(
                    serialNumber: serial,
                  ))),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.red),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MultiStyleText(
                firstText: "Serial Number: ",
                secondText: serial,
                firstStyle: smallerDefaultStyle,
                secondStyle: null),
            MultiStyleText(
                firstText: "Logger Name: ",
                secondText: name,
                firstStyle: smallerDefaultStyle,
                secondStyle: null),
            const Text(
              "Available Channels: ",
              style: smallerDefaultStyle,
            ),
            Text(
              channels,
            ),
            MultiStyleText(
                firstText: "Latitude: ",
                secondText: latitude,
                firstStyle: smallerDefaultStyle,
                secondStyle: null),
            MultiStyleText(
                firstText: "Longitude: ",
                secondText: longitude,
                firstStyle: smallerDefaultStyle,
                secondStyle: null),
          ],
        ),
      ),
    );
  }
}
