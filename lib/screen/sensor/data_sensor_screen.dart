import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/provider/sensors_provider.dart';
import 'package:iot_app/resource/images/app_images.dart';
import 'package:iot_app/screen/base_screen/base_screen_mixin.dart';
import 'package:iot_app/screen/base_screen/bases_creen.dart';
import 'package:iot_app/screen/sensor/data_sensor_filter.dart';
import 'package:iot_app/widgets/page_number.dart';
import 'package:iot_app/widgets/table_sensor.dart';
import 'package:iot_app/widgets/touchable_widget.dart';
import 'package:provider/provider.dart';

class DataSensorScreen extends BaseScreen {
  const DataSensorScreen({super.key});

  @override
  State<StatefulWidget> createState() => DataSensorScreenState();
}

class DataSensorScreenState extends BaseState<DataSensorScreen>
    with BaseScreenMixin {
  @override
  String setTitle() => "Sensors Data";

  @override
  bool fixExpanded() => false;

  @override
  Widget? buildLeftWidget() => const SizedBox.shrink();

  fetchData() async {
    await context.read<SensorsProvider>().firstData();
  }

  // @override
  // void afterFirstLayout(BuildContext context) {
  //   fetchData();
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<SensorsProvider>(
        builder: (BuildContext context, SensorsProvider value, Widget? child) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IntrinsicHeight(
              child: SizedBox(
                height: 48,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: AppThemes.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    TouchableWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DataSensorFilter()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: AppThemes.white, shape: BoxShape.circle),
                        child: Image.asset(
                          AppImages.iconFilter,
                          // height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                children: [
                  TableSensor(listData: value.list),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
                color: AppThemes.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Row(
              children: [
                Expanded(child: Text("Tổng: ${value.totalItem}")),
                PageNumber(
                    currentPage: value.currentPage,
                    totalPage: 10,
                    onTap: (e) {
                      value.pageChange(e);
                    })
              ],
            ),
          )
        ],
      );
    });
  }

  void _openDatePicker(BuildContext context) {
    BottomPicker.range(
      pickerTitle: const Text('heelo'),
      onRangeDateSubmitPressed: (DateTime first, DateTime second) {},
      bottomPickerTheme: BottomPickerTheme.blue,
    ).show(context);
  }
}
