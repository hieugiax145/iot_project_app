import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/app/app_themes.dart';

import '../resource/fonts/app_fonts.dart';
import '../resource/images/app_images.dart';

class SensorTile extends StatefulWidget {
  const SensorTile({super.key, this.title,required this.value, this.icon, this.color});

  final String? title;
  final num value;
  final String? icon;
  final List<Color>? color;

  @override
  State<SensorTile> createState() => _SensorTileState();
}

class _SensorTileState extends State<SensorTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        width: (MediaQuery.of(context).size.width - 72) / 3,
        decoration: BoxDecoration(
            color: widget.title == "Temperature"
                ? (widget.value<=10?widget.color![0]:widget.value<=20?widget.color![1]:widget.value<=25?widget.color![3]:widget.value!<=35?widget.color![4]:widget.color![5])
                : widget.title == "Humidity"
                    ? widget.color![1]
                    : widget.title == "Light"
                        ? widget.color![2]
                        : AppThemes.white,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title ?? "",
              style: AppFonts.normalBold(12),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: AutoSizeText(
                    (widget.value ?? 0).round().toString(),
                    style: AppFonts.light(28),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                    child: Image.asset(widget.icon ?? AppImages.sensorTemp)),
              ],
            ),
          ],
        ));
  }
}
