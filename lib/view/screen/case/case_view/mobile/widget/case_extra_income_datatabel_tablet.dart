import 'package:advocateoffice/controller/ui/case/case_view.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';

import 'package:advocateoffice/view/screen/fee_received/mobile/widgets/add.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseExtraIncomeTableMobile extends StatelessWidget {
  CaseExtraIncomeTableMobile({super.key, required this.controller, required this.width});
  final CaseViewController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchAndAddSectionWidgetMobile(
              searchTap: (searchTap) {},
              buttonTap: () {
                controller.clientNameController.clear();
                controller.clientNumberController.clear();
                controller.feeController.clear();
                controller.commentController.clear();
                Get.to(FeeCreateMobile(controller: controller), routeName: "${RoutesName.caseDetails}/create");
              },
              buttonName: 'Create Income',
              totalData: "",
            ),
            const SizedBox(height: 16),
            Obx(
              () => CommonTableWidget(
                width: width,
                listLength: controller.extraIncomeList.length,
                dataColumn: const [
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "SL")), fixedWidth: 50),
                  DataColumn2(label: CustomTblHeadText(text: "كمية")),
                  DataColumn2(label: CustomTblHeadText(text: "طريقة الدفع")),
                  DataColumn2(label: CustomTblHeadText(text: "تم الإنشاء في")),
                  DataColumn2(label: CustomTblHeadText(text: "تم الإنشاء بواسطة")),
                  DataColumn2(label: CustomTblHeadText(text: "تعليق")),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "إجراءات")), fixedWidth: 100),
                ],
                dataRow: List.generate(
                  controller.extraIncomeList.length,
                  (index) {
                    var data = controller.extraIncomeList[index];
                    return DataRow(cells: [
                      DataCell(CustomSelectableTextWidget(text: "${index + 1}")),
                      DataCell(CustomSelectableTextWidget(text: "${double.parse(data.receivedAmount.toString())} ${currencySymbol}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.paymentMethod}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.createdAt}")),
                      DataCell(
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 5), child: CustomSelectableTextWidget(text: "${data.createdBy}"))),
                      DataCell(CustomSelectableTextWidget(text: "${data.remark}")),
                      DataCell(
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  child: const Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                  onTap: () {
                                    Get.back();
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
          ],
        ),
      ),
    );
  }
}
