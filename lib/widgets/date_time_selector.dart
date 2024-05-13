/// Written by Juan Pablo Gutiérrez
/// 27 - 06 - 2023

import 'package:OpenXilogGo/widgets/standard_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../constants.dart';
import 'big_text.dart';

enum RequestType {
  dateTime,
  dateOnly,
}

class DateTimeSelector extends StatefulWidget {
  final String serialNumber;
  final RequestType requestType;
  final PanelController controller;

  final ValueChanged<Set<String>> onchanged;

  const DateTimeSelector(
      {required this.serialNumber,
      required this.requestType,
      required this.controller,
      required this.onchanged,
      super.key});

  @override
  State<DateTimeSelector> createState() => _DateTimeSelectorState();
}

class _DateTimeSelectorState extends State<DateTimeSelector> {
  DateRange dataRange =
      DateRange(DateTime.now(), DateTime.now().add(const Duration(days: 1)));

  DateTime initialTime = DateTime.now();
  DateTime lastTime = DateTime.now().add(const Duration(hours: 1));

  Set<String> processTimeInput(
      DateRange range, DateTime initialTime, DateTime lastTime) {
    /* Handles date formatting */
    String initYear = range.start.year.toString();
    String initMonth = range.start.month.toString();
    String initDay = range.start.day.toString();

    if (initMonth.length == 1) initMonth = "0$initMonth";

    if (initDay.length == 1) initDay = "0$initDay";

    String finYear = range.end.year.toString();
    String finMonth = range.end.month.toString();
    String finday = range.end.day.toString();

    if (finMonth.length == 1) finMonth = "0$finMonth";

    if (finday.length == 1) finday = "0$finday";

    /* Handles time formatting */

    if (widget.requestType == RequestType.dateTime) {
      String initHour = initialTime.hour.toString();
      String initMinute = initialTime.minute.toString();

      if (initHour.length == 1) initHour = "0$initHour";

      if (initMinute.length == 1) initMinute = "0$initMinute";

      String lastHour = lastTime.hour.toString();
      String lastMinute = lastTime.minute.toString();

      if (lastHour.length == 1) lastHour = "0$lastHour";

      if (lastMinute.length == 1) lastMinute = "0$lastMinute";

      return {
        "$initYear-$initMonth-$initDay $initHour:$initMinute",
        "$finYear-$finMonth-$finday $lastHour:$lastMinute"
      };
    }

    return {"$initYear-$initMonth-$initDay", "$finYear-$finMonth-$finday"};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: paletePurple.withAlpha(150),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const BigText(
              titleText: "Select date and time range",
              textAlign: TextAlign.center,
            ),
            const StandardSpacer(height: standartSpacerHeight),
            DateRangeField(
              decoration: InputDecoration(
                label: Text(
                  "$dataRange",
                  style: substitleStyle,
                ),
              ),
              pickerBuilder: (context, onDateRangeChanged) {
                return DateRangePickerWidget(
                  doubleMonth: false,
                  maximumDateRangeLength: 8,
                  minimumDateRangeLength: 1,
                  initialDateRange: DateRange(DateTime(2022), DateTime(2023)),
                  disabledDates: [DateTime(2023, 11, 20)],
                  initialDisplayedDate: DateTime.now(),
                  onDateRangeChanged: (value) => setState(() {
                    dataRange = value!;
                  }),
                  height: 340,
                );
              },
            ),
            (widget.requestType == RequestType.dateTime)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text("Initial Time", style: defaultStyle),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: CupertinoDatePicker(
                              use24hFormat: true,
                              onDateTimeChanged: (value) => initialTime = value,
                              mode: CupertinoDatePickerMode.time,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Last Time", style: defaultStyle),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: CupertinoDatePicker(
                              use24hFormat: true,
                              onDateTimeChanged: (value) => lastTime = value,
                              mode: CupertinoDatePickerMode.time,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const Text(""),
            ElevatedButton(
              onPressed: () {
                widget.onchanged(
                    processTimeInput(dataRange, initialTime, lastTime));

                widget.controller.animatePanelToPosition(1,
                    duration: const Duration(milliseconds: 225),
                    curve: Curves.easeIn);
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
