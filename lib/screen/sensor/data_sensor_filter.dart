import 'package:bottom_picker/bottom_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/screen/base_screen/base_screen_mixin.dart';
import 'package:iot_app/screen/base_screen/bases_creen.dart';
import 'package:iot_app/utils/app_function.dart';
import 'package:iot_app/widgets/touchable_widget.dart';

class DataSensorFilter extends BaseScreen {
  const DataSensorFilter({super.key});

  @override
  State<StatefulWidget> createState() => DataSensorFilterState();
}

class DataSensorFilterState extends BaseState<DataSensorFilter>
    with BaseScreenMixin {
  @override
  String setTitle() => "Filter";

  String startDate = "select start date";
  String endDate = "select end date";

  @override
  Widget buildBody(BuildContext context) {
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
                        onPressed: _openDatePicker,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppThemes.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Text(
                                startDate,
                                style: AppFonts.light(16),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const Icon(Icons.arrow_forward_rounded),
                  Expanded(
                    child: TouchableWidget(
                        onPressed: _openDatePicker,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppThemes.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Text(
                                endDate,
                                style: AppFonts.light(16),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text("Order", style: AppFonts.regular(16)),
              const SizedBox(height: 8),
              _dropDown()
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
                _buildButton("Apply")
              ],
            ),
          )
        ],
      ),
    );
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
      // maxSecondDate: DateTime.now(),
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
            DropdownMenuItem<String>(value: "ASC", child: Text("ASC")),
            DropdownMenuItem<String>(value: "DESC", child: Text("DESC"))
          ],

        ),
      ),
    );
  }
}
