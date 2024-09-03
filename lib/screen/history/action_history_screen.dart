import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iot_app/screen/base_screen/base_screen_mixin.dart';
import 'package:iot_app/screen/base_screen/bases_creen.dart';
import 'package:iot_app/widgets/table_history.dart';

import '../../app/app_themes.dart';
import '../../widgets/table_sensor.dart';

class ActionHistoryScreen extends BaseScreen {
  const ActionHistoryScreen({super.key});

  @override
  State<StatefulWidget> createState() => ActionHistoryScreenState();
}

class ActionHistoryScreenState extends BaseState<ActionHistoryScreen>
    with BaseScreenMixin {
  @override
  String setTitle() => "Action History";

  @override
  Widget? buildLeftWidget() => const SizedBox.shrink();

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: TableHistory(),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(
              color: AppThemes.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: const Row(
            children: [
              Expanded(child: Text("Tổng: 0")),
              Icon(Icons.navigate_before),
              Icon(Icons.navigate_next)
            ],
          ),
        )
      ],
    );
  }
}
