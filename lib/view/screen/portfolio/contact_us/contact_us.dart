import 'package:advocateoffice/controller/ui/portfolio/contact_us.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/portfolio/contact_us/widgets/tablet_desktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsPortfolioSection extends StatelessWidget {
  ContactUsPortfolioSection({super.key});
  final ContactUsController controller = Get.put(ContactUsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: ContactUsPortfolioScreenDesktopTablet(controller: controller, screenType: "Desk"),
          tablet: ContactUsPortfolioScreenDesktopTablet(controller: controller, screenType: "Tab"),
          phone: ContactUsPortfolioScreenDesktopTablet(controller: controller, screenType: "Mob"),
        ),
      ),
    );
  }
}
