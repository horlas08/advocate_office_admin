import 'package:advocateoffice/controller/ui/extra_income.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/screen/extra_income/mobile/widgets/add.dart';
import 'package:advocateoffice/view/screen/extra_income/mobile/widgets/edit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtraIncomeTableMobile extends StatelessWidget {
  ExtraIncomeTableMobile({super.key, required this.controller, this.width});
  final ExtraIncomeController controller;
  final double? width;

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
                controller.remarkController.clear();
                Get.to(
                    ExtraIncomeCreateMobile(
                      controller: controller,
                    ),
                    routeName: "${RoutesName.extraIncome}/create");
              },
              buttonName: 'Create Income',
              totalData: "",
            ),
            const SizedBox(height: 16),
            Obx(
              () => CommonTableWidget(
                width: width ?? MediaQuery.of(context).size.width - 270,
                listLength: controller.filteredExtraIncomeList.length,
              dataColumn: const [
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(text: "SL")),
                                      fixedWidth: 50),
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(
                                              text: "معرف الحالة")),
                                      fixedWidth: 120),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "معلومات العميل")),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "كمية")),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "طريقة الدفع")),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "تم الإنشاء في")),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "تم الإنشاء بواسطة")),
                                  DataColumn2(
                                      label:
                                          CustomTblHeadText(text: "تعليق")),
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(
                                              text: "عمل")),
                                      fixedWidth: 100),
                                ],
                dataRow: List.generate(
                  controller.filteredExtraIncomeList.length,
                  (index) {
                    var data = controller.filteredExtraIncomeList[index];
                    return DataRow(cells: [
                      DataCell(Center(child: Text((index + 1).toString()))),
                      DataCell(Center(
                        child: Center(
                          child: SelectableText(
                            data.caseID.toString(),
                            autofocus: true,
                          ),
                        ),
                      )),
                      DataCell(Center(
                        child: SelectableText(
                          textAlign: TextAlign.center,
                          "${data.clientName.toString()}\n${data.clientPhone.toString()}",
                          autofocus: true,
                        ),
                      )),
                      DataCell(Center(
                        child: SelectableText(
                          data.remark.toString(),
                          autofocus: true,
                        ),
                      )),
                      DataCell(Center(
                        child: SelectableText(
                          data.paymentMethod.toString(),
                          autofocus: true,
                        ),
                      )),
                      DataCell(Center(
                        child: SelectableText(
                          textAlign: TextAlign.center,
                          data.createdAt.toString(),
                          autofocus: true,
                        ),
                      )),
                      DataCell(Center(
                        child: SelectableText(
                          textAlign: TextAlign.center,
                          data.createdBy.toString(),
                          autofocus: true,
                        ),
                      )),
                      DataCell(Center(
                        child: SelectableText(
                          data.remark.toString(),
                          autofocus: true,
                        ),
                      )),
                      DataCell(Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: const Icon(
                                Icons.edit,
                              ),
                              onTap: () {
                                Get.to(
                                  ExtraIncomeEditMobile(
                                    controller: controller,
                                    data: data,
                                  ),
                                  routeName: "${RoutesName.extraIncome}/edit",
                                );
                              },
                            ),
                          ),
                        ],
                      ))),
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
