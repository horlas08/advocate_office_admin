import 'package:advocateoffice/controller/ui/case/case_add.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/case/case_add/desktop/desktop.dart';
import 'package:advocateoffice/view/screen/case/case_add/mobile/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseAddScreen extends StatelessWidget {
  CaseAddScreen({super.key});
  final CaseCreateController controller = Get.put(CaseCreateController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: CaseAddDesktop(controller: controller, width: MediaQuery.of(context).size.width / 6),
          tablet: CaseAddDesktop(controller: controller, width: MediaQuery.of(context).size.width / 3),
          phone: CaseAddMobile(
            controller: controller,
            width: MediaQuery.of(context).size.width,
            buttonWidth: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
