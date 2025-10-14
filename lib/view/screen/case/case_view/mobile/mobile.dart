import 'package:advocateoffice/controller/ui/case/case_view.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/case/case_view/desktop/widget/documents.dart';
import 'package:advocateoffice/view/screen/case/case_view/mobile/widget/case_details.dart';
import 'package:advocateoffice/view/screen/case/case_view/mobile/widget/case_expense_datatabel_tablet.dart';
import 'package:advocateoffice/view/screen/case/case_view/mobile/widget/case_extra_income_datatabel_tablet.dart';
import 'package:advocateoffice/view/screen/case/case_view/mobile/widget/case_history_datatabel_tablet.dart';
import 'package:advocateoffice/view/screen/case/case_view/mobile/widget/payment_history_datatabel.dart';
import 'package:flutter/material.dart';

class CaseViewMobile extends StatelessWidget {
  const CaseViewMobile({
    super.key,
    required this.controller,
    required this.width,
  });

  final CaseViewController controller;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DashboardHeaderMobile(title: 'Case Details'),
      ),
      drawer: NavigationBarViewMobile(), // For mobile navigation
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CaseDetailsMobile(),
                    SizedBox(height: 20),
                    DocumentRowDesktop(controller: controller),
                    SizedBox(height: 20),
                    CaseHistoryTableMobile(controller: controller, width: width),
                    SizedBox(height: 20),
                    PaymentHistoryTableMobile(controller: controller, width: width),
                    SizedBox(height: 20),
                    CaseExpenseTableMobile(controller: controller, width: width),
                    SizedBox(height: 20),
                    CaseExtraIncomeTableMobile(controller: controller, width: width),
                    SizedBox(height: 20),
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
