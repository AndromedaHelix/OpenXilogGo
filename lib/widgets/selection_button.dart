/// Written by Juan Pablo Gutiérrez
///
/// 12 05 2024

import 'package:OpenXilogGo/constants.dart';
import 'package:OpenXilogGo/widgets/standard_spacer.dart';
import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  final List<dynamic> data;
  final int index;
  final Widget nextWidgetScreen;
  final bool showUnit;

  const SelectionButton(
      {super.key,
      required this.data,
      required this.index,
      required this.nextWidgetScreen,
      this.showUnit = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nextWidgetScreen),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.lightBlue,
        ),
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.left,
                "Channel Name: ${data[index]["channelName"].toString()}",
                style: loggeInfoStyle,
              ),
            ),
            showUnit
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Unit: ${data[index]["unit"].toString()}",
                      style: smallerDefaultStyle,
                    ),
                  )
                : const SizedBox(),
            const StandardSpacer(height: smallerSpacerHeight),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.all(2),
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Select", style: smallerDefaultStyle),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
