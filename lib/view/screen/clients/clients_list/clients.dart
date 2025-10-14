import 'package:advocateoffice/controller/ui/clients/clients.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/clients/clients_list/tablet_and_desktop/tablet_and_desktop.dart';
import 'package:advocateoffice/view/screen/clients/clients_list/mobile/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsScreen extends StatelessWidget {
  ClientsScreen({super.key});
  final ClientsController controller = Get.put(ClientsController());
  @override
  Widget build(BuildContext context) {
    controller.fetchClient();
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: ClientsTabletDesktop(controller: controller),
          tablet: ClientsTabletDesktop(controller: controller, width: 1200),
          phone: ClientsMobile(controller: controller, width: 1200),
        ),
      ),
    );
  }
}
