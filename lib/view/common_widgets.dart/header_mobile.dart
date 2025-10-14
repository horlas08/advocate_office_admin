import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/utils/theme/dark_theme.dart';
import 'package:advocateoffice/utils/theme/light_theme.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'header.dart';

class DashboardHeaderMobile extends StatelessWidget {
  const DashboardHeaderMobile({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontColor: Colors.white,
          ),
          Row(
            children: [
              Obx(
                    () => IconButton(
                  icon: Icon(
                    isLightTheme.isTrue ? Icons.light_mode : Icons.dark_mode,
                
                    size: 30,
                  ),
                  onPressed: () {
                    isLightTheme.value = !isLightTheme.value;
                    Get.changeTheme(isLightTheme.isTrue ? LightThemes.light : DarkThemeThemes.dark);
                  },
                ),
              ),
              const SizedBox(width: 5),
              PopupNotificationWidget(),
              const SizedBox(width: 10),
              ProfileMenu()
            ],
          ),
        ],
      ),
    );
  }
}
