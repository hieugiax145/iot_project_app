import 'package:flutter/material.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/resource/images/app_images.dart';
import 'package:iot_app/screen/base_screen/base_screen_mixin.dart';
import 'package:iot_app/screen/base_screen/bases_creen.dart';
import 'package:iot_app/utils/extension.dart';
import 'package:iot_app/widgets/chart.dart';
import 'package:iot_app/widgets/sensor_status.dart';
import 'package:iot_app/widgets/sensor_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: [Text("Dashboard")],
//       ),
//     );
//   }
// }

class DashboardScreen extends BaseScreen {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => DashboardScreenState();
}

class DashboardScreenState extends BaseState<DashboardScreen>
    with BaseScreenMixin {
  @override
  String setTitle() => "Dashboard";

  @override
  Color? setBackgroundColor() => AppThemes.background;

  @override
  Color? setHeaderBackgroundColor() => AppThemes.background;

  @override
  Widget? buildLeftWidget() => const SizedBox.shrink();

  bool fan = false;
  bool light = false;

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SensorWidget(),
            Text(
              "Devices",
              style: AppFonts.normalBold(16),
            ),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SensorStatus(
                  iconOn: AppImages.deviceLightOn,
                  iconOff: AppImages.deviceLightOff,
                  value: light,
                  onChanged: (e) {
                    setState(() {
                      light = e;
                    });
                  },
                ),
                SensorStatus(
                  iconOn: AppImages.deviceFanColor,
                  iconOff: AppImages.deviceFanOff,
                  isSpin: true,
                  value: fan,
                  onChanged: (e) {
                    setState(() {
                      fan = e;
                    });
                  },
                )
                // SensorStatus(),
              ],
            ),
            Text(
              "Sensors Chart",
              style: AppFonts.normalBold(16),
            ),
            ChartSensors(),
            SizedBox.shrink()
          ].addBetween(const SizedBox(height: 16)),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
