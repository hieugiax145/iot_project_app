import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app/app_themes.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
}

abstract class BaseState<Screen extends BaseScreen> extends State<Screen> {
  Widget buildBody(BuildContext context);

  bool blankPage() => false;

  bool fixSizeHeader() => false;

  bool fixExpanded() => true;

  Widget buildHeader() => Container();

  Color? setBackgroundColor() => null;

  void afterFirstLayout(BuildContext context) => () {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: setBackgroundColor() ?? AppThemes.background,
      body: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            return Container(
              child: (fixSizeHeader()
                  ? Stack(
                      children: [
                        Container(
                          child: buildHeader(),
                        ),
                        Container(
                          child: buildBody(context),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        buildHeader(),
                        Expanded(
                            child: Container(
                          child: buildBody(context),
                        ))
                      ],
                    )),
            );
          },
        ),
      ),
    );
  }
}
