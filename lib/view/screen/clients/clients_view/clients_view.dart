import 'package:advocateoffice/controller/ui/clients/clients_view.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/clients/clients_view/tablet_and_desktop/tablet_and_desktop.dart';
import 'package:advocateoffice/view/screen/clients/clients_view/mobile/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsViewScreen extends StatelessWidget {
  ClientsViewScreen({super.key});
  final ClientViewController controller = Get.put(ClientViewController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: ClientsViewTabletDesktop(
            controller: controller,
          ),
          tablet: ClientsViewTabletDesktop(
            controller: controller,
            width: 1500,
          ),
          phone: ClientsViewMobile(),
        ),
      ),
    );
  }
}
