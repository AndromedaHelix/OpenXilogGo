/// Written by Juan Pablo Gutiérrez
/// 17 - 06 - 2023
/// Manages al server side fetching
/// Functions are expected to return null values when http errors arise

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

String sourcePath = "https://xilogdataapi.atriumiot.com/";

String apiKey = dotenv.get("API_KEY");

/// Returns array of loggers for the access token
///
/// @returns An array of loggers containing serial number and name.
Future<List<dynamic>?> getAllData() async {
  final uri = "${sourcePath}Logger/All/$apiKey";

  final response = await getResponse(uri);

  return getAsList(response);
}

/// Returns a collection of the raw channel data for the specified Xilog NG logger. (Max 8 days)
///
/// @param {String} serialNumber Serial number as displayed on device
/// @param {String} startDate Date at which to start querying loggers channel data (yyyy-MM-dd HH:mm)
/// @param {String} endDate Date at which to finish querying loggers channel data. (No more than 8 days after start date) (yyyy-MM-dd HH:mm)
///
/// @returns An object which contains an array of channels each containing an array of the channel data:
Future<List<dynamic>?> getLoggerData(
    String serialNumber, String startDate, String endDate) async {
  final uri = "${sourcePath}Data/All/$serialNumber/$startDate/$endDate/$apiKey";
  
  final response = await getResponse(uri);

  return getAsList(response);
}

/// Returns a collection of the raw data for the specified Xilog NG logger and channel name. (Max 8 days)
///
/// @param {Number} serialNumber Serial number as displayed on device
/// @param {String} startDate Date at which to start querying loggers channel data (yyyy-MM-dd HH:mm)
/// @param {String} endDate Date at which to finish querying loggers channel data (No more than 8 days after start date) (yyyy-MM-dd HH:mm)
/// @param {String} channelName Name of the channel to retrieve data from.
///
/// @returns An object which contains an array of the loggers channel data:
Future<List<dynamic>?> getChannelData(String serialNumber, String startDate,
    String endDate, String channelName) async {
  final uri =
      "${sourcePath}Data/Channel/$serialNumber/$channelName/$startDate/$endDate/$apiKey";

  final response = await getResponse(uri);

  return getAsList(response);
}

/// Returns the daily data statistics for the serial number and specified date.
///
/// @param {Number} serialNumber Logger Serial number as displayed on device
/// @param {String} startDate Date at which to start querying loggers channel data
/// @param {String} endDate Date at which to finish querying loggers channel data. (No more than 8 days after start date)
///
/// @returns An object containing meta data for channel:
Future<List<dynamic>?> getDailyData(
    String serialNumber, String startDate, String endDate) async {
  final uri =
      "${sourcePath}Data/DailyStats/$serialNumber/$startDate/$endDate/$apiKey";

  final response = await getResponse(uri);

  return getAsList(response);
}

/// Gets a response from http uri
///
/// @param {String} uri Uri at which retrieve ifnromation
///
/// @return A response object
Future<http.Response> getResponse(String uri) async {
  final url = Uri.parse(uri);

  final response = await http.get(url);

  return response;
}

/// Processes a response
///
/// @param {Response} response Response to be processed
///
/// @returns Null if status code is not 200, response body as a string if true
String? processResponse(http.Response response) {
  if (response.statusCode != 200) {
    // ignore: avoid_print
    print("Could not retrieve information: ${response.statusCode}");
    return null;
  }
  return response.body;
}

/// Gets a Response as a list
///
/// @param {Response} response Response to be casted as a List
///
/// @returns Null if response is null, List if true
List? getAsList(http.Response response) {
  final content = processResponse(response);

  final List contentJson;

  try {
    contentJson = json.decode(content!) as List<dynamic>;
  } catch (e) {
    return null;
  }

  return contentJson;
}
