/// Written by Juan Pablo Gutiérrez
///
/// 12 - 05 - 2024

import 'package:OpenXilogGo/constants.dart';
import 'package:OpenXilogGo/widgets/back_bar.dart';
import 'package:OpenXilogGo/widgets/gradient_scaffold.dart';
import 'package:OpenXilogGo/widgets/info_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoggerDataPage extends StatefulWidget {
  final List<dynamic> data;
  final int index;
  final String serialNumber;

  const LoggerDataPage(
      {super.key,
      required this.data,
      required this.index,
      required this.serialNumber});

  @override
  State<LoggerDataPage> createState() => _LoggerDataPageState();
}

class _LoggerDataPageState extends State<LoggerDataPage> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: secondaryBackGroundGradient,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              BackBar(serialNumber: widget.serialNumber),
              Flexible(
                child: ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: false,
                  itemCount: widget.data[widget.index]["data"].length,
                  itemBuilder: (context, secondIndex) {
                    return Column(
                      children: [
                        Text(
                          "Data at index: $secondIndex",
                          style: defaultStyle,
                        ),
                        Text(
                          "Data Type: ${widget.data[widget.index]["data"][secondIndex]["type"]}",
                          style: defaultStyle,
                        ),
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.height / 1.2) / 1,
                          child: GridView.builder(
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                            ),
                            shrinkWrap: false,
                            itemCount: widget
                                .data[widget.index]["data"][secondIndex]["data"]
                                .length,
                            itemBuilder: (context, dataIndex) {
                              return InfoBox(
                                  timeStampData: widget.data[widget.index]
                                          ["data"][secondIndex]["data"]
                                      [dataIndex]["timestamp"],
                                  valueData: widget.data[widget.index]["data"]
                                          [secondIndex]["data"][dataIndex]
                                          ["value"]
                                      .toString());
                            },
                          ),
                        )
                      ],
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
