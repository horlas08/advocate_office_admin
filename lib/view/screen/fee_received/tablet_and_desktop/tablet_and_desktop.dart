import 'dart:math';

import 'package:advocateoffice/controller/ui/fee_received.dart';
import 'package:advocateoffice/controller/ui/payment_invoice/monye.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class FeeReceivedTabletDesktop extends StatelessWidget {
  FeeReceivedTabletDesktop({super.key, required this.controller, this.width});
  final FeeReceivedController controller;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBarView(),
          Obx(
            () => Expanded(
              child: controller.isLoading.isTrue
                  ? DashboardShimmer()
                  : Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DashboardHeader(title: 'الرسوم المستلمة'),
                            const SizedBox(height: 20),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SearchAndAddSectionWidget(
                                      buttonName: 'إضافة دفعة',
                                      totalData:
                                          "إجمالي الرسوم المستلمة :  ${controller.feeReceivedList.length}",
                                      searchController:
                                          controller.searchController,
                                      searchTap: (query) {
                                        controller.filter(query);
                                      },
                                      buttonTap: () {
                                        controller.selectCaseId.value = "";
                                        controller.selectedPaymentType.value =
                                            "";
                                        controller.clientNameController.clear();
                                        controller.clientNumberController
                                            .clear();
                                        controller.feeController.clear();

                                        _showDialog(
                                            context: context,
                                            isAddSection: true);
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    Obx(
                                      () => CommonTableWidget(
                                        width: width ??
                                            MediaQuery.of(context).size.width -
                                                260,
                                        listLength: controller
                                            .filteredFeeReceivedList.length,
                                        dataColumn: const [
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "م")),
                                              fixedWidth: 50),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "رقم القضية")),
                                              fixedWidth: 120),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "نوع الرسوم"),
                                              fixedWidth: 150),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "معلومات العميل")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "المبلغ")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "طريقة الدفع")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "تاريخ الإنشاء")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "أنشأه")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "ملاحظات")),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "إجراءات")),
                                              fixedWidth: 120),
                                        ],
                                        dataRow: List.generate(
                                          controller
                                              .filteredFeeReceivedList.length,
                                          (index) {
                                            var data = controller
                                                .filteredFeeReceivedList[index];
                                            return DataRow(
                                              cells: [
                                                DataCell(
                                                    CustomSelectableTextWidget(
                                                        text: "${index + 1}")),
                                                DataCell(Center(
                                                    child: CustomSelectableTextWidget(
                                                        text:
                                                            "${data.caseID}"))),
                                                DataCell(
                                                    CustomSelectableTextWidget(
                                                        text:
                                                            "${data.incomeType}")),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.clientName}\n${data.clientPhone}",
                                                    maxLine: 2)),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.receivedAmount?.toStringAsFixed(2)} ${currencySymbol}")),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.paymentMethod}")),
                                                DataCell(
                                                    CustomSelectableTextWidget(
                                                        text:
                                                            "${data.createdAt}")),
                                                DataCell(Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: CustomSelectableTextWidget(
                                                      text:
                                                          "${data.createdBy}"),
                                                )),
                                                DataCell(
                                                    CustomSelectableTextWidget(
                                                        text:
                                                            "${data.remark}")),
                                                DataCell(
                                                  Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            child: const Icon(
                                                              Icons
                                                                  .remove_red_eye,
                                                              size: 20,
                                                            ),
                                                            onTap: () {
                                                              Get.toNamed(
                                                                "${Get.currentRoute}${RoutesName.caseDetails}/${data.caseID}",
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            child: const Icon(
                                                              Icons.edit,
                                                              size: 20,
                                                            ),
                                                            onTap: () {
                                                              controller
                                                                  .clientNameController
                                                                  .text = data
                                                                      .clientName ??
                                                                  "";
                                                              controller
                                                                  .clientNumberController
                                                                  .text = data
                                                                      .clientPhone ??
                                                                  "";
                                                              controller
                                                                      .feeController
                                                                      .text =
                                                                  data.receivedAmount
                                                                      .toString();
                                                              _showDialog(
                                                                context:
                                                                    context,
                                                                isAddSection:
                                                                    false,
                                                                id: data.caseID
                                                                    .toString(),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: controller
                                                                  .isDownloadLoading
                                                                  .isTrue
                                                              ? Icon(Icons
                                                                  .downloading)
                                                              : InkWell(
                                                                  child: Icon(
                                                                    Icons
                                                                        .download,
                                                                    size: 20,
                                                                  ),
                                                                  onTap:
                                                                      () async {
                                                                    controller
                                                                        .isDownloadLoading
                                                                        .value = true;

                                                                    await PaymentReceiptPdf()
                                                                        .generateTwoReceipts(
                                                                      {
                                                                        "mrNo": Random()
                                                                            .nextInt(1000)
                                                                            .toString(),
                                                                        "date": data
                                                                            .createdAt
                                                                            .toString(),
                                                                        "name": data
                                                                            .clientName
                                                                            .toString(),
                                                                        "contact": data
                                                                            .clientPhone
                                                                            .toString(),
                                                                        "caseId": data
                                                                            .caseID
                                                                            .toString(),
                                                                        "caseType":
                                                                            "Civil",
                                                                        "paymentMethod": data
                                                                            .paymentMethod
                                                                            .toString(),
                                                                        "amount": data
                                                                            .receivedAmount
                                                                            .toString(),
                                                                      },
                                                                    );
                                                                    // await Future.delayed(Duration(seconds: 2));
                                                                    controller
                                                                        .isDownloadLoading
                                                                        .value = false;
                                                                  },
                                                                ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            child: Icon(
                                                              Icons.delete,
                                                              size: 20,
                                                              color: AppColors
                                                                  .errorColor,
                                                            ),
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        CustomAlertDialogue(
                                                                  title:
                                                                      "تأكيد الحذف",
                                                                  body: CustomTextWidget(
                                                                      text:
                                                                          "هل أنت متأكد من حذف هذه الدفعة؟"),
                                                                  confirmButtonName:
                                                                      "حذف",
                                                                  confirmButtonFunction:
                                                                      () {
                                                                    controller
                                                                        .deleteFeeReceived(
                                                                      id: data
                                                                          .caseID
                                                                          .toString(),
                                                                    );
                                                                    Get.back();
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        )
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
                            ),
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

  void _showDialog(
      {required BuildContext context, required bool isAddSection, String? id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: CustomAlertDialogue(
            title: isAddSection ? 'إضافة دفعة' : 'تعديل دفعة',
            body: Form(
              key: controller.fromKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonDropDown(
                    context: context,
                    label: "اختر رقم القضية",
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
                          validator: 'الرجاء إدخال اسم العميل',
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
                          validator: 'الرجاء إدخال رقم هاتف العميل',
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
                          validator: 'الرجاء إدخال مبلغ الرسوم',
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
                          borderColor: controller.isDropdownError.isTrue
                              ? Colors.red
                              : null,
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectedPaymentType.value = value;
                              controller.isDropdownError.value = false;
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
                    text: 'تعليق',
                    hintText: 'أدخل تعليقًا',
                    validator: 'الرجاء إدخال تعليق',
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            confirmButtonFunction: () {
              if (!controller.fromKey.currentState!.validate()) {
                controller.fromKey.currentState!.validate();
                return;
              }
              if (controller.selectCaseId.value == "") {
                controller.isDropdownError.value = true;
                return;
              }
              isAddSection
                  ? controller.addFeeReceived()
                  : controller.updateFeeReceived(id: id.toString());
              Get.back();
            },
          ),
        );
      },
    );
  }
}
