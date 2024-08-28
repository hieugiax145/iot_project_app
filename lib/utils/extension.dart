import 'package:flutter/material.dart';

extension ListExtension<T> on List<T> {
  List<T> addBetween(T element, {bool bound = false}) {
    if (length <= 1) {
      return this;
    }
    return [
      if (bound) element,
      ...expand((e) {
        if (e != last) {
          return [e, element];
        } else {
          return [e];
        }
      }),
      if (bound) element,
    ];
  }
}

extension IntEditingController on TextEditingController {
  // Get integer value from the text
  int get intValue {
    try {
      return int.parse(text);
    } catch (_) {
      return 0; // or any default value you prefer
    }
  }

  // Set integer value to the text
  set intValue(int value) {
    text = value.toString();
  }
}
