import 'dart:developer';

import 'package:advocateoffice/controller/ui/clients/clients_view.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:advocateoffice/view/screen/clients/clients_view/tablet_and_desktop/widgets/header.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsViewTabletDesktop extends StatelessWidget {
  const ClientsViewTabletDesktop({super.key, required this.controller, this.width});
  final ClientViewController controller;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBarView(),
          Expanded(
            child: Obx(
              () => controller.isLoading.isTrue
                  ? DashboardShimmer()
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DashboardHeader(
                              title: 'Client Details',
                            ),
                            const SizedBox(height: 20),
                            ClientsViewHeaderDesktop(),
                            const SizedBox(height: 20),
                            Card(
                               child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(
                                  () => CommonTableWidget(
                                    width: width ?? MediaQuery.of(context).size.width - 260,
                                    listLength: controller.caseList.length,
                                    dataColumn: const [
                                      DataColumn2(label: Center(child: CustomTblHeadText(text: "SL")), fixedWidth: 50),
                                      DataColumn2(label: Center(child: CustomTblHeadText(text: "معرف الحالة")), fixedWidth: 120),
                                       DataColumn2(label: CustomTblHeadText(text: "نوع العميل")),
                                      DataColumn2(label: CustomTblHeadText(text: "نوع الحالة")),
                                      DataColumn2(label: CustomTblHeadText(text: "قسم الحالة")),
                                      DataColumn2(label: CustomTblHeadText(text: "مرحلة القضية")),
                                      DataColumn2(label: CustomTblHeadText(text: "حالة")),
                                      DataColumn2(label: CustomTblHeadText(text: "أفضلية")),
                                      DataColumn2(label: CustomTblHeadText(text: "تعليق")),
                                      DataColumn2(label: Center(child: CustomTblHeadText(text: "عمل")), fixedWidth: 120),
                                    ],
                                    dataRow: List.generate(
                                      controller.caseList.length,
                                      (index) {
                                        var data = controller.caseList[index];
                                        return DataRow(cells: [
                                          DataCell(Center(child: CustomSelectableTextWidget(text: "${index + 1}"))),
                                          DataCell(Center(child: CustomSelectableTextWidget(text: "${data.caseID.toString()}"))),
                                           DataCell(CustomSelectableTextWidget(text: "${data.clientType.toString()}")),
                                          DataCell(CustomSelectableTextWidget(text: "${data.caseType.toString()}")),
                                          DataCell(CustomSelectableTextWidget(text: "${data.section.toString().replaceAll("[", "").replaceAll("]", "")}")),
                                          DataCell(CustomSelectableTextWidget(text: "${data.caseStage.toString()}")),
                                          DataCell(CustomSelectableTextWidget(text: "${data.status.toString()}")),
                                          DataCell(CustomSelectableTextWidget(text: "${data.priority.toString()}")),
                                          DataCell(CustomSelectableTextWidget(text: "${data.remark.toString()}")),
                                          DataCell(
                                            Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      child: const Icon(
                                                        Icons.remove_red_eye,
                                                      ),
                                                      onTap: () {
                                                        log("===================${Get.currentRoute}${RoutesName.caseDetails}/${data.caseID}");
                                                          Get.toNamed("${Get.currentRoute}${RoutesName.caseDetails}/${data.caseID}");
                                                       },
                                                    ),
                                                  ),
                                                
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
