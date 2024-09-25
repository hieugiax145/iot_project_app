import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/model/dropdown_model.dart';

import '../app/app_themes.dart';
import '../resource/fonts/app_fonts.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget(
      {super.key,
      this.label,
      this.hint,
      this.value,
      required this.listItems,
      required this.onChange});

  final String? label;
  final String? hint;
  final DropdownModel? value;
  final List<DropdownModel> listItems;
  final void Function(DropdownModel?) onChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<DropdownModel>(
        isExpanded: true,
        hint: Text(hint ?? ""),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: AppThemes.white), //<-- SEE HERE
              borderRadius: BorderRadius.circular(16.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: AppThemes.white), //<-- SEE HERE
              borderRadius: BorderRadius.circular(16.0),
            ),
            // labelText: label,
            // labelStyle: const TextStyle(
            //     color: Color(0xff8C8C8C),
            //     // fontFamily: AppFonts.laTo,
            //     fontSize: 16,
            //     fontWeight: FontWeight.w600),
            contentPadding: const EdgeInsets.all(16)),
        value: value,
        items: listItems
            .map((DropdownModel e) => DropdownMenuItem<DropdownModel>(
                value: e, child: Text(e.name ?? "")))
            .toList(),
        onChanged: (value) {
          onChange(value);
        },
      ),
    );
  }
}
