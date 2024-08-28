import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iot_app/screen/base_screen/base_screen_mixin.dart';
import 'package:iot_app/screen/base_screen/bases_creen.dart';

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
  Widget? buildLeftWidget() => SizedBox.shrink();

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
