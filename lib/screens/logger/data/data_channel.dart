/// Written by Juan Pablo Gutiérrez
/// 30 - 06 - 2023

import 'package:OpenXilogGo/api/apimanager.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../constants.dart';
import '../../../widgets/back_icon.dart';
import '../../../widgets/date_time_selector.dart';

class DataChannelPage extends StatefulWidget {
  final String serialNumber;

  const DataChannelPage({super.key, required this.serialNumber});

  @override
  State<DataChannelPage> createState() => _DataChannelPageState();
}

class _DataChannelPageState extends State<DataChannelPage> {
  Future<List<dynamic>?>? dataList;

  PanelController controller = PanelController();

  void getAPI(Set<String> uriList) {
    var first = uriList.first;
    var second = uriList.last;

    var channelName = "Flow  1";

    setState(() {
      dataList =
          getChannelData(widget.serialNumber, first, second, channelName);

      // dataList!.then((value) => print(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: controller,
        borderRadius: BorderRadius.circular(30),
        maxHeight: MediaQuery.of(context).size.height / 1.2,
        backdropEnabled: true,
        panel: (dataList != null)
            ? FutureBuilder<List<dynamic>?>(
                future: dataList,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final data = snapshot.data;

                  if (data!.isEmpty) {
                    return const Center(
                      child: Text(
                        "This logger contains no data",
                        style: defaultStyle,
                      ),
                    );
                  }

                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: false,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text("Unit: ${data[index]["unit"].toString()}"),
                            Text(
                                "Channel Name: ${data[index]["channelName"].toString()}"),
                            const Text("Data: "),
                            SizedBox(
                              height:
                                  (MediaQuery.of(context).size.height / 1.2) /
                                      1.2,
                              child: ListView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: false,
                                itemCount: data[index]["data"].length,
                                itemBuilder: (context, secondIndex) {
                                  return Column(
                                    children: [
                                      Text(
                                          "Type: ${data[index]["data"][secondIndex]["type"]}"),
                                      SizedBox(
                                        height: (MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                1.2) /
                                            1,
                                        child: ListView.builder(
                                          physics: const ScrollPhysics(),
                                          shrinkWrap: false,
                                          itemCount: data[index]["data"]
                                                  [secondIndex]["data"]
                                              .length,
                                          itemBuilder: (context, dataIndex) {
                                            return Column(
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0,
                                                          left: 10.0,
                                                          right: 10.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: Colors.blue),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          "Timestamp: ${data[index]["data"][secondIndex]["data"][dataIndex]["timestamp"]}"),
                                                      Text(
                                                          "Value: ${data[index]["data"][secondIndex]["data"][dataIndex]["value"]}"),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              )
            : const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 0, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No data received yet, please specify date and time range",
                        style: defaultStyle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BackIcon(),
                      Text(widget.serialNumber),
                    ],
                  ),
                  DateTimeSelector(
                    serialNumber: widget.serialNumber,
                    requestType: RequestType.dateTime,
                    controller: controller,
                    onchanged: (value) => getAPI(value),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
