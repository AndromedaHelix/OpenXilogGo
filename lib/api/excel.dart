/// Written by Juan Pablo Gutiérrez
///
/// 27 04 2024
///
import 'package:OpenXilogGo/api/apimanager.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';

import 'dart:io';
import 'package:excel/excel.dart';

void computeExcel(String serialNumber, Set<String> uriList) async {
  var firstDate = uriList.last;
  var secondDate = uriList.first;

  // Create an instance of the Excel object
  var excel = Excel.createExcel();

  // Get the data from the API
  List<dynamic>? apiData =
      await getLoggerData(serialNumber, firstDate, secondDate);

  // Iterate through the channels
  for (var channel in apiData!) {
    // Create a sheet for each channel
    var sheetName = channel['channelName'];
    var sheet = excel[sheetName];

    // Write headers
    sheet.appendRow([
      const TextCellValue('Timestamp'),
      const TextCellValue('Value'),
    ]);

    // Iterate through the data
    for (var dataObject in channel['data']) {
      for (var dataItem in dataObject['data']) {
        // Get the timestamp and value
        var timestamp = dataItem['timestamp'];
        var value = dataItem['value'];

        // Write the data to the sheet
        sheet.appendRow(
            [TextCellValue(timestamp), TextCellValue(value.toString())]);
      }
    }
  }

  // Save the Excel file
  String outputFile =
      "/Users/juanpablogutierrez/Documents/momentum/$serialNumber $firstDate $secondDate.xlsx";
  List<int>? fileBytes = excel.save();
  if (fileBytes != null) {
    File(outputFile)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes);
    // ignore: avoid_print
    print("Excel file saved successfully!");
  }
}

Set<String> processTimeInput() {
  DateRange range = DateRange(
      DateTime.now(), DateTime.now().subtract(const Duration(days: 8)));

  DateTime dateTime = DateTime.now();

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

  String initHour = dateTime.hour.toString();
  String initMinute = dateTime.minute.toString();

  if (initHour.length == 1) initHour = "0$initHour";

  if (initMinute.length == 1) initMinute = "0$initMinute";

  String lastHour = dateTime.hour.toString();
  String lastMinute = dateTime.minute.toString();

  if (lastHour.length == 1) lastHour = "0$lastHour";

  if (lastMinute.length == 1) lastMinute = "0$lastMinute";

  return {
    "$initYear-$initMonth-$initDay $initHour:$initMinute",
    "$finYear-$finMonth-$finday $lastHour:$lastMinute"
  };
}
