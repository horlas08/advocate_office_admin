import 'package:advocateoffice/controller/ui/portfolio/service.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/portfolio/service/mobile/mobile.dart';
import 'package:advocateoffice/view/screen/portfolio/service/tablet_and_desktop/tablet_and_desktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceScreen extends StatelessWidget {
  ServiceScreen({super.key});
  final ServiceController controller = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: ServiceScreenDesktopTablet(controller: controller),
          tablet: ServiceScreenDesktopTablet(controller: controller, width: 1200),
          phone: ServiceScreenMobile(controller: controller, width: 1200),
        ),
      ),
    );
  }
}
