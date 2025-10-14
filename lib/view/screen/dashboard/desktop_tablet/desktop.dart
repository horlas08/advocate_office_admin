import 'package:advocateoffice/controller/ui/dashboard.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';

import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/screen/dashboard/desktop_tablet/widget/case_line_chart.dart';
import 'package:advocateoffice/view/screen/dashboard/desktop_tablet/widget/conter_card.dart';
import 'package:advocateoffice/view/screen/dashboard/desktop_tablet/widget/recent_case_table.dart';
import 'package:advocateoffice/view/screen/dashboard/desktop_tablet/widget/recent_visitor_table.dart';
import 'package:advocateoffice/view/screen/dashboard/desktop_tablet/widget/visitor_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardTabletDesktop extends StatelessWidget {
  const DashboardTabletDesktop({super.key, required this.dashboardController, this.width});
  final DashboardController dashboardController;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBarView(),
          Obx(
            () => dashboardController.isLoading.isTrue
                ? Expanded(child: DashboardShimmer())
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DashboardHeader(title: 'لوحة البيانات'),
                            const SizedBox(height: 20),
                            StatsRow(controller: dashboardController),
                            const SizedBox(height: 50),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                children: [
                                  VisitorLineChartDesktop(controller: dashboardController),
                                  SizedBox(width: 10, height: 20),
                                  CaseLineChartDesktop(controller: dashboardController),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ResentVisitorTableDesktop(controller: dashboardController, width: width),
                            const SizedBox(height: 20),
                            ResentCaseTableDesktop(controller: dashboardController, width: width),
                            SizedBox(height: 20),
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
