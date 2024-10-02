import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TestChart extends StatefulWidget {
  const TestChart({super.key});

  @override
  State<TestChart> createState() => _TestChartState();
}

class _TestChartState extends State<TestChart> {
  // Data source which binds to the series
  // List<_ChartData> chartData = <_ChartData>[];
  Timer? timer;
// Redraw the series with updating or creating new points by using this controller.
  ChartSeriesController? _chartSeriesController;
// Count of type integer which binds as x value for the series
  int count = 19;

  //Initialize the data source
  List<ChartData> chartData = <ChartData>[
    ChartData(country: 0, sales: 42),
    ChartData(country: 1, sales: 47),
    ChartData(country: 2, sales: 33),
    ChartData(country: 3, sales: 49),
    ChartData(country: 4, sales: 54),
    ChartData(country: 5, sales: 41),
    ChartData(country: 6, sales: 58),
    ChartData(country: 7, sales: 51),
    ChartData(country: 8, sales: 98),
    ChartData(country: 9, sales: 41),
    ChartData(country: 10, sales: 53),
    ChartData(country: 11, sales: 72),
    ChartData(country: 12, sales: 86),
    ChartData(country: 13, sales: 52),
    ChartData(country: 14, sales: 94),
    ChartData(country: 15, sales: 92),
    ChartData(country: 16, sales: 86),
    ChartData(country: 17, sales: 72),
    ChartData(country: 18, sales: 94),
  ];

  void _updateDataSource(Timer timer) {
    chartData
        .add(ChartData(country: count, sales: 10 + Random().nextInt(100 - 10)));
    if (chartData.length == 20) {
      // Removes the last index data of data source.
      chartData.removeAt(0);
      // Here calling updateDataSource method with addedDataIndexes to add data in last index and removedDataIndexes to remove data from the last.
      _chartSeriesController?.updateDataSource(
          addedDataIndexes: <int>[chartData.length - 1],
          removedDataIndexes: <int>[0]);
    }
    count = count + 1;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(milliseconds: 2000), _updateDataSource);
  }

  @override
  Widget build(BuildContext context) {
    // timer =

    return SfCartesianChart(
      series: <LineSeries<ChartData, int>>[
        LineSeries<ChartData, int>(
          onRendererCreated: (ChartSeriesController controller) {
            // Assigning the controller to the _chartSeriesController.
            _chartSeriesController = controller;
          },
          // Binding the chartData to the dataSource of the line series.
          dataSource: chartData,
          xValueMapper: (ChartData sales, _) => sales.country,
          yValueMapper: (ChartData sales, _) => sales.sales,
        )
      ],
    );
  }
}

class ChartData {
  int? country;
  num? sales;
  ChartData({this.country, this.sales});
}
