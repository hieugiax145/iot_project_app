import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iot_app/provider/data_provider.dart';
import 'package:iot_app/screen/base_screen/base_screen_mixin.dart';
import 'package:iot_app/screen/base_screen/bases_creen.dart';
import 'package:iot_app/widgets/table_history.dart';
import 'package:provider/provider.dart';

import '../../app/app_themes.dart';
import '../../resource/images/app_images.dart';
import '../../widgets/page_number.dart';
import '../../widgets/table_sensor.dart';
import '../../widgets/touchable_widget.dart';
import '../sensor/data_filter.dart';

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

  fetchData() async {
    await context.read<DataProvider>().firstActivityData();
  }

  // @override
  // void afterFirstLayout(BuildContext context) {
  //   fetchData();
  // }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<DataProvider>(
        builder: (BuildContext context, DataProvider value, Widget? child) {
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
                                    const DataFilter()));
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
          value.loading
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TableHistory(
                            listData: value.actions,
                          ),
                        ],
                      ),
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
                Expanded(child: Text("Tổng: ${value.totalActivity}")),
                PageNumber(
                    currentPage: value.currentPage,
                    totalPage: value.totalActivityPage,
                    onTap: (e) {
                      value.pageActivityChange(e);
                    })
              ],
            ),
          )
        ],
      );
    });
  }
}
