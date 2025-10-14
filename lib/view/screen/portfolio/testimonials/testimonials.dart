import 'package:advocateoffice/controller/ui/portfolio/testimonials.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/portfolio/testimonials/mobile/mobile.dart';
import 'package:advocateoffice/view/screen/portfolio/testimonials/tablet_and_desktop/tablet_and_desktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestimonialsScreen extends StatelessWidget {
  TestimonialsScreen({super.key});
  final TestimonialsController controller = Get.put(TestimonialsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: TestimonialsScreenDesktopTablet(controller: controller),
          tablet: TestimonialsScreenDesktopTablet(
            controller: controller,
            width: 1200,
          ),
          phone: TestimonialsScreenMobile(
            controller: controller,
            width: 1200,
          ),
        ),
      ),
    );
  }
}
