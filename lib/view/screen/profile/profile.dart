import 'package:advocateoffice/controller/ui/profile.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/profile/mobile/mobile.dart';
import 'package:advocateoffice/view/screen/profile/tablet_and_desktop/tablet_and_desktop.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: ProfileScreenDesktopTablet(controller: controller),
          tablet: ProfileScreenDesktopTablet(controller: controller),
          phone: ProfileScreenMobile(controller: controller),
        ),
      ),
    );
  }
}
