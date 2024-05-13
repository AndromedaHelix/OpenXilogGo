/// Written by Juan Pablo Gutiérrez
///
/// 12 05 2024

import 'package:OpenXilogGo/constants.dart';
import 'package:OpenXilogGo/widgets/back_bar.dart';
import 'package:OpenXilogGo/widgets/daily_info_box.dart';
import 'package:OpenXilogGo/widgets/gradient_scaffold.dart';
import 'package:flutter/material.dart';

class DailyDataPage extends StatefulWidget {
  final List<dynamic> data;
  final int index;
  final String serialNumber;
  const DailyDataPage(
      {super.key,
      required this.data,
      required this.index,
      required this.serialNumber});

  @override
  State<DailyDataPage> createState() => _DailyDataPageState();
}

class _DailyDataPageState extends State<DailyDataPage> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: secondaryBackGroundGradient,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              BackBar(
                serialNumber: widget.serialNumber,
              ),
              Flexible(
                child: ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: false,
                  itemCount: widget.data[widget.index]["dailyStats"].length,
                  itemBuilder: (context, secondIndex) {
                    return SizedBox(
                      height: (MediaQuery.of(context).size.height / 1.2) / 1,
                      child: ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: false,
                        itemCount: widget
                            .data[widget.index]["dailyStats"][secondIndex]
                            .length,
                        itemBuilder: (context, dataIndex) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              DailyInfoBox(
                                date: widget.data[widget.index]["dailyStats"]
                                    [secondIndex]["date"],
                                minTime: widget.data[widget.index]["dailyStats"]
                                    [secondIndex]["minTime"],
                                maxTime: widget.data[widget.index]["dailyStats"]
                                    [secondIndex]["maxTime"],
                                minValue: widget.data[widget.index]
                                        ["dailyStats"][secondIndex]["minValue"]
                                    .toString(),
                                maxValue: widget.data[widget.index]
                                        ["dailyStats"][secondIndex]["maxValue"]
                                    .toString(),
                                totaliser: widget.data[widget.index]
                                        ["dailyStats"][secondIndex]["totaliser"]
                                    .toString(),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
