
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Setting Color, theme in Easyloading
class EasyloadingSettings {
  easyloadingSetting() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 500)
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = AppColors.primary1
      ..indicatorColor = AppColors.background2
      ..maskColor = AppColors.whiteColor
      ..textColor = AppColors.whiteColor
      ..contentPadding = const EdgeInsets.symmetric(horizontal: 50, vertical: 20)
      ..indicatorType = EasyLoadingIndicatorType.fadingGrid
      ..userInteractions = false
      ..successWidget = const Icon(Icons.check_circle_rounded, color: Colors.white, size: 40)
      ..errorWidget = const Icon(Icons.error_outline, color: Colors.white, size: 30)
      ..dismissOnTap = false;
  }
}
