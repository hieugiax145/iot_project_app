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
  TooltipBehavior? _tooltipBehavior;

  void _updateDataSource(Timer timer) {
    if (context.read<DataProvider>().listRealtime.length == 5) {
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[
          context.read<DataProvider>().listRealtime.length - 1
        ],
        removedDataIndexes: <int>[0],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    timer =
        Timer.periodic(const Duration(milliseconds: 1000), _updateDataSource);
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (BuildContext context, sensor, Widget? child) {
        return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppThemes.white),
            child: Column(
              children: [
                SfCartesianChart(
                  // title:
                  //     ChartTitle(text: sensor.listRealtime.length.toString()),
                  primaryXAxis: const CategoryAxis(),
                  legend: Legend(isVisible: true),
                  // primaryYAxis: CategoryAxis(),
                  enableAxisAnimation: true,
                  tooltipBehavior: _tooltipBehavior,
                  series: [
                    LineSeries<SensorsDataModel, String>(
                        onRendererCreated: (ChartSeriesController controller) {
                          // Assigning the controller to the _chartSeriesController.
                          _chartSeriesController = controller;
                        },
                        name: "Temperature",
                        color: Colors.red,
                        width: 5,
                        markerSettings: const MarkerSettings(isVisible: true),
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
                        name: "Humidity",
                        color: Colors.blue,
                        width: 5,
                        markerSettings: const MarkerSettings(isVisible: true),
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
                        name: "Light",
                        color: Colors.green,
                        width: 5,
                        markerSettings: const MarkerSettings(isVisible: true),
                        // dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true,
                        dataSource: sensor.listRealtime,
                        xValueMapper: (data, _) =>
                            AppFunction.formatTime(data.time),
                        yValueMapper: (data, _) => AppFunction.mapValue(
                            data.light!.toInt(), 1024, 0, 0, 100)),
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
