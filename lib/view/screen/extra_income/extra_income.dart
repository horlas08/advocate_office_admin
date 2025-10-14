import 'package:advocateoffice/controller/ui/extra_income.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/extra_income/mobile/mobile.dart';
import 'package:advocateoffice/view/screen/extra_income/tablet_and_desktop/tablet_and_desktop.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtraIncomeScreen extends StatelessWidget {
  ExtraIncomeScreen({super.key});
  final ExtraIncomeController controller = Get.put(ExtraIncomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: ExtraIncomeTabletDesktop(controller: controller),
          tablet: ExtraIncomeTabletDesktop(controller: controller, width: 1500),
          phone: ExtraIncomeMobile(controller: controller, width: 1600),
        ),
      ),
    );
  }
}
