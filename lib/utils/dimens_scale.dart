import 'package:flutter/widgets.dart';

class DimensScale {
  double _shortDimension = 1;
  double _longDimension = 1;
  final double _guidelineBaseWidth = 375; // base on iphone 6 7 8
  final double _guidelineBaseHeight = 667; // base on iphone 6 7 8

  static DimensScale? _instance;

  static DimensScale? getInstance(BuildContext context) {
    if (context == null) return null;
    if (_instance == null) {
      _instance = DimensScale(context);
      return _instance;
    }
    return _instance;
  }

  DimensScale(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _shortDimension = height > width ? width : height;
    _longDimension = height > width ? height : width;
  }

  double scale(double input) {
    return _shortDimension / _guidelineBaseWidth * input;
  }

  double verticalScale(double input) {
    return _longDimension / _guidelineBaseHeight * input;
  }

  double moderateScale(double input, {factor = 0.5}) {
    return input + (scale(input) - input) * factor;
  }
}

enum DimensScaleType {
  Vertical,
  Horizontal,
}
