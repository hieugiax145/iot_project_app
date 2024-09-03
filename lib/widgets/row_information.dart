import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class RowInformation extends StatelessWidget {
  const RowInformation({super.key, this.titleLeft, this.titleRight});

  final String? titleLeft;
  final String? titleRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
              child: Text(
            titleLeft ?? "",
            style: AppFonts.normalBold(16),
          )),
          Flexible(
            flex: 3,
            child: RichText(
                text: TextSpan(
                    text: titleRight ?? "",
                    style: AppFonts.light(16, Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await launchUrl(Uri.parse(titleRight!));
                      })),
          )
        ],
      ),
    );
  }
}
