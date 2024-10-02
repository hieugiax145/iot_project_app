import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../app/app_themes.dart';
import '../resource/fonts/app_fonts.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class AppFunction {
  static void log(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
  }

  static bool isNullEmpty(Object o) => "" == o;

  // static Future<bool> openPasscodeBottomSheet(
  //   BuildContext context,
  // ) async {
  //   TextEditingController controller = TextEditingController();
  //   bool isNotMatch = false;
  //   bool isCheck = false;
  //   await showModalBottomSheet(
  //       context: context,
  //       backgroundColor: AppThemes.transparent,
  //       isScrollControlled: true,
  //       builder: (context) {
  //         return StatefulBuilder(
  //           builder: (BuildContext context,
  //               void Function(void Function()) setState) {
  //             return Wrap(children: [
  //               Container(
  //                 // height: MediaQuery.of(context).size.height*0.5,
  //                 decoration: const BoxDecoration(
  //                     color: AppThemes.white,
  //                     borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(12),
  //                         topRight: Radius.circular(12))),
  //                 child: Column(
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(
  //                           horizontal: 16, vertical: 4),
  //                       child: Row(
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           Expanded(
  //                             child: Text(
  //                               "Nhập passcode",
  //                               style: AppFonts.normalBold(16),
  //                             ),
  //                           ),
  //                           IconButton(
  //                             icon: const Icon(CupertinoIcons.xmark),
  //                             iconSize: 20,
  //                             onPressed: () {
  //                               Navigator.pop(context, false);
  //                             },
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     const Divider(
  //                         height: 0, thickness: 1, color: AppThemes.gray),
  //                     Padding(
  //                       padding: const EdgeInsets.only(top: 20, bottom: 36),
  //                       child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: <Widget>[
  //                             const SizedBox.shrink(),
  //                             ...List.generate(
  //                                 6,
  //                                 (index) => PasscodeCircle(
  //                                     isFill:
  //                                         (index) < controller.text.length)),
  //                             const SizedBox.shrink()
  //                           ]),
  //                     ),
  //                     if (isNotMatch)
  //                       Container(
  //                         padding: const EdgeInsets.symmetric(
  //                             horizontal: 20, vertical: 12),
  //                         color: AppThemes.pink,
  //                         child: const Text(
  //                           "Passcode không chính xác. Nhập sai quá 5 lần sẽ bị khoá passcode sang ngày hôm sau. Còn x lần thử.",
  //                           style: TextStyle(
  //                               fontSize: 12,
  //                               height: 16 / 12,
  //                               color: AppThemes.red0),
  //                         ),
  //                       ),
  //                     TouchableWidget(
  //                         padding: const EdgeInsets.symmetric(vertical: 16),
  //                         decoration:
  //                             const BoxDecoration(color: AppThemes.gray2),
  //                         onPressed: () {},
  //                         child: const Text("Quên passcode")),
  //                     // const SizedBox(height: 12),
  //                     CustomKeyboard(
  //                       onTextInput: (value) async {
  //                         // _insertText(value, controller);
  //                         setState(() {
  //                           insertText(value, controller);
  //                         });
  //                         if (controller.text.length == 6 &&
  //                             controller.text == "000000") {
  //                           context.read<LoadingProvider>().showLoading();
  //                           setState(() {
  //                             isNotMatch = false;
  //                           });
  //                           Navigator.pop(context, true);
  //                           isCheck = true;
  //                           context.read<LoadingProvider>().hideLoading();
  //                           // Navigator.push(
  //                           //     context,
  //                           //     MaterialPageRoute(
  //                           //         builder: (context) => TestScreen()));
  //                         } else if (controller.text.length == 6 &&
  //                             controller.text != "000000") {
  //                           setState(() {
  //                             isNotMatch = true;
  //                             controller.clear();
  //                           });
  //                         }
  //                       },
  //                       onBackspace: () {
  //                         // _backspace(controller);
  //                         setState(() {
  //                           deleteText(controller);
  //                         });
  //                       },
  //                     ),
  //                     const SizedBox(height: 16)
  //                   ],
  //                 ),
  //               ),
  //             ]);
  //           },
  //           // child:
  //         );
  //       });
  //   return isCheck;
  // }

  static insertText(String value, TextEditingController controller) {
    if (controller.text.length < 6) {
      controller.text += value;
    }
  }

  static deleteText(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      controller.text =
          controller.text.substring(0, controller.text.length - 1);
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
        theme: picker.DatePickerTheme(
            cancelStyle: AppFonts.normalBold(16),
            doneStyle: AppFonts.normalBold(16)));
    if (pickedTime != null) {
      return pickedTime;
    } else {
      return currentTime ?? dateTimeText;
    }
  }

  static String formatTime(String? input) {
    if (input != null) {
      final date =
          DateTime.parse(input).toLocal().add(const Duration(hours: 7));
      final DateFormat formatter = DateFormat('HH:mm:ss');
      final String formatted = formatter.format(date);
      return formatted;
    } else {
      return "";
    }
  }

  static String formatDateTimeFromApi(String? input, {bool? haveTime}) {
    if (input != null) {
      final date =
          DateTime.parse(input).toLocal().add(const Duration(hours: 7));
      if (haveTime == true) {
        final DateFormat formatter = DateFormat('dd/MM/yyyy\nHH:mm:ss');
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
      DateTime dateTime =
          DateTime.parse(input).subtract(const Duration(hours: 7));
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      return formattedDate; // Output: 2024-08-03
    }
    return null;
  }

  static double mapValue(
      int value, int inputMin, int inputMax, int outputMin, int outputMax) {
    return (value - inputMin) *
            (outputMax - outputMin) /
            (inputMax - inputMin) +
        outputMin;
  }

  // static bool checkEmpty(BuildContext context, String id, String password) {
  //   bool check = true;
  //   if (id.isNotEmpty && password.isNotEmpty) {
  //     return check;
  //   } else {
  //     showDialogError(
  //         context, "Số định danh cá nhân và mật khẩu không đuợc để trống");
  //     return !check;
  //   }
  // }

  // static void showDialogError(BuildContext context, String? error,
  //     {String? title, Function()? onTap}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Dialog(
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //           elevation: 0,
  //           backgroundColor: Colors.white,
  //           child: Container(
  //             padding: const EdgeInsets.all(24),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text(
  //                   "Thông báo",
  //                   style: AppFonts.normalBold(16),
  //                 ),
  //                 const SizedBox(height: 12),
  //                 Text(
  //                   error ?? "Lỗi",
  //                   textAlign: TextAlign.center,
  //                   style: AppFonts.light(),
  //                 ),
  //                 const SizedBox(height: 12),
  //                 ButtonRed(
  //                   isSmall: true,
  //                     onTap: () {
  //                       Navigator.pop(context);
  //                     },
  //                     text: "Đóng")
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
}
