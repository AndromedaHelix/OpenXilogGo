/// Written by Juan Pablo Gutiérrez
/// 24 - 06 - 2023

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';

import '../../../widgets/back_icon.dart';
import '../../../widgets/big_text.dart';

class DataLoggerPage extends StatefulWidget {
  final String serialNumber;

  late DateRange dataRange =
      DateRange(DateTime.now(), DateTime.now().add(const Duration(days: 1)));

  DataLoggerPage({required this.serialNumber, super.key});

  @override
  State<DataLoggerPage> createState() => _DataLoggerPageState();
}

class _DataLoggerPageState extends State<DataLoggerPage> {
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
                    Text(widget.serialNumber),
                  ],
                ),
                const BigText(titleText: "Select date range"),
                DateRangeField(
                  decoration: InputDecoration(labelText: "${widget.dataRange}"),
                  pickerBuilder: (context, onDateRangeChanged) {
                    return DateRangePickerWidget(
                      doubleMonth: false,
                      maximumDateRangeLength: 8,
                      minimumDateRangeLength: 1,
                      initialDateRange:
                          DateRange(DateTime(2022), DateTime(2023)),
                      disabledDates: [DateTime(2023, 11, 20)],
                      initialDisplayedDate: DateTime.now(),
                      onDateRangeChanged: (value) => setState(() {
                        widget.dataRange = value!;
                      }),
                      height: 340,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
