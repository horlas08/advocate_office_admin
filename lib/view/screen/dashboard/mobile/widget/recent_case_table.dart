import 'package:advocateoffice/controller/ui/dashboard.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResentCaseMobile extends StatelessWidget {
  ResentCaseMobile({super.key, required this.controller, required this.width});
  final TextEditingController searchController = TextEditingController();
  final DashboardController controller;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            SearchAndAddSectionWidgetMobile(
              isButtonEnable: false,
              searchTap: (searchTap) {},
              buttonTap: () {},
              buttonName: "",
              totalData: "قضية اليوم",
            ),
            SizedBox(height: 17),
            Obx(
              () => CommonTableWidget(
                width: width,
                listLength: controller.resentCaseList.length,
                dataColumn: const [
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "SL")), fixedWidth: 50),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "معرف الحالة")), fixedWidth: 120),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "معلومات العميل"))),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "نوع العميل"))),
                  DataColumn2(label: CustomTblHeadText(text: "نوع الحالة")),
                  DataColumn2(label: CustomTblHeadText(text: "مرحلة القضية")),
                  DataColumn2(label: CustomTblHeadText(text: "حالة")),
                  DataColumn2(label: CustomTblHeadText(text: "أفضلية")),
                  DataColumn2(label: CustomTblHeadText(text: "تعليق")),
                ],
                dataRow: List.generate(
                  controller.resentCaseList.length,
                  (index) {
                    var data = controller.resentCaseList[index];
                    return DataRow(cells: [
                      DataCell(Center(child: CustomSelectableTextWidget(text: "${index + 1}"))),
                      DataCell(Center(child: CustomSelectableTextWidget(text: "${data.caseID.toString()}"))),
                      DataCell(CustomSelectableTextWidget(text: "${data.clientName}\n${data.clientPhone}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.clientType.toString()}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.caseType.toString()}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.caseStage.toString()}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.status.toString()}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.priority.toString()}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.remark.toString()}")),
                    ]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
