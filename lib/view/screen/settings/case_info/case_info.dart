import 'package:advocateoffice/controller/ui/settings/case_stage.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'desktop.dart';
import 'mobile.dart';

class CaseInfoScreen extends StatelessWidget {
  final CaseInfoController caseStageController = Get.put(CaseInfoController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: CaseInfoDesktop(controller: caseStageController),
          tablet: CaseInfoDesktop(controller: caseStageController),
          phone: CaseInfoMobile(controller: caseStageController),
        ),
      ),
    );
  }
}
