import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/utils/app_function.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';

import '../resource/fonts/app_fonts.dart';
import '../resource/images/app_images.dart';

class SensorTile extends StatefulWidget {
  const SensorTile(
      {super.key,
      this.title,
      this.unit,
      required this.value,
      this.icon,
      this.color});

  final String? title;
  final String? unit;
  final num value;
  final String? icon;
  final List<Color>? color;

  @override
  State<SensorTile> createState() => _SensorTileState();
}

class _SensorTileState extends State<SensorTile> {
  @override
  Widget build(BuildContext context) {
    final value = widget.title == "Light"
        ? AppFunction.mapValue(widget.value.toInt(), 1024, 0, 0, 100)
        : widget.value;
    return Stack(children: [
      widget.unit == "%"
          ? Positioned.fill(
              child: Container(
                  width: (MediaQuery.of(context).size.width - 72) / 3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: FAProgressBar(
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      currentValue: value.toDouble(),
                      backgroundColor: (value <= 10
                          ? widget.color![0]
                          : value <= 30
                              ? widget.color![0]
                              : value <= 45
                                  ? widget.color![1]
                                  : value <= 65
                                      ? widget.color![2]
                                      : value <= 90
                                          ? widget.color![3]
                                          : widget.color![4]),
                      progressColor: (value <= 10
                          ? widget.color![0]
                          : value <= 30
                              ? widget.color![1]
                              : value <= 45
                                  ? widget.color![2]
                                  : value <= 65
                                      ? widget.color![3]
                                      : value <= 90
                                          ? widget.color![4]
                                          : widget.color![5]),
                    ),
                  )),
            )
          : Container(
              padding: const EdgeInsets.all(12),
              width: (MediaQuery.of(context).size.width - 72) / 3,
              height: (MediaQuery.of(context).size.width - 72) / 2,
              decoration: BoxDecoration(
                  color: widget.title == "Temperature"
                      ? (widget.value <= 10
                          ? widget.color![0]
                          : widget.value <= 20
                              ? widget.color![1]
                              : widget.value <= 25
                                  ? widget.color![3]
                                  : widget.value <= 35
                                      ? widget.color![4]
                                      : widget.color![5])
                      : widget.title == "Humidity"
                          ? (widget.value <= 10
                              ? widget.color![0]
                              : widget.value <= 30
                                  ? widget.color![1]
                                  : widget.value <= 45
                                      ? widget.color![2]
                                      : widget.value <= 65
                                          ? widget.color![3]
                                          : widget.value <= 90
                                              ? widget.color![4]
                                              : widget.color![5])
                          : widget.title == "Light"
                              ? (widget.value >= 900
                                  ? widget.color![0]
                                  : widget.value >= 600
                                      ? widget.color![1]
                                      : widget.value >= 400
                                          ? widget.color![2]
                                          : widget.value >= 200
                                              ? widget.color![3]
                                              : widget.value >= 100
                                                  ? widget.color![4]
                                                  : widget.color![5])
                              : AppThemes.white,
                  borderRadius: BorderRadius.circular(16)),
            ),
      Container(
          padding: const EdgeInsets.all(12),
          width: (MediaQuery.of(context).size.width - 72) / 3,
          height: (MediaQuery.of(context).size.width - 72) / 2,
          decoration: BoxDecoration(
              // color: widget.title == "Temperature"
              //     ? (widget.value <= 10
              //         ? widget.color![0]
              //         : widget.value <= 20
              //             ? widget.color![1]
              //             : widget.value <= 25
              //                 ? widget.color![3]
              //                 : widget.value <= 35
              //                     ? widget.color![4]
              //                     : widget.color![5])
              //     : widget.title == "Humidity"
              //         ? (widget.value <= 10
              //             ? widget.color![0]
              //             : widget.value <= 30
              //                 ? widget.color![1]
              //                 : widget.value <= 45
              //                     ? widget.color![2]
              //                     : widget.value <= 65
              //                         ? widget.color![3]
              //                         : widget.value <= 90
              //                             ? widget.color![4]
              //                             : widget.color![5])
              //         : widget.title == "Light"
              //             ? (widget.value >= 900
              //                 ? widget.color![0]
              //                 : widget.value >= 600
              //                     ? widget.color![1]
              //                     : widget.value >= 400
              //                         ? widget.color![2]
              //                         : widget.value >= 200
              //                             ? widget.color![3]
              //                             : widget.value >= 100
              //                                 ? widget.color![4]
              //                                 : widget.color![5])
              //             : AppThemes.white,
              // color: Colors.transparent,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title ?? "",
                style: AppFonts.normalBold(12),
              ),
              const SizedBox(height: 20),
              Image.asset(
                widget.icon ?? AppImages.sensorTemp,
                height: 48,
              ),
              const SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                      text: value.round().toString(),
                      style: AppFonts.bold(20),
                      children: [
                    TextSpan(
                        text: widget.unit ?? "", style: AppFonts.regular(16))
                  ])),
            ],
          )),
    ]);
  }

  double mapValue(
      int value, int inputMin, int inputMax, int outputMin, int outputMax) {
    return (value - inputMin) *
            (outputMax - outputMin) /
            (inputMax - inputMin) +
        outputMin;
  }
}
