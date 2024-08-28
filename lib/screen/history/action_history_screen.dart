import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iot_app/screen/base_screen/base_screen_mixin.dart';
import 'package:iot_app/screen/base_screen/bases_creen.dart';

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
      children: [],
    );
  }
}
