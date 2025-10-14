import 'package:advocateoffice/controller/ui/settings/case_sections.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/settings/case_sections/tablet_and_desktop/tablet_and_desktop.dart';
import 'package:advocateoffice/view/screen/settings/case_sections/mobile/mobile.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CaseSectionScreen extends StatelessWidget {
  final CaseSectionsController controller = Get.put(CaseSectionsController());

  @override
  Widget build(BuildContext context) {
    controller.getLoading();
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: CaseSectionTableTabletDesktop(controller: controller),
          tablet: CaseSectionTableTabletDesktop(
            controller: controller,
            width: 1000,
          ),
          phone: CaseSectionMobile(controller: controller, width: 1000 ),
        ),
      ),
    );
  }
}
