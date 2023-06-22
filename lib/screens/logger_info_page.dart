import 'package:OpenXilogGo/widgets/BackIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Written by Juan Pablo Gutiérrez
/// 21 - 06 - 2023

class LoggerInfoPage extends StatelessWidget {
  final serialNumber;
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5.5,
                  child: CupertinoDatePicker(onDateTimeChanged: (value) => print("${value.hour}:${value.minute}"),
                  use24hFormat: true, mode: CupertinoDatePickerMode.time, ),
                ),
                CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: new DateTime(2022),
                  lastDate: new DateTime(2100),
                  onDateChanged: (value) => print("${value.year}-${value.month}-${value.day}"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
