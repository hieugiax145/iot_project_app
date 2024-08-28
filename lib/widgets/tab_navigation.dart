import 'package:flutter/material.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/widgets/touchable_widget.dart';

class TabNavigation extends StatelessWidget {
  const TabNavigation(
      {super.key,
      this.label,
      this.icon,
      this.onTap,
      this.iconSelected,
      this.isSelected});

  final String? label;
  final String? icon;
  final String? iconSelected;
  final bool? isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TouchableWidget(
        onPressed: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(!isSelected! ? icon! : iconSelected!,
                    fit: BoxFit.fitWidth
                    // height: 12,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                label ?? "button",
                // overflow: TextOverflow.ellipsis,
                style: AppFonts.normalBold(12),
              )
            ],
          ),
        ));
  }
}
