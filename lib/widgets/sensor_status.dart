import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/resource/images/app_images.dart';
import 'package:riff_switch/riff_switch.dart';

class SensorStatus extends StatefulWidget {
  const SensorStatus({super.key, this.iconOn, this.iconOff, this.value, this.onChanged, this.isSpin = false});

  final String? iconOn;
  final String? iconOff;
  final bool? value;
  final bool isSpin;
  final Function(bool)? onChanged;

  @override
  State<SensorStatus> createState() => _SensorStatusState();
}

class _SensorStatusState extends State<SensorStatus> with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: false);

  late final Animation<double> _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear);

  bool isOn = false;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.value! ? _animationController.repeat() : _animationController.stop();
    return Container(
        width: (MediaQuery.of(context).size.width - 40 - 16) / 2,
        height: (MediaQuery.of(context).size.width - 40 - 16) / 2,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppThemes.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: RotationTransition(
                    turns: widget.isSpin ? _animation : AnimationController(vsync: this),
                    child: Image.asset((widget.value! ? widget.iconOn : widget.iconOff) ?? AppImages.iconInfo),
                  ),
                ),
                Text(widget.value! ? "ON" : "OFF", style: AppFonts.bold(20))
              ],
            ),
            Flexible(
              child: Transform.rotate(
                angle: 270 * pi / 180,
                child: RiffSwitch(
                    value: widget.value!,
                    onChanged: (e) {
                      widget.onChanged!(e);
                    },
                    type: RiffSwitchType.material),
              ),
            )
          ],
        ));
  }
}
