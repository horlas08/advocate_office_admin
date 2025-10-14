import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:advocateoffice/view/screen/case/case_add/desktop/widgets/add.dart';
import 'package:advocateoffice/view/screen/case/case_add/header.dart';
import 'package:flutter/material.dart';

class CaseAddDesktop extends StatelessWidget {
  CaseAddDesktop({super.key, this.controller, this.width});
  final controller;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBarView(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DashboardHeader(title: 'إنشاء الحالة'),
                    const SizedBox(height: 20),
                    CaseCreateHeaderDesktop(),
                    const SizedBox(height: 20),
                    CaseCreateFieldDesktop(controller: controller, width: width),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
