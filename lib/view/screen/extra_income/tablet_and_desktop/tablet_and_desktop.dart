import 'package:advocateoffice/controller/ui/extra_income.dart';
import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ExtraIncomeTabletDesktop extends StatelessWidget {
  ExtraIncomeTabletDesktop({super.key, required this.controller, this.width});
  final ExtraIncomeController controller;
  final double? width;

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
                    const DashboardHeader(title: 'دخل إضافي'),
                    const SizedBox(height: 20),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchAndAddSectionWidget(
                              buttonName: 'إضافة دخل إضافي',
                              totalData:
                                  "إجمالي السجلات :  ${controller.extraIncomeList.length}",
                              searchController: controller.searchController,
                              searchTap: (query) {
                                controller.filterExtraFee(query);
                              },
                              buttonTap: () {
                                controller.clientNameController.clear();
                                controller.clientNumberController.clear();
                                controller.feeController.clear();
                                controller.remarkController.clear();
                                _showAddDialog(
                                    context: context, title: 'إنشاء دخل إضافي');
                              },
                            ),
                            const SizedBox(height: 16),
                            Obx(
                              () => CommonTableWidget(
                                width: width ??
                                    MediaQuery.of(context).size.width - 260,
                                listLength: controller.extraIncomeList.length,
                                dataColumn: const [
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(text: "SL")),
                                      fixedWidth: 50),
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(
                                              text: "معرّف القضية")),
                                      fixedWidth: 120),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "معلومات العميل")),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "المبلغ")),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "طريقة الدفع")),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "تاريخ الإنشاء")),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "أنشأ بواسطة")),
                                  DataColumn2(
                                      label:
                                          CustomTblHeadText(text: "ملاحظات")),
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(
                                              text: "إجراءات")),
                                      fixedWidth: 100),
                                ],
                                dataRow: List.generate(
                                  controller.extraIncomeList.length,
                                  (index) {
                                    var data =
                                        controller.extraIncomeList[index];
                                    return DataRow(cells: [
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${index + 1}")),
                                      DataCell(Center(
                                          child: CustomSelectableTextWidget(
                                              text: "${data.caseID}"))),
                                      DataCell(CustomSelectableTextWidget(
                                          text:
                                              "${data.clientName}\n${data.clientPhone}",
                                          maxLine: 2)),
                                      DataCell(CustomSelectableTextWidget(
                                          text:
                                              "${double.parse(data.receivedAmount.toString())} ${currencySymbol}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.paymentMethod}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.createdAt}")),
                                      DataCell(Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: CustomSelectableTextWidget(
                                            text: "${data.createdBy}"),
                                      )),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.remark}", maxLine: 2)),
                                      DataCell(
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  child: const Icon(Icons.edit,
                                                      size: 20),
                                                  onTap: () {
                                                    // showEditDialog(context: context, title: 'تعديل الدخل الإضافي', data: data);
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddDialog({context, required String title}) {
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
                    CommonDropDown(
                      context: context,
                      label: "حدد معرف القضية",
                      value: controller.selectCaseId,
                      items: controller.caseIdList,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectCaseId.value = value;
                        }
                      },
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
                            validator: 'من فضلك، أدخل اسم العميل',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.clientNumberController,
                            readOnly: true,
                            text: 'هاتف العميل',
                            hintText: 'أدخل رقم هاتف العميل',
                            validator: 'من فضلك، أدخل رقم هاتف العميل',
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
                            text: 'مبلغ الرسوم',
                            hintText: 'أدخل مبلغ الرسوم',
                            validator: 'من فضلك، أدخل مبلغ الرسوم',
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
                            label: "حدد طريقة الدفع",
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
                      controller: controller.remarkController,
                      minLines: 5,
                      text: 'ملاحظة',
                      hintText: 'أدخل الملاحظة',
                      validator: 'من فضلك، أدخل الملاحظة',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              confirmButtonFunction: () async {
                // await PaymentReceiptPdf().generateTwoReceipts(
                //   {
                //     "mrNo": "12345",
                //     "date": "2024-12-22",
                //     "name": "Md. Abdullah Al Siddik",
                //     "contact": "01737374083",
                //     "caseId": "CASE1001",
                //     "caseType": "Civil",
                //     "paymentMethod": "Bkash",
                //     "amount": "500000.00",
                //   },
                // );
                Get.back();
              }),
        );
      },
    );
  }
}
