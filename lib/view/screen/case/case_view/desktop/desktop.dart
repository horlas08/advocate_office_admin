import 'package:advocateoffice/controller/ui/case/case_view.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:advocateoffice/view/screen/case/case_view/desktop/widget/case_details.dart';
import 'package:advocateoffice/view/screen/case/case_view/desktop/widget/case_extra_income_datatabel_tablet.dart';
import 'package:advocateoffice/view/screen/case/case_view/desktop/widget/case_expense_datatabel_tablet.dart';
import 'package:advocateoffice/view/screen/case/case_view/desktop/widget/case_history_datatabel_tablet.dart';
import 'package:advocateoffice/view/screen/case/case_view/desktop/widget/documents.dart';
import 'package:advocateoffice/view/screen/case/case_view/desktop/widget/payment_history_datatabel.dart';
import 'package:flutter/material.dart';

class CaseViewTabletDesktop extends StatelessWidget {
  const CaseViewTabletDesktop({super.key, required this.controller, this.screenType});
  final CaseViewController controller;
  final String? screenType;

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
                    const DashboardHeader(title: 'تفاصيل القضية'),
                    const SizedBox(height: 20),
                    CaseDetailsDesktop(),
                    const SizedBox(height: 20),
                    DocumentRowDesktop(controller: controller),
                    const SizedBox(height: 20),
                    CaseHistoryTableDesktop(controller: controller, screenType: screenType),
                    const SizedBox(height: 20),
                    PaymentHistoryTableDesktop(controller: controller, screenType: screenType),
                    const SizedBox(height: 20),
                    CaseExpenseHistoryTable(controller: controller, screenType: screenType),
                    const SizedBox(height: 20),
                    CaseExtraIncomeHistoryTable(controller: controller, screenType: screenType),
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
