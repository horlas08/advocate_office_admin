import 'package:advocateoffice/controller/ui/visitor.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/visitor/mobile/mobile.dart';
import 'package:advocateoffice/view/screen/visitor/tablet_and_desktop/tablet_and_desktop.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitorScreen extends StatelessWidget {
  final VisitorController controller = Get.put(VisitorController());
  @override
  Widget build(BuildContext context) {
    controller.fetchVisitorData();
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: VisitorTabletDesktop(controller: controller),
          tablet: VisitorTabletDesktop(controller: controller, width: 1350),
          phone: VisitorMobile(controller: controller, width: 1350),
        ),
      ),
    );
  }
}
