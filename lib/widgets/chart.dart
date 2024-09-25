import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iot_app/model/sensors_data_model.dart';
import 'package:iot_app/provider/data_provider.dart';
import 'package:iot_app/utils/app_function.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../app/app_themes.dart';

class ChartSensors extends StatefulWidget {
  const ChartSensors({super.key});

  @override
  State<ChartSensors> createState() => _ChartSensorsState();
}

class _ChartSensorsState extends State<ChartSensors> {
  ChartSeriesController? _chartSeriesController;
  Timer? timer;
  // int count = 19;
  //
  // List<_ChartData> chartData = <_ChartData>[
  //   // _ChartData(0, 42),
  //   // _ChartData(1, 47),
  //   // _ChartData(2, 33),
  //   // _ChartData(3, 49),
  //   // _ChartData(4, 54),
  //   // _ChartData(5, 41),
  //   // _ChartData(6, 58),
  //   // _ChartData(7, 51),
  //   // _ChartData(8, 98),
  //   // _ChartData(9, 41),
  //   // _ChartData(10, 53),
  //   // _ChartData(11, 72),
  //   // _ChartData(12, 86),
  //   // _ChartData(13, 52),
  //   // _ChartData(14, 94),
  //   // _ChartData(15, 92),
  //   // _ChartData(16, 86),
  //   // _ChartData(17, 72),
  //   // _ChartData(18, 94),
  // ];
  //
  void _updateDataSource(Timer timer) {
    // chartData.add(_ChartData(count, Random().nextInt(100)));
    if (context.read<DataProvider>().listRealtime.length == 8) {
      // context.read<SensorsProvider>().listRemove(0);
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[
          context.read<DataProvider>().listRealtime.length - 1
        ],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[
          context.read<DataProvider>().listRealtime.length - 1
        ],
      );
    }
    // setState(() {
    // count = count + 1;
    // });
  }

  @override
  void dispose() {
    timer?.cancel();
    // _chartSeriesController.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timer =
        Timer.periodic(const Duration(milliseconds: 1000), _updateDataSource);
    return Consumer<DataProvider>(
      builder: (BuildContext context, sensor, Widget? child) {
        return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppThemes.white),
            child: Column(
              children: [
                SfCartesianChart(
                  title:
                      ChartTitle(text: sensor.listRealtime.length.toString()),
                  primaryXAxis: const CategoryAxis(),
                  // primaryYAxis: CategoryAxis(),
                  enableAxisAnimation: true,
                  series: [
                    LineSeries<SensorsDataModel, String>(
                        onRendererCreated: (ChartSeriesController controller) {
                          // Assigning the controller to the _chartSeriesController.
                          _chartSeriesController = controller;
                        },
                        enableTooltip: true,
                        dataSource: sensor.listRealtime,
                        xValueMapper: (data, _) =>
                            AppFunction.formatTime(data.time),
                        yValueMapper: (data, _) => data.temp),
                    LineSeries<SensorsDataModel, String>(
                        onRendererCreated: (ChartSeriesController controller) {
                          // Assigning the controller to the _chartSeriesController.
                          _chartSeriesController = controller;
                        },
                        enableTooltip: true,
                        dataSource: sensor.listRealtime,
                        xValueMapper: (data, _) =>
                            AppFunction.formatTime(data.time),
                        yValueMapper: (data, _) => data.hum),
                    LineSeries<SensorsDataModel, String>(
                        onRendererCreated: (ChartSeriesController controller) {
                          // Assigning the controller to the _chartSeriesController.
                          _chartSeriesController = controller;
                        },
                        enableTooltip: true,
                        dataSource: sensor.listRealtime,
                        xValueMapper: (data, _) =>
                            AppFunction.formatTime(data.time),
                        yValueMapper: (data, _) => data.light),
                  ],
                ),
              ],
            ));
      },
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final int? x;
  final int? y;
}
