import 'package:advocateoffice/controller/ui/fee_received.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/fee_received/mobile/mobile.dart';
import 'package:advocateoffice/view/screen/fee_received/tablet_and_desktop/tablet_and_desktop.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeeReceivedScreen extends StatelessWidget {
  FeeReceivedScreen({super.key});
  final FeeReceivedController controller = Get.put(FeeReceivedController());
  @override
  Widget build(BuildContext context) {
    controller.getLoading();
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: FeeReceivedTabletDesktop(controller: controller),
          tablet: FeeReceivedTabletDesktop(controller: controller, width: 1500),
          phone: FeeReceivedMobile(controller: controller, width: 1500),
        ),
      ),
    );
  }
}
