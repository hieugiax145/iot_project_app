import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../resource/fonts/app_fonts.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;

class AppFunction {
  AppFunction._();

  static void log(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
  }

  static bool isNullEmpty(Object o) => "" == o;

  static insertText(String value, TextEditingController controller) {
    if (controller.text.length < 6) {
      controller.text += value;
    }
  }

  static deleteText(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      controller.text = controller.text.substring(0, controller.text.length - 1);
    }
  }

  static void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static Future<DateTime> pickDate(BuildContext context, DateTime dateTimeText,
      {DateTime? minTime, DateTime? currentTime}) async {
    DateTime? pickedTime = await picker.DatePicker.showDatePicker(context,
        locale: picker.LocaleType.vi,
        currentTime: currentTime ?? DateTime.now(),
        minTime: minTime,
        theme: picker.DatePickerTheme(cancelStyle: AppFonts.normalBold(16), doneStyle: AppFonts.normalBold(16)));
    if (pickedTime != null) {
      return pickedTime;
    } else {
      return currentTime ?? dateTimeText;
    }
  }

  static String formatTime(String? input) {
    if (input != null) {
      final date = DateTime.parse(input).toLocal();
      final DateFormat formatter = DateFormat('HH:mm:ss');
      final String formatted = formatter.format(date);
      return formatted;
    } else {
      return "";
    }
  }

  static String formatDateTimeFromApi(String? input, {bool? haveTime}) {
    if (input != null) {
      final date = DateTime.parse(input).toLocal();
      if (haveTime == true) {
        final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
        final String formatted = formatter.format(date);
        return formatted;
      } else {
        final DateFormat formatter = DateFormat('dd/MM/yyyy');
        final String formatted = formatter.format(date);
        return formatted;
      }
    } else {
      return "";
    }
  }

  static String? dateTimeFilter(String? input) {
    if (input != null) {
      DateTime dateTime = DateTime.parse(input);
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      return formattedDate;
    }
    return null;
  }
}
