/// Written by Juan Pablo Gutiérrez

import 'package:OpenXilogGo/constants.dart';
import 'package:OpenXilogGo/widgets/MenuBar.dart';
import 'package:OpenXilogGo/widgets/gradient_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/logger_card.dart';
import '../api/apimanager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: backGroundGradient,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              children: [
                const IntroBar(),
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
                                const SizedBox(
                                  height: 20,
                                ),
                                LoggerCard(
                                  serial: data[index]["serial"].toString(),
                                  name: data[index]["name"].toString(),
                                  channels: data[index]["channels"]
                                      .toString()
                                      .substring(
                                          1,
                                          data[index]["channels"]
                                              .toString()
                                              .lastIndexOf(']'))
                                      .splitMapJoin(
                                        RegExp(", "),
                                        onMatch: (m) =>
                                            '\n', // Replace comma with newline character
                                      ),
                                  latitude: data[index]["location"]["latitude"]
                                      .toString(),
                                  longitude: data[index]["location"]
                                          ["longitude"]
                                      .toString(),
                                )
                              ],
                            );
                          }),
                        );
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
