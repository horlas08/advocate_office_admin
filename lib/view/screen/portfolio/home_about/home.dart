import 'package:advocateoffice/controller/ui/portfolio/home.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/portfolio/home_about/widgets/tablet_desktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePortfolioSection extends StatelessWidget {
  HomePortfolioSection({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: HomePortfolioScreenDesktopTablet(
              controller: controller, screenType: 'Desk'),
          tablet: HomePortfolioScreenDesktopTablet(
              controller: controller, screenType: 'Tab'),
          phone: HomePortfolioScreenDesktopTablet(
              controller: controller, screenType: 'Mob'),
        ),
      ),
    );
  }
}
