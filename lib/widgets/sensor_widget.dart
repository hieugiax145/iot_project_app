import 'package:flutter/material.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/resource/images/app_images.dart';

class SensorWidget extends StatefulWidget {
  const SensorWidget({super.key});

  @override
  State<SensorWidget> createState() => _SensorWidgetState();
}

class _SensorWidgetState extends State<SensorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(4),
              width: (MediaQuery.of(context).size.width - 80) / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Temperature",
                    style: AppFonts.normalBold(12),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "30",
                        style: AppFonts.light(28),
                      ),
                      const SizedBox(width: 12),
                      Flexible(child: Image.asset(AppImages.sensorTemp)),
                    ],
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.all(4),
              width: (MediaQuery.of(context).size.width - 80) / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Humidity",
                    style: AppFonts.normalBold(12),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "30",
                        style: AppFonts.light(28),
                      ),
                      const SizedBox(width: 12),
                      Flexible(child: Image.asset(AppImages.sensorHumidity)),
                    ],
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.all(4),
              width: (MediaQuery.of(context).size.width - 80) / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Light",
                    style: AppFonts.normalBold(12),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          "30",
                          style: AppFonts.light(28),
                        ),
                      ),
                      Flexible(child: Image.asset(AppImages.sensorLight)),
                    ],
                  ),
                ],
              )),
          // SizedBox(
          //     width: (MediaQuery.of(context).size.width - 80) / 3,
          //     child: Image.asset(AppImages.sensorHumidity)),
          // SizedBox(
          //     width: (MediaQuery.of(context).size.width - 80) / 3,
          //     child: Image.asset(AppImages.sensorLight)),
        ],
      ),
    );
  }
}
