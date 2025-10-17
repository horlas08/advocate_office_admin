import 'dart:math';
import 'package:advocateoffice/controller/ui/case/case_view.dart';
import 'package:advocateoffice/controller/ui/payment_invoice/monye.dart';
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

class PaymentHistoryTableDesktop extends StatelessWidget {
  PaymentHistoryTableDesktop({super.key, required this.controller, this.screenType});
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
              title: "تاريخ الدفع",
              buttonName: "إضافة الدفع",
              onTap: () {
                _showAddDialog(context: context, title: "إضافة الدفع");
              },
            ),
            const SizedBox(height: 16),
            Obx(
              () => CommonTableWidget(
                width: screenType == "Tablet" ? 1100 : MediaQuery.of(context).size.width - 260,
                listLength: controller.paymentList.length,
                dataColumn: const [
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "SL")), fixedWidth: 50),
                  DataColumn2(label: CustomTblHeadText(text: "كمية")),
                  DataColumn2(label: CustomTblHeadText(text: "طريقة الدفع")),
                  DataColumn2(label: CustomTblHeadText(text: "تم الإنشاء في")),
                  DataColumn2(label: CustomTblHeadText(text: "تم الإنشاء بواسطة")),
                  DataColumn2(label: CustomTblHeadText(text: "تعليق")),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "إجراءات")), fixedWidth: 120),
                ],
                dataRow: List.generate(
                  controller.paymentList.length,
                  (index) {
                    var data = controller.paymentList[index];
                    return DataRow(
                      cells: [
                        DataCell(CustomSelectableTextWidget(text: "${index + 1}")),
                        DataCell(CustomSelectableTextWidget(text: "${data.receivedAmount!.toStringAsFixed(2)} ${currencySymbol}")),
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
                                  child: InkWell(
                                    child: const Icon(
                                      Icons.edit,
                                      size: 20,
                                    ),
                                    onTap: () {
                                      _showAddDialog(context: context, title: "إضافة الدفع");
                                    },
                                  ),
                                ),
                                Obx(
                                  () => controller.isDownloadLoading.isTrue
                                      ? Expanded(child: SizedBox(height: 20, width: 20, child: Icon(Icons.downloading)))
                                      : Expanded(
                                          child: InkWell(
                                            child: Icon(
                                              Icons.download,
                                              size: 20,
                                            ),
                                            onTap: () async {
                                              controller.isDownloadLoading.value = true;
                                              await PaymentReceiptPdf().generateTwoReceipts(
                                                {
                                                  "mrNo": Random().nextInt(1000).toString(),
                                                  "date": data.createdAt.toString(),
                                                  "name": data.clientName.toString(),
                                                  "contact": data.clientPhone.toString(),
                                                  "caseId": data.caseID.toString(),
                                                  "caseType": "Civil",
                                                  "paymentMethod": data.paymentMethod.toString(),
                                                  "amount": data.receivedAmount.toString(),
                                                },
                                              );
                                              controller.isDownloadLoading.value = false;
                                            },
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
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
        return CustomAlertDialogue(
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
                          controller: controller.caseIdController,
                          text: 'معرّف القضية',
                          hintText: 'أدخل معرف القضية',
                          validator: 'الرجاء إدخال معرف القضية',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CommonField(
                          controller: controller.amountController,
                          text: 'كمية',
                          hintText: 'أدخل المبلغ',
                          validator: 'من فضلك، أدخل المبلغ',
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
                        child: CommonDropDown(
                          context: context,
                          label: "حدد نوع الدفع",
                          value: controller.selectedPaymentType,
                          items: controller.paymentTypeList,
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectedPaymentType.value = value;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CommonField(
                          controller: controller.commentController,
                          text: 'تعليق',
                          hintText: 'أدخل التعليق',
                          validator: 'من فضلك أدخل التعليق',
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            confirmButtonFunction: () {});
      },
    );
  }
}
