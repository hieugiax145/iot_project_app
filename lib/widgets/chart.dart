import 'dart:async';

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

  void _updateDataSource(Timer timer) {
    if (context.read<DataProvider>().listRealtime.length == 8) {
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
