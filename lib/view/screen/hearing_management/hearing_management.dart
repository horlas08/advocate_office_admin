import 'package:advocateoffice/controller/ui/hearing_management.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/hearing_management/mobile/mobile.dart';
import 'package:advocateoffice/view/screen/hearing_management/tablet_and_desktop/tablet_and_desktop.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HearingManagementScreen extends StatelessWidget {
  final HearingManagementController controller = Get.put(HearingManagementController());

  @override
  Widget build(BuildContext context) {
    controller.getLoading();
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: HearingManagementTabletDesktop(controller: controller),
          tablet: HearingManagementTabletDesktop(controller: controller, width: 1500),
          phone: HearingManagementMobile(controller: controller, width: 1400),
        ),
      ),
    );
  }
}
