import 'package:advocateoffice/controller/ui/task/case_task.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/my_task/case_task/desktop/desktop.dart';
import 'package:advocateoffice/view/screen/my_task/case_task/mobile/mobile.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CaseTaskScreen extends StatelessWidget {
  final CaseTaskController controller = Get.put(CaseTaskController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
            desktop: CaseTaskTabletDesktop(controller: controller),
            tablet: CaseTaskTabletDesktop(controller: controller, childAspectRatio: 1.2, crossAxisCount: 2),
            phone: CaseTaskMobile(controller: controller)),
      ),
    );
  }
}
