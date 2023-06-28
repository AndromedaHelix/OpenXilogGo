/// Written by Juan Pablo Gutiérrez
/// 24 - 06 - 2023

import 'package:OpenXilogGo/widgets/date_time_selector.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../widgets/back_icon.dart';

class DataLoggerPage extends StatefulWidget {
  final String serialNumber;

  DataLoggerPage({required this.serialNumber, super.key});

  @override
  State<DataLoggerPage> createState() => _DataLoggerPageState();
}

class _DataLoggerPageState extends State<DataLoggerPage> {
  PanelController controller = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: controller,
        borderRadius: BorderRadius.circular(30),
        maxHeight: MediaQuery.of(context).size.height / 1.2,
        backdropEnabled: true,
        panel: Center(
          child: Container(
            child: Text("aa"),
          ),
        ),
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BackIcon(),
                      Text(widget.serialNumber),
                    ],
                  ),
                  DateTimeSelector(
                    serialNumber: widget.serialNumber,
                    requestType: RequestType.dateTime,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
