/// Written by Juan Pablo Gutiérrez

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../widgets/big_text.dart';
import '../api/apimanager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Expanded(
            child: Column(
              children: [
                BigText(titleText: "Device token: ${dotenv.get("API_KEY")}"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: FutureBuilder<List<dynamic>?>(
                      future: getAllData(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final data = snapshot.data;

                        return ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: false,
                            itemCount: data!.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  LoggerCard(
                                    serial: data[index]["serial"].toString(),
                                    name: data[index]["name"].toString(),
                                    channels:
                                        data[index]["channels"].toString(),
                                    latitude: data[index]["location"]
                                            ["latitude"]
                                        .toString(),
                                    longitude: data[index]["location"]
                                            ["longitude"]
                                        .toString(),
                                  )
                                ],
                              );
                            }));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoggerCard extends StatelessWidget {
  final serial;
  final name;
  final channels;
  final latitude;
  final longitude;

  const LoggerCard(
      {super.key,
      required this.serial,
      required this.name,
      required this.channels,
      required this.latitude,
      required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Seial Number: $serial"),
          Text("Logger Name: $name"),
          Text("Availabe Channels: $channels"),
          Text("Latitude: $latitude"),
          Text("Longitude: $longitude"),
        ],
      ),
    );
  }
}
