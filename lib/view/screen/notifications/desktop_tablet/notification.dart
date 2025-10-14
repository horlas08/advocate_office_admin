import 'package:advocateoffice/controller/ui/notification.dart';
import 'package:advocateoffice/model/notification.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationTabletDesktop extends StatelessWidget {
  NotificationTabletDesktop({super.key, required this.controller, this.width});
  final NotificationController controller;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBarView(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DashboardHeader(title: 'الاشعارات'),
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
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    super.key,
    required this.data,
  });

  final NotificationModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundImage: AssetImage("assets/bg_removed.png"),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(text: "${data.senderName}",fontSize: 15, fontColor: Theme.of(context).textTheme.headlineMedium!.color),
                        CustomTextWidget(
                          text: "${data.dateTime}",
                          fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                          fontSize: 12,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  CustomTextWidget(
                    text: "${data.message} ${data.message}",
                    fontSize: 15,
                    maxLine: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
