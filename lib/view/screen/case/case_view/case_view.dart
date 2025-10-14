import 'package:advocateoffice/controller/ui/case/case_view.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/case/case_view/desktop/desktop.dart';
import 'package:advocateoffice/view/screen/case/case_view/mobile/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseViewScreen extends StatelessWidget {
  final CaseViewController controller = Get.put(CaseViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: CaseViewTabletDesktop(controller: controller),
          tablet: CaseViewTabletDesktop(controller: controller, screenType: "Tablet"),
          phone: CaseViewMobile(controller: controller , width: 1100),
        ),
      ),
    );
  }
}
