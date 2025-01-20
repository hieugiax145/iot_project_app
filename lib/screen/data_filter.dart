import 'dart:math';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/provider/data_provider.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/screen/base_screen/base_screen_mixin.dart';
import 'package:iot_app/screen/base_screen/bases_screen.dart';
import 'package:iot_app/utils/app_function.dart';
import 'package:iot_app/widgets/dropdown_widget.dart';
import 'package:iot_app/widgets/touchable_widget.dart';
import 'package:provider/provider.dart';

import '../model/dropdown_model.dart';

class DataFilter extends BaseScreen {
  const DataFilter({super.key});

  @override
  State<StatefulWidget> createState() => DataSensorFilterState();
}

class DataSensorFilterState extends BaseState<DataFilter> with BaseScreenMixin {
  @override
  String setTitle() => "Filter";

  String startDate = "Select start date";
  String endDate = "Select end date";

  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();

  final List<DropdownModel> _order = [
    DropdownModel(id: 1, name: "DESC"),
    DropdownModel(id: 2, name: "ASC")
  ];

  @override
  Widget buildBody(BuildContext context) {
    // print(AppFunction.dateTimeFilter(startDate));
    return Consumer<DataProvider>(
        builder: (BuildContext context, DataProvider data, Widget? child) {
      print(data.query.order);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date range", style: AppFonts.regular(16)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TouchableWidget(
                          onPressed: () async {
                            DateTime pickedDate = await AppFunction.pickDate(
                                context, DateTime.now());
                            data.setStartDate(pickedDate.toString());
                            setState(() {
                              start.text = AppFunction.formatDateTimeFromApi(
                                  pickedDate.toString());
                            });
                          },
                          child: Container(
                              width: double.infinity,
                              // padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: AppThemes.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextField(
                                controller: start,
                                decoration: const InputDecoration(
                                    hintText: "Select start date",
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16)),
                              ))),
                    ),
                    const Icon(Icons.arrow_forward_rounded),
                    Expanded(
                      child: TouchableWidget(
                          onPressed: () async {
                            DateTime pickedDate = await AppFunction.pickDate(
                                context, DateTime.now());
                            data.setEndDate(pickedDate.toString());
                            setState(() {
                              end.text = AppFunction.formatDateTimeFromApi(
                                  pickedDate.toString());
                            });
                          },
                          child: Container(
                              width: double.infinity,
                              // padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: AppThemes.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextField(
                                controller: end,
                                decoration: const InputDecoration(
                                    hintText: "Select end date",
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16)),
                              ))),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text("Order", style: AppFonts.regular(16)),
                const SizedBox(height: 8),
                DropdownWidget(
                  hint: "Select order",
                  listItems: _order,
                  // value: DropdownModel(name: data.query.order),
                  onChange: (DropdownModel? e) {
                    data.setOrder(e?.name);
                  },
                ),
                // _dropDown()
              ],
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  _buildButton("Cancel", onTap: () {
                    Navigator.pop(context);
                  }),
                  const SizedBox(width: 8),
                  _buildButton("Apply", onTap: () {
                    data.getSensorsData();
                    data.getActivity();
                    Navigator.pop(context);
                  })
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _buildButton(String text, {Function()? onTap}) {
    return Expanded(
      child: TouchableWidget(
          onPressed: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: AppThemes.white,
                borderRadius: BorderRadius.circular(16)),
            child: Center(
                child: Text(
              text,
              style: AppFonts.normalBold(20),
            )),
          )),
    );
  }

  void _openDatePicker() {
    BottomPicker.range(
      pickerTitle: const Text(''),
      minFirstDate: DateTime.now(),
      maxSecondDate: DateTime.now(),
      // initialFirstDate: DateTime.now(),
      // initialSecondDate: DateTime.now(),
      onRangeDateSubmitPressed: (date1, date2) {
        setState(() {
          startDate = AppFunction.formatDateTimeFromApi(date1.toString());
          endDate = AppFunction.formatDateTimeFromApi(date2.toString());
        });
      },
    ).show(context);
  }

  Widget _dropDown() {
    return Container(
      width: double.infinity,
      // padding: const EdgeInsets.all(16),
      // decoration: BoxDecoration(
      //     color: AppThemes.white, borderRadius: BorderRadius.circular(16)),
      // child: DropdownButtonFormField<String>(
      //   isExpanded: true,
      //   onChanged: (value) {},
      //   decoration: const InputDecoration(
      //       border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 16)),
      //   hint: const Text("select order"),
      //   items: const [
      //     DropdownMenuItem<String>(value: "ASC", child: Text("ASC")),
      //     DropdownMenuItem<String>(value: "DESC", child: Text("DESC"))
      //     // "ASC"
      //   ],
      // ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          hint: const Text("select order"),
          // value: "ggg",
          items: [
            const DropdownMenuItem<String>(value: "ASC", child: Text("ASC")),
            const DropdownMenuItem<String>(value: "DESC", child: Text("DESC"))
          ],
        ),
      ),
    );
  }
}
