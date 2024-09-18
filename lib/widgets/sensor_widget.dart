import 'package:flutter/material.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/resource/images/app_images.dart';
import 'package:iot_app/widgets/sensor_tile.dart';

class SensorWidget extends StatefulWidget {
  const SensorWidget({super.key, this.temp, this.hum, this.light});

  final num? temp;
  final num? hum;
  final num? light;

  @override
  State<SensorWidget> createState() => _SensorWidgetState();
}

class _SensorWidgetState extends State<SensorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SensorTile(
              title: "Temperature",
              value: widget.temp ?? 0,
              icon: AppImages.sensorTemp,
              color: [
                AppThemes.temp0,
                AppThemes.temp1,
                AppThemes.temp2,
                AppThemes.temp3,
                AppThemes.temp4,
                AppThemes.temp5
              ]),
          SensorTile(
              title: "Humidity",
              value: widget.hum ?? 0,
              icon: AppImages.sensorHumidity,
              color: [
                AppThemes.hum0,
                AppThemes.hum1,
                AppThemes.hum2,
                AppThemes.hum3,
                AppThemes.hum4,
                AppThemes.hum5
              ]),
          SensorTile(
              title: "Light",
              value: widget.light ?? 0,
              icon: AppImages.sensorLight,
              color: [
                AppThemes.light0,
                AppThemes.light1,
                AppThemes.light2,
                AppThemes.light3,
                AppThemes.light4,
                AppThemes.light5
              ])
        ],
      ),
    );
  }
}
