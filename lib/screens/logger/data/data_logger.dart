/// Written by Juan Pablo Gutiérrez
/// 24 - 06 - 2023

import 'package:OpenXilogGo/constants.dart';
import 'package:OpenXilogGo/screens/logger/data/logger/logger_data_page.dart';
import 'package:OpenXilogGo/widgets/back_bar.dart';
import 'package:OpenXilogGo/widgets/date_time_selector.dart';
import 'package:OpenXilogGo/widgets/gradient_scaffold.dart';
import 'package:OpenXilogGo/widgets/selection_button.dart';
import 'package:OpenXilogGo/widgets/standard_spacer.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../api/apimanager.dart';

class DataLoggerPage extends StatefulWidget {
  final String serialNumber;

  const DataLoggerPage({required this.serialNumber, super.key});

  @override
  State<DataLoggerPage> createState() => _DataLoggerPageState();
}

class _DataLoggerPageState extends State<DataLoggerPage> {
  Future<List<dynamic>?>? dataList;

  PanelController controller = PanelController();

  void getAPI(Set<String> dateList) {
    var firstDate = dateList.first;
    var secondDate = dateList.last;

    setState(() {
      dataList = getLoggerData(widget.serialNumber, firstDate, secondDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: backGroundGradient,
      body: SlidingUpPanel(
        controller: controller,
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                            SelectionButton(
                                data: data,
                                index: index,
                                nextWidgetScreen: LoggerDataPage(
                                  data: data,
                                  index: index,
                                  serialNumber: widget.serialNumber,
                                )),
                            const StandardSpacer(height: standartSpacerHeight),
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
                  BackBar(serialNumber: widget.serialNumber),
                  const StandardSpacer(height: standartSpacerHeight),
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
