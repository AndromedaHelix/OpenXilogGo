/// Written by Juan Pablo Gutiérrez
/// 21 - 06 - 2023

import 'package:OpenXilogGo/api/excel.dart';
import 'package:OpenXilogGo/constants.dart';
import 'package:OpenXilogGo/screens/logger/data/data_channel.dart';
import 'package:OpenXilogGo/screens/logger/data/data_daily.dart';
import 'package:OpenXilogGo/screens/logger/data/data_logger.dart';
import 'package:OpenXilogGo/widgets/back_icon.dart';
import 'package:OpenXilogGo/widgets/big_text.dart';
import 'package:OpenXilogGo/widgets/gradient_scaffold.dart';
import 'package:OpenXilogGo/widgets/logger_info_card.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoggerInfoPage extends StatelessWidget {
  final String serialNumber;
  static const spacing = 20;

  const LoggerInfoPage({super.key, required this.serialNumber});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: const SweepGradient(
        center: FractionalOffset.topLeft,
        transform: GradientRotation(-math.pi / .8),
        colors: [paletePurple, paleteLightBlue, paleteTeal],
      ),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackIcon(),
                    Text(serialNumber),
                  ],
                ),
                const BigText(
                    titleText: "Select desired information",
                    textAlign: TextAlign.center),
                SizedBox(
                  height: spacing.toDouble(),
                ),
                LoggerInfoCard(
                  infoType: "Logger Data",
                  nextPage: DataLoggerPage(
                    serialNumber: serialNumber,
                  ),
                ),
                SizedBox(
                  height: spacing.toDouble(),
                ),
                LoggerInfoCard(
                    infoType: "Daily Data",
                    nextPage: DataDailyPage(
                      serialNumber: serialNumber,
                    )),
                SizedBox(
                  height: spacing.toDouble(),
                ),
                LoggerInfoCard(
                  infoType: "Channel Data",
                  nextPage: DataChannelPage(
                    serialNumber: serialNumber,
                  ),
                ),
                SizedBox(
                  height: spacing.toDouble(),
                ),
                GestureDetector(
                  onTap: () {
                    var x = processTimeInput();
                    computeExcel(serialNumber, x);
                  },
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 1.3,
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Download Excel Data",
                          style: loggeInfoStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
