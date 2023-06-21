/// Written by Juan Pablo Gutiérrez

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../widgets/LoggerCard.dart';
import '../widgets/big_text.dart';
import '../api/apimanager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
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
                          physics: const ScrollPhysics(),
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
    );
  }
}
