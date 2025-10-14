import 'package:advocateoffice/controller/ui/user/employee.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/user/employee/mobile/mobile.dart';
import 'package:advocateoffice/view/screen/user/employee/tablet_and_desktop/tablet_and_desktop.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatelessWidget {
  final EmployeeController controller = Get.put(EmployeeController());
  @override
  Widget build(BuildContext context) {
    controller.getEmployee();
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: EmployeeTabletDesktop(controller: controller),
          tablet: EmployeeTabletDesktop(
            controller: controller,
            width: 1200,
          ),
          phone: EmployeeMobile( controller: controller,
            width: 1200,),
        ),
      ),
    );
  }
}
