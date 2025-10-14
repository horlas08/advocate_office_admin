import 'package:advocateoffice/controller/ui/auth_controller.dart';
import 'package:advocateoffice/controller/ui/notification.dart';
import 'package:advocateoffice/model/notification.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/utils/local_storage/local_data.dart';
import 'package:advocateoffice/utils/theme/dark_theme.dart';
import 'package:advocateoffice/utils/theme/light_theme.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Obx(
                () => IconButton(
                  icon: Icon(
                    isLightTheme.isTrue ? Icons.light_mode : Icons.dark_mode,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    isLightTheme.value = !isLightTheme.value;
                    Get.changeTheme(isLightTheme.isTrue
                        ? LightThemes.light
                        : DarkThemeThemes.dark);
                  },
                ),
              ),
              const SizedBox(width: 10),
              PopupNotificationWidget(),
              const SizedBox(width: 20),
              ProfileMenu()
            ],
          ),
        ],
      ),
    );
  }
}

class PopupNotificationWidget extends StatelessWidget {
  final NotificationController notificationController =
      Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopupMenuButton(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        icon: Badge(
          backgroundColor: AppColors.errorColor,
          label: CustomTextWidget(
            text: "${notificationController.notificationList.length}",
            fontSize: 14,
            fontColor: Colors.white,
          ),
          child: const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          ),
        ),
        // itemBuilder: (context) => notificationController.notificationList.map((f) => buildPopupMenuItem(context: context, data: f)).toList(),
        itemBuilder: (context) => [
          for (var i in notificationController.notificationList)
            buildPopupMenuItem(context: context, data: i),
          PopupMenuItem(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    Get.offAllNamed(RoutesName.notification);
                  },
                  child: CustomTextWidget(
                    text: "See More",
                    textAlign: TextAlign.end,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ))
        ],
      ),
    );
  }

  PopupMenuItem<dynamic> buildPopupMenuItem(
      {required BuildContext context, required NotificationModel data}) {
    return PopupMenuItem(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundImage: AssetImage("assets/bg_removed.png"),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                      text: "${data.senderName}",
                      fontColor:
                          Theme.of(context).textTheme.headlineMedium!.color),
                  CustomTextWidget(text: "${data.dateTime}", fontSize: 11),
                  CustomTextWidget(
                    text: "${data.message}",
                    fontSize: 13,
                    maxLine: 3,
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

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: CircleAvatar(
        radius: 15,
        backgroundImage: const NetworkImage(
          'https://img.icons8.com/?size=100&id=23309&format=png&color=000000',
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
        ),
      ),
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      itemBuilder: (context) => [
        _buildPopupMenuItem(
            context: context, icon: Icons.person, text: 'مظهر جانبي', value: 0),
        _buildPopupMenuItem(
            context: context, icon: Icons.logout, text: 'تسجيل الخروج', value: 1),
      ],
      onSelected: (value) {
        switch (value) {
          case 0:
            Get.toNamed(RoutesName.profile);
            break;
          case 1:
            buildShowLogout(context);
            break;
        }
      },
    );
  }

  Future<dynamic> buildShowLogout(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => CustomAlertDialogue(
        confirmButtonName: "تسجيل الخروج",
        title: "تأكيد الخروج",
        body: CustomTextWidget(
          text: "هل أنت متأكد ! ..\nتريد تسجيل الخروج.؟",
          maxLine: 5,
          fontColor: Theme.of(context).textTheme.headlineMedium!.color,
        ),
        confirmButtonFunction: () async {
          await LocalData().deleteAllData();
          AuthController auth = Get.find<AuthController>();
          auth.initializeAuthState();
          Get.offAllNamed(RoutesName.login);
          Get.back();
        },
      ),
    );
  }

  PopupMenuItem<int> _buildPopupMenuItem(
      {required BuildContext context,
      required IconData icon,
      required String text,
      required int value}) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon,
              color: Theme.of(context).textTheme.headlineMedium!.color,
              size: 20),
          const SizedBox(width: 12),
          CustomTextWidget(
              text: text,
              fontColor: Theme.of(context).textTheme.headlineMedium!.color),
        ],
      ),
    );
  }
}
