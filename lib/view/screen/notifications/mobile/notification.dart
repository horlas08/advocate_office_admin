import 'package:advocateoffice/controller/ui/notification.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/notifications/desktop_tablet/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationMobile extends StatelessWidget {
  const NotificationMobile({super.key, required this.controller});
  final NotificationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'إعلام'),
      ),
      drawer: NavigationBarViewMobile(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.notificationList.length,
                  itemBuilder: (context, index) {
                    return NotificationCardWidget(data: controller.notificationList[index]);
                  }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
