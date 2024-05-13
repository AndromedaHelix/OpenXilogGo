/// Written by Juan Pablo Gutiérrez
/// 30 - 06 - 2023

import 'package:OpenXilogGo/api/apimanager.dart';
import 'package:OpenXilogGo/screens/logger/data/daily/daily_data_page.dart';
import 'package:OpenXilogGo/widgets/back_bar.dart';
import 'package:OpenXilogGo/widgets/gradient_scaffold.dart';
import 'package:OpenXilogGo/widgets/selection_button.dart';
import 'package:OpenXilogGo/widgets/standard_spacer.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../constants.dart';
import '../../../widgets/date_time_selector.dart';

class DataDailyPage extends StatefulWidget {
  final String serialNumber;

  const DataDailyPage({super.key, required this.serialNumber});

  @override
  State<DataDailyPage> createState() => _DataDailyPageState();
}

class _DataDailyPageState extends State<DataDailyPage> {
  Future<List<dynamic>?>? dataList;

  PanelController controller = PanelController();

  void getAPI(Set<String> uriList) {
    var first = uriList.first;
    var second = uriList.last;

    setState(() {
      dataList = getDailyData(widget.serialNumber, first, second);

      // dataList!.then((value) => print(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: backGroundGradient,
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
                            SelectionButton(
                                data: data,
                                index: index,
                                showUnit: false,
                                nextWidgetScreen: DailyDataPage(
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
                    requestType: RequestType.dateOnly,
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
