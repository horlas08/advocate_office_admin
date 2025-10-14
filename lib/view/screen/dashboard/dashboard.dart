import 'package:advocateoffice/controller/ui/dashboard.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/dashboard/desktop_tablet/desktop.dart';
import 'package:advocateoffice/view/screen/dashboard/mobile/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
     controller.getLoading();
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: DashboardTabletDesktop(dashboardController: controller),
          tablet: DashboardTabletDesktop(dashboardController: controller, width: 1100),
          phone: DashboardMobile(controller: controller, width: 1200,),
        ),
      ),
    );
  }
}
