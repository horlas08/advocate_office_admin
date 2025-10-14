import 'package:advocateoffice/controller/ui/extra_income.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/extra_income/mobile/widgets/datatabel.dart';

import 'package:flutter/material.dart';

class ExtraIncomeMobile extends StatelessWidget {
  ExtraIncomeMobile({super.key, required this.controller, this.width});
  final ExtraIncomeController controller;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'Extra Received'),
     
      ),
      drawer: NavigationBarViewMobile(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExtraIncomeTableMobile(
                    controller: controller,
                    width: width,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
