import 'package:advocateoffice/controller/ui/expense.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/expense/mobile/mobile.dart';
import 'package:advocateoffice/view/screen/expense/tablet_and_desktop/tablet_and_desktop.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseScreen extends StatelessWidget {
  ExpenseScreen({super.key});
  final ExpenseController controller = Get.put(ExpenseController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: ExpenseTabletDesktop(controller: controller),
          tablet: ExpenseTabletDesktop(controller: controller, width: 1500),
          phone: ExpenseMobile(controller: controller,  width: 1200),
        ),
      ),
    );
  }
}
