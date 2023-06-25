import 'package:OpenXilogGo/screens/home_screen.dart';
import 'package:OpenXilogGo/screens/logger/data/data_logger.dart';
import 'package:OpenXilogGo/widgets/back_icon.dart';
import 'package:OpenXilogGo/widgets/big_text.dart';
import 'package:OpenXilogGo/widgets/logger_info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Written by Juan Pablo Gutiérrez
/// 21 - 06 - 2023

class LoggerInfoPage extends StatelessWidget {
  final serialNumber;
  final spacing = 20;
  const LoggerInfoPage({required this.serialNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackIcon(color: Colors.black),
                    Text(serialNumber),
                  ],
                ),
                const BigText(titleText: "Select desired information"),
                SizedBox(
                  height: spacing.toDouble(),
                ),
                LoggerInfoCard(
                  infoType: "Logger",
                  nextPage: DataLoggerPage(
                    serialNumber: serialNumber,
                  ),
                ),
                SizedBox(
                  height: spacing.toDouble(),
                ),
                LoggerInfoCard(infoType: "Daily", nextPage: HomeScreen()),
                SizedBox(
                  height: spacing.toDouble(),
                ),
                LoggerInfoCard(infoType: "Channel", nextPage: HomeScreen()),
                SizedBox(
                  height: spacing.toDouble(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
