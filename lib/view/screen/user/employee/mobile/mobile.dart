import 'package:advocateoffice/controller/ui/user/employee.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/screen/user/employee/mobile/datatabel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeMobile extends StatelessWidget {
  EmployeeMobile({super.key, required this.controller, required this.width});
  final EmployeeController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
  title: const DashboardHeaderMobile(title: 'الموظفين'),
      ),
      drawer: NavigationBarViewMobile(),
      body: Obx(
        () => controller.isLoading.isTrue
            ? DashboardShimmer()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    EmployeeTableMobile(
                      controller: controller,
                      width: width,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }
}
