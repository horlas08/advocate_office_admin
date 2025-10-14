import 'package:advocateoffice/controller/ui/settings/case_sections.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/settings/case_sections/mobile/widgets/datatabel.dart';
import 'package:flutter/material.dart';

class CaseSectionMobile extends StatelessWidget {
  const CaseSectionMobile({super.key, required this.controller, this.width});
  final CaseSectionsController controller;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'Case Sections'),
      ),
      drawer: NavigationBarViewMobile(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CaseSectionTableMobile(controller: controller),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
