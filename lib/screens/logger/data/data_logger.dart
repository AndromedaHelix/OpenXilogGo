/// Written by Juan Pablo Gutiérrez
/// 24 - 06 - 2023

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';

import '../../../widgets/back_icon.dart';
import '../../../widgets/big_text.dart';

class DataLoggerPage extends StatelessWidget {
  final String serialNumber;

  const DataLoggerPage({required this.serialNumber, super.key});

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
                    const BackIcon(color: Colors.black),
                    Text(serialNumber),
                  ],
                ),
                const BigText(titleText: "Select date range"),
                DateRangeField(
                  pickerBuilder: (context, onDateRangeChanged) {
                    return SingleChildScrollView(
                      child: DateRangePickerWidget(
                        doubleMonth: false,
                        maximumDateRangeLength: 8,
                        minimumDateRangeLength: 1,
                        initialDateRange:
                            DateRange(DateTime(2022), DateTime(2023)),
                        disabledDates: [DateTime(2023, 11, 20)],
                        initialDisplayedDate: DateTime.now(),
                        onDateRangeChanged: (value) => print(value),
                      ),
                    );
                  },
                ),

                /* CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: new DateTime(2022),
                  lastDate: new DateTime(2100),
                  onDateChanged: (value) =>
                      print("${value.year}-${value.month}-${value.day}"),
                ), */
                /* SizedBox(
                  height: MediaQuery.of(context).size.height / 5.5,
                  width: MediaQuery.of(context).size.width / 2,
                  child: CupertinoDatePicker(
                    onDateTimeChanged: (value) =>
                        print("${value.hour}:${value.minute}"),
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.time,
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
