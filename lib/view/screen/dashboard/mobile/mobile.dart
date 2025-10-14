import 'package:advocateoffice/controller/ui/dashboard.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/dashboard/desktop_tablet/widget/conter_card.dart';
import 'package:advocateoffice/view/screen/dashboard/mobile/widget/case_line_chart.dart';
import 'package:advocateoffice/view/screen/dashboard/mobile/widget/recent_case_table.dart';
import 'package:advocateoffice/view/screen/dashboard/mobile/widget/recent_visitor_table.dart';
import 'package:advocateoffice/view/screen/dashboard/mobile/widget/visitor_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key, required this.controller, required this.width});
  final DashboardController controller;
  final double width;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getLoading(); // Deferred execution
    });
    return Scaffold(
      appBar: AppBar(

        title: const DashboardHeaderMobile(title: 'Dashboard'),
      ),
      drawer: NavigationBarViewMobile(), 
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => controller.isLoading.isTrue
                ? Expanded(child: DashboardShimmer())
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StatsRow(controller: controller),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                children: [
                                  VisitorLineChartMobile(controller: controller),
                                  SizedBox(width: 10, height: 20),
                                  CaseLineChartMobile(controller: controller),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ResentVisitorMobile(controller: controller, width: width),
                            const SizedBox(height: 20),
                            ResentCaseMobile(controller: controller, width: width-200),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
