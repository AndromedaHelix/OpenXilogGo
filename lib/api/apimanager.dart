/// Written by Juan Pablo Gutiérrez
/// 17 - 06 - 2023
///
import 'package:flutter_dotenv/flutter_dotenv.dart';

String sourcePath = "https://xilogdataapi.atriumiot.com/2";

void getToken(){
    print(dotenv.get("API_KEY"));
}