import 'package:flutter/material.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/utils/app_function.dart';

import '../model/sensors_data_model.dart';

class TableSensor extends StatefulWidget {
  const TableSensor({super.key, required this.listData});

  final List<SensorsDataModel> listData;

  @override
  State<TableSensor> createState() => _TableSensorState();
}

class _TableSensorState extends State<TableSensor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text("No",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold())),
                Expanded(
                    child: Text("Temp\n(\u2103)",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold())),
                Expanded(
                    child: Text("Hum\n(%)",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold())),
                Expanded(
                    child: Text("Light\n(%)",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold())),
                Expanded(
                    flex: 2,
                    child: Text("Time",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold()))
              ],
            ),
          ),
          const Divider(
              color: AppThemes.background,
              height: 2,
              thickness: 2,
              indent: 8,
              endIndent: 8),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.listData.length,
              itemBuilder: (context, index) {
                var data = widget.listData[index];
                return _buildRowData(index + 1, data);
              })
        ],
      ),
    );
  }

  Widget _buildRowData(int index, SensorsDataModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(index.toString(),
                  textAlign: TextAlign.center, style: AppFonts.light())),
          Expanded(
              child: Text((data.temp ?? 0).toString(),
                  textAlign: TextAlign.center, style: AppFonts.light())),
          Expanded(
              child: Text((data.hum ?? 0).toString(),
                  textAlign: TextAlign.center, style: AppFonts.light())),
          Expanded(
              child: Text(
                  ((100 *
                                  AppFunction.mapValue(
                                      (data.light ?? 0).toInt(),
                                      1024,
                                      0,
                                      0,
                                      100))
                              .round() /
                          100)
                      .toString(),
                  textAlign: TextAlign.center,
                  style: AppFonts.light())),
          Expanded(
              flex: 2,
              child: Text(
                  AppFunction.formatDateTimeFromApi(data.time, haveTime: true),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: AppFonts.light()))
        ],
      ),
    );
  }
}
