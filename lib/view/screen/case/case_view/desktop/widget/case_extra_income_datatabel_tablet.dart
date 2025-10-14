import 'package:advocateoffice/controller/ui/case/case_view.dart';
import 'package:advocateoffice/model/extra_income.dart';
import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'case_history_datatabel_tablet.dart';

class CaseExtraIncomeHistoryTable extends StatelessWidget {
  CaseExtraIncomeHistoryTable({super.key, required this.controller, this.screenType});
  final CaseViewController controller;
  final String? screenType;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableTitleWidget(
              title: "تاريخ الدخل الإضافي",
              buttonName: "إضافة دخل",
              onTap: () {
                _showAddDialog(context: context, title: 'إنشاء دخل إضافي');
              },
            ),
            const SizedBox(height: 16),
            Obx(
                  () => CommonTableWidget(
                width: screenType == "Tablet" ? 1100 : MediaQuery.of(context).size.width - 260,
                listLength: controller.extraIncomeList.length,
                dataColumn: const [
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "م")), fixedWidth: 50),
                  DataColumn2(label: CustomTblHeadText(text: "المبلغ")),
                  DataColumn2(label: CustomTblHeadText(text: "طريقة الدفع")),
                  DataColumn2(label: CustomTblHeadText(text: "تاريخ الإنشاء")),
                  DataColumn2(label: CustomTblHeadText(text: "تم الإنشاء بواسطة")),
                  DataColumn2(label: CustomTblHeadText(text: "ملاحظات")),
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
                      DataCell(Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CustomSelectableTextWidget(text: "${data.createdBy}"),
                      )),
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
                                    _showAddDialog(context: context, title: "تعديل الدخل الإضافي");
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

  void _showAddDialog({required BuildContext context, required String title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: CustomAlertDialogue(
              title: title,
              body: Form(
                key: controller.fromKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            focusNode: FocusNode(),
                            controller: controller.feeController,
                            text: 'مبلغ العميل',
                            hintText: 'أدخل مبلغ العميل',
                            validator: 'من فضلك أدخل مبلغ العميل',
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonDropDown(
                            context: context,
                            label: "اختر طريقة الدفع",
                            value: controller.selectedPaymentType,
                            items: controller.paymentTypeList,
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectedPaymentType.value = value;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CommonField(
                      controller: controller.commentController,
                      minLines: 5,
                      text: 'ملاحظة',
                      hintText: 'أدخل ملاحظة',
                      validator: 'من فضلك أدخل الملاحظة',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              confirmButtonFunction: () async {
                Get.back();
              }),
        );
      },
    );
  }

  void showEditDialog({required BuildContext context, required String title, required ExtraIncomeModel data}) {
    controller.clientNameController.text = data.clientName.toString();
    controller.clientNumberController.text = data.clientPhone.toString();
    controller.feeController.text = data.receivedAmount.toString();
    controller.commentController.text = data.remark.toString();
    controller.caseIdController.text = data.caseID.toString();
    controller.selectedPaymentType.value = data.paymentMethod.toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: CustomAlertDialogue(
              title: title,
              body: Form(
                key: controller.fromKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    CommonField(
                      controller: controller.caseIdController,
                      readOnly: true,
                      text: 'معرّف القضية',
                      hintText: 'أدخل معرف القضية',
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            controller: controller.clientNameController,
                            readOnly: true,
                            text: 'اسم العميل',
                            hintText: 'أدخل اسم العميل',
                            validator: 'من فضلك أدخل اسم العميل',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.clientNumberController,
                            readOnly: true,
                            text: 'رقم هاتف العميل',
                            hintText: 'أدخل رقم هاتف العميل',
                            validator: 'من فضلك أدخل رقم هاتف العميل',
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            controller: controller.feeController,
                            text: 'مبلغ العميل',
                            hintText: 'أدخل مبلغ العميل',
                            validator: 'من فضلك أدخل مبلغ العميل',
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonDropDown(
                            context: context,
                            label: "اختر طريقة الدفع",
                            value: controller.selectedPaymentType,
                            items: controller.paymentTypeList,
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectedPaymentType.value = value;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CommonField(
                      controller: controller.commentController,
                      minLines: 5,
                      text: 'ملاحظة',
                      hintText: 'أدخل ملاحظة',
                      validator: 'من فضلك أدخل الملاحظة',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              confirmButtonFunction: () {
                Get.back();
              }),
        );
      },
    );
  }
}
