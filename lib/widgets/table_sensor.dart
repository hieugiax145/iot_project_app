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
      padding: EdgeInsets.symmetric(vertical: 8),
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
                    child: Text("Temp",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold())),
                Expanded(
                    child: Text("Hum",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold())),
                Expanded(
                    child: Text("Light",
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
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.listData.length,
              itemBuilder: (context, index) {
                var data = widget.listData[index];
                return _buildRowData(data);
              })
        ],
      ),
    );
  }

  Widget _buildRowData(SensorsDataModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text("No",
                  textAlign: TextAlign.center, style: AppFonts.light())),
          Expanded(
              child: Text((data.temp ?? 0).toString(),
                  textAlign: TextAlign.center, style: AppFonts.light())),
          Expanded(
              child: Text((data.hum ?? 0).toString(),
                  textAlign: TextAlign.center, style: AppFonts.light())),
          Expanded(
              child: Text((data.light ?? 0).toString(),
                  textAlign: TextAlign.center, style: AppFonts.light())),
          Expanded(
              flex: 2,
              child: Text(
                  AppFunction.formatDateTimeFromApi(data.time),
                  textAlign: TextAlign.center,
                  style: AppFonts.light()))
        ],
      ),
    );
  }
}
