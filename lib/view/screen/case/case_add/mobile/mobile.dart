import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/case/case_add/desktop/widgets/add.dart';
import 'package:advocateoffice/view/screen/case/case_add/header.dart';
import 'package:flutter/material.dart';

class CaseAddMobile extends StatelessWidget {
  CaseAddMobile(
      {super.key, required this.controller, this.width, this.buttonWidth});
  final controller;
  final double? width;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'إنشاء الحالة'),
      ),
      drawer: NavigationBarViewMobile(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CaseCreateHeaderDesktop(),
              const SizedBox(height: 20),
              CaseCreateFieldDesktop(
                controller: controller,
                width: width,
                buttonWidth: buttonWidth,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
