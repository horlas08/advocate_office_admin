import 'package:advocateoffice/controller/ui/case/case_list.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/case/case_list/tablet_and_desktop/tablet_and_desktop.dart';
import 'package:advocateoffice/view/screen/case/case_list/mobile/mobile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseScreen extends StatelessWidget {
  CaseScreen({super.key});
  final CaseListController controller = Get.put(CaseListController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: CaseListTabletDesktop(controller: controller),
          tablet: CaseListTabletDesktop(controller: controller, width: 1500),
          phone: CaseListMobile(controller: controller, width: 1200),
        ),
      ),
    );
  }
}
