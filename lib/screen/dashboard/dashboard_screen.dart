
import 'package:flutter/material.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/network/api_request.dart';
import 'package:iot_app/provider/data_provider.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/resource/images/app_images.dart';
import 'package:iot_app/screen/base_screen/base_screen_mixin.dart';
import 'package:iot_app/screen/base_screen/bases_creen.dart';
import 'package:iot_app/utils/extension.dart';
import 'package:iot_app/widgets/chart.dart';
import 'package:iot_app/widgets/sensor_status.dart';
import 'package:iot_app/widgets/sensor_widget.dart';
import 'package:provider/provider.dart';

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

  fetchData() async {
    await context.read<DataProvider>().getNewData();
  }

  @override
  void initState() {
    // TODO: implement initState
    // fetchData();
    // context.read<SensorsProvider>().getNewData();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<DataProvider>(
        builder: (BuildContext context, DataProvider sensor, Widget? child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // StreamBuilder(
              //   stream: channel.stream,
              //   builder:
              //       (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              //     return Text(snapshot.hasData?"${snapshot.data}":"helo");
              //   },
              // ),
              SensorWidget(
                  temp: sensor.latest2.temp,
                  hum: sensor.latest2.hum,
                  light: sensor.latest2.light),
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
                      ApiRequest.changeAction(e == true ? 1 : 0);
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
    });
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
