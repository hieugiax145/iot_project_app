import 'package:flutter/material.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/resource/images/app_images.dart';
import 'package:iot_app/screen/base_screen/base_screen_mixin.dart';
import 'package:iot_app/screen/base_screen/bases_creen.dart';
import 'package:iot_app/widgets/row_information.dart';

class ProfileScreen extends BaseScreen {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends BaseState<ProfileScreen> with BaseScreenMixin {
  @override
  String setTitle() => "Profile";

  @override
  Widget? buildLeftWidget() => const SizedBox.shrink();

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: AppThemes.white)),
          child: ClipOval(
            child: Image.asset(
              AppImages.avatar,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "HOÀNG GIA HIẾU",
          style: AppFonts.bold(20),
        ),
        Text(
          "B21DCCN352",
          style: AppFonts.regular(16),
        ),
        const SizedBox(height: 20),
        const RowInformation(
          titleLeft: "Github",
          titleRight: "https://github.com/hieugiax145",
        ),
        const SizedBox(height: 8),
        const RowInformation(
          titleLeft: "Swagger",
        ),
      ],
    );
  }
}
