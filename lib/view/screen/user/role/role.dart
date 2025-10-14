import 'package:advocateoffice/controller/ui/user/permission.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/user/role/desktop/desktop.dart';
import 'package:advocateoffice/view/screen/user/role/mobile/mobile.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  final PermissionController controller = Get.put(PermissionController());
  @override
  Widget build(BuildContext context) {
    controller.getLoading();
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: RoleDesktop(controller: controller),
          tablet: RoleDesktop(controller: controller),
          phone: PermissionMobile(controller: controller),
        ),
      ),
    );
  }
}
