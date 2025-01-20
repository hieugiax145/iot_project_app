import 'package:flutter/material.dart';

import '../../app/app_themes.dart';
import '../../resource/fonts/app_fonts.dart';
import '../../utils/dimens_scale.dart';
import '../../widgets/touchable_widget.dart';
import 'bases_screen.dart';

mixin BaseScreenMixin<Page extends BaseScreen> on BaseState<Page> {
  Widget? buildHeaderExtend() => null;

  Widget? buildCustomTitle() => null;

  String setTitle() => '';

  Widget? buildLeftWidget() => null;

  Widget? buildRightWidget() => null;

  Widget? buildRightWidgetStack() => null;

  TextAlign? setTextAlignTitle() => null;

  TextStyle? setTextStyleTitle() => null;

  Widget? buildHeaderContent() => null;

  int setFlexRightWidget() => 1;

  double? setHeaderContentHeight() => null;

  double? setSizeHeaderBackground() => null;

  Color? setHeaderBackgroundColor() => null;

  Color? setColorRightWidget() => null;

  Color? setColorLeftWidget() => null;

  Widget? setHeaderBackgroundImage() => null;

  List<BoxShadow>? buildShadowHeader() => null;

  setOnPressLeftButton() {
    Navigator.pop(context);
  }

  setOnPressRightButton() => null;

  @override
  Widget buildHeader() {
    double? addSizeHeight = MediaQuery.of(context).padding.top > 24
        ? DimensScale.getInstance(context)?.verticalScale(0)
        : 0; // tăng size cho các màn hình có thanh trạng thái lớn (VD: Iphone X)
    // double? addSizeHeight = 0;
    double heightHeader =
        (setSizeHeaderBackground() ?? DimensScale.getInstance(context)?.verticalScale(80))! + addSizeHeight!;
    double heightHeaderContent =
        DimensScale.getInstance(context)!.verticalScale(80) - MediaQuery.of(context).padding.top + addSizeHeight;
    return Stack(
      children: [
        setHeaderBackgroundColor() == null
            ? Positioned.fill(
                child: Stack(children: []),
              )
            : Positioned.fill(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: heightHeader,
                  decoration: BoxDecoration(
                      color: setHeaderBackgroundColor() ?? AppThemes.background,
                      border: Border.all(width: 0, color: setHeaderBackgroundColor() ?? Colors.transparent)),
                ),
              ),
        Container(
          // constraints: BoxConstraints(minHeight: heightHeader),
          // height:heightHeader - MediaQuery.of(context).padding.top,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          width: MediaQuery.of(context).size.width,
          // alignment: Alignment.center,
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: buildHeaderContent() ??
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildLeftWidget() ??
                            TouchableWidget(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                child: const Icon(Icons.arrow_back_sharp),
                              ),
                            ),
                        const SizedBox(width: 8),
                        Expanded(
                            flex: 5,
                            child: buildCustomTitle() ??
                                Text(
                                  setTitle(),
                                  style: AppFonts.normalBold(24),
                                )),
                        TouchableWidget(
                          padding: const EdgeInsets.all(0),
                          child: buildRightWidget() ?? const SizedBox.shrink(),
                        )
                      ],
                    ),
              ),
              SizedBox(height: buildHeaderExtend() != null ? 16 : 0),
              buildHeaderExtend() ?? const SizedBox.shrink()
              // Expanded(flex: 1, child: buildHeaderExtend() ?? Container())
            ],
          ),
          // ),
        )
      ],
    );
  }
}
