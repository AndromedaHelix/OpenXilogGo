/// Written by Juan Pablo Gutiérrez
/// 17 - 06 - 2023
/// Manages al server side fetching
/// Functions are expected to return null values when http errors arise

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

String sourcePath = "https://xilogdataapi.atriumiot.com/";

String API_KEY = dotenv.get("API_KEY");

Future<String?> getAllData() async {
  final uri = "${sourcePath}Logger/All/$API_KEY";

  final url = Uri.parse(uri);

  final response = await http.get(url);

  if (response.statusCode != 200) {
    print("Could not retrieve information: ${response.statusCode}");
    return null;
  }

  final contentJson = json.decode(response.body) as List<dynamic>;

  print(contentJson);

  print(response.body);

  return "";
}
