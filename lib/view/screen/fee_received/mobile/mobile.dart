import 'dart:math';

import 'package:advocateoffice/controller/ui/fee_received.dart';
import 'package:advocateoffice/controller/ui/payment_invoice/monye.dart';
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/screen/fee_received/mobile/widgets/add.dart';
import 'package:advocateoffice/view/screen/fee_received/mobile/widgets/edit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeeReceivedMobile extends StatelessWidget {
  FeeReceivedMobile({super.key, required this.controller, this.width});
  final FeeReceivedController controller;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'الرسوم المستلمة'),
      ),
      drawer: NavigationBarViewMobile(),
      body: Obx(() => controller.isLoading.isTrue
          ? DashboardShimmer()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
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
                                  FeeCreateMobile(
                                    controller: controller,
                                  ),
                                  routeName:
                                      "${RoutesName.feeReceived}/create");
                            },
                            buttonName: 'إضافة دفعة',
                            totalData: "",
                          ),
                          const SizedBox(height: 16),
                          Obx(
                            () => CommonTableWidget(
                              width: width ??
                                  MediaQuery.of(context).size.width - 260,
                              listLength:
                                  controller.filteredFeeReceivedList.length,
                              dataColumn: const [
                                DataColumn2(
                                    label: Center(
                                        child: CustomTblHeadText(text: "م")),
                                    fixedWidth: 50),
                                DataColumn2(
                                    label: Center(
                                        child: CustomTblHeadText(
                                            text: "رقم القضية")),
                                    fixedWidth: 120),
                                DataColumn2(
                                    label:
                                        CustomTblHeadText(text: "نوع الرسوم"),
                                    fixedWidth: 150),
                                DataColumn2(
                                    label: CustomTblHeadText(
                                        text: "معلومات العميل")),
                                DataColumn2(
                                    label: CustomTblHeadText(text: "المبلغ")),
                                DataColumn2(
                                    label:
                                        CustomTblHeadText(text: "طريقة الدفع")),
                                DataColumn2(
                                    label: CustomTblHeadText(
                                        text: "تاريخ الإنشاء")),
                                DataColumn2(
                                    label: CustomTblHeadText(text: "أنشأه")),
                                DataColumn2(
                                    label: CustomTblHeadText(text: "ملاحظات")),
                                DataColumn2(
                                    label: Center(
                                        child:
                                            CustomTblHeadText(text: "إجراءات")),
                                    fixedWidth: 120),
                              ],
                              dataRow: List.generate(
                                controller.filteredFeeReceivedList.length,
                                (index) {
                                  var data =
                                      controller.filteredFeeReceivedList[index];
                                  return DataRow(
                                    cells: [
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${index + 1}")),
                                      DataCell(Center(
                                          child: CustomSelectableTextWidget(
                                              text: "${data.caseID}"))),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.incomeType}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text:
                                              "${data.clientName}\n${data.clientPhone}",
                                          maxLine: 2)),
                                      DataCell(CustomSelectableTextWidget(
                                          text:
                                              "${data.receivedAmount?.toStringAsFixed(2)} ${currencySymbol}")),
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
                                          text: "${data.remark}")),
                                      DataCell(
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  child: const Icon(
                                                    Icons.remove_red_eye,
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
                                                child: GestureDetector(
                                                  child: const Icon(
                                                    Icons.edit,
                                                    size: 20,
                                                  ),
                                                  onTap: () {
                                                    Get.to(
                                                        FeeEditMobile(
                                                          controller:
                                                              controller,
                                                          data: data,
                                                        ),
                                                        routeName:
                                                            '${RoutesName.feeReceived}/edit');
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: controller
                                                        .isDownloadLoading
                                                        .isTrue
                                                    ? Icon(Icons.downloading)
                                                    : InkWell(
                                                        child: Icon(
                                                          Icons.download,
                                                          size: 20,
                                                        ),
                                                        onTap: () async {
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
                                                child: GestureDetector(
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 20,
                                                    color: AppColors.errorColor,
                                                  ),
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          CustomAlertDialogue(
                                                        title: "تأكيد الحذف",
                                                        body: CustomTextWidget(
                                                            text:
                                                                "هل أنت متأكد من حذف هذه الدفعة؟"),
                                                        confirmButtonName:
                                                            "حذف",
                                                        confirmButtonFunction:
                                                            () {
                                                          controller
                                                              .deleteFeeReceived(
                                                            id: data.caseID
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
                  const SizedBox(height: 20),
                ],
              ),
            )),
    );
  }
}
