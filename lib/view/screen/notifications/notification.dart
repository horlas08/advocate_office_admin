import 'package:advocateoffice/controller/ui/notification.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/notifications/desktop_tablet/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mobile/notification.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: NotificationTabletDesktop(controller: controller),
          tablet: NotificationTabletDesktop(controller: controller),
          phone: NotificationMobile(controller: controller),
        ),
      ),
    );
  }
}
