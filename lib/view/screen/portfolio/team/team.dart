import 'package:advocateoffice/controller/ui/portfolio/team.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/portfolio/team/mobile/mobile.dart';
import 'package:advocateoffice/view/screen/portfolio/team/tablet_and_desktop/tablet_and_desktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamScreen extends StatelessWidget {
  TeamScreen({super.key});
  final TeamController controller = Get.put(TeamController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: TeamScreenDesktopTablet(controller: controller),
          tablet: TeamScreenDesktopTablet(controller: controller, width: 800),
          phone: TeamScreenMobile(controller: controller, width: 800),
        ),
      ),
    );
  }
}
