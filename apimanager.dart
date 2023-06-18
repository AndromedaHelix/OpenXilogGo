/// Written by Juan Pablo Gutiérrez
/// 17 - 06 - 2023
///

import 'package:flutter_dotenv/flutter_dotenv.dart';

String sourcePath = "https://xilogdataapi.atriumiot.com/2";

Future main() async {
  await dotenv.load(fileName: ".env");

  /* print(dotenv.env['API_KEY']); */
}
