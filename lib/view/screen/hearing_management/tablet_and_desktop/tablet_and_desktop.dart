import 'dart:developer';
import 'package:advocateoffice/controller/ui/hearing_management.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/date_picker.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HearingManagementTabletDesktop extends StatelessWidget {
  const HearingManagementTabletDesktop(
      {super.key, required this.controller, this.width});
  final HearingManagementController controller;
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
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DashboardHeader(title: 'إدارة الجلسات'),
                            const SizedBox(height: 20),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SearchAndAddSectionWidget(
                                      buttonName: 'إضافة جلسة',
                                      totalData:
                                          "إجمالي الجلسات القادمة :  ${controller.filteredHearingList.length}",
                                      searchTap: (query) {
                                        controller.filter(query);
                                      },
                                      buttonTap: () {
                                        controller.selectCaseId.value = "";
                                        controller.selectedCourt.value = "";
                                        controller.clientNameController.clear();
                                        controller.commentController.clear();
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
                                            .filteredHearingList.length,
                                        dataColumn: [
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "م")),
                                              fixedWidth: 50),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "رقم القضية"),
                                              fixedWidth: 120),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "التاريخ والوقت")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "العميل")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "نوع القضية")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "المحكمة")),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "إعلام؟"))),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "ملاحظات")),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "إجراءات")),
                                              fixedWidth: 100),
                                        ],
                                        dataRow: List.generate(
                                          controller.filteredHearingList.length,
                                          (index) {
                                            var data = controller
                                                .filteredHearingList[index];
                                            return DataRow(
                                              cells: [
                                                DataCell(
                                                    CustomSelectableTextWidget(
                                                        text: "${index + 1}")),
                                                DataCell(
                                                    CustomSelectableTextWidget(
                                                        text:
                                                            "${data.caseID}")),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.hearingDate}")),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.clientName}\n${data.clientPhone}")),
                                                DataCell(
                                                    CustomSelectableTextWidget(
                                                        text:
                                                            "${data.caseType}")),
                                                DataCell(
                                                    CustomSelectableTextWidget(
                                                        text:
                                                            "${data.courtType}")),
                                                DataCell(Center(
                                                    child:
                                                        CustomSelectableTextWidget(
                                                            text:
                                                                data.informClient!
                                                                    ? "نعم"
                                                                    : "لا"))),
                                                DataCell(
                                                    CustomSelectableTextWidget(
                                                        text: "${data.remark}",
                                                        maxLine: 2)),
                                                DataCell(
                                                  Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: data
                                                                  .informClient!
                                                              ? Icon(Icons
                                                                  .done_all)
                                                              : InkWell(
                                                                  child: const Icon(
                                                                      Icons
                                                                          .message,
                                                                      size: 20),
                                                                  onTap: () {
                                                                    buildSMSDialogue(
                                                                        context);
                                                                  },
                                                                ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            child: const Icon(
                                                                Icons
                                                                    .remove_red_eye,
                                                                size: 20),
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  "${Get.currentRoute}${RoutesName.caseDetails}/${data.caseID}");
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            child: const Icon(
                                                                Icons.edit,
                                                                size: 20),
                                                            onTap: () {
                                                              _showDialog(
                                                                  context:
                                                                      context,
                                                                  isAddSection:
                                                                      false);
                                                            },
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
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> buildSMSDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialogue(
          title: "تأكيد",
          body: CustomTextWidget(
            text:
                "هل تريد إرسال رسالة نصية إلى العميل بخصوص الجلسة في الوقت المحدد؟",
            fontSize: 16,
            maxLine: 3,
          ),
          confirmButtonFunction: () {
            EasyLoading.showSuccess("تم إرسال الرسالة بنجاح");
            Get.back();
          },
        );
      },
    );
  }

  void _showDialog(
      {required BuildContext context, required bool isAddSection, String? id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogue(
          title: isAddSection
              ? 'إضافة تاريخ ووقت الجلسة'
              : 'تعديل تاريخ ووقت الجلسة',
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
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
                      borderColor:
                          controller.isDropdownError.isTrue ? Colors.red : null,
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
                      spacing: 16,
                      children: [
                        Expanded(
                          child: SfDatePickerWidget(
                            selectedDate: controller.selectedDate,
                            title: 'اختر تاريخ الجلسة',
                            maxDate: DateTime(2030),
                            onSelectionChanged: (args) {
                              if (args.value is DateTime) {
                                controller.updateSelectedDate(args.value);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        Obx(
                          () => Expanded(
                            child: CommonDropDown(
                              context: context,
                              label: "اختر المحكمة",
                              value: controller.selectedCourt,
                              items: controller.courtList,
                              borderColor: controller.isDropdownError.isTrue
                                  ? Colors.red
                                  : null,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.selectedCourt.value = value;
                                  log("message :${controller.selectedCourt.value}");
                                  controller.isDropdownError.value = false;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CommonField(
                      controller: controller.commentController,
                      text: 'ملاحظة',
                      minLines: 5,
                      hintText: 'اكتب بعض النص......',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          confirmButtonFunction: () {
            if (!controller.fromKey.currentState!.validate()) {
              controller.fromKey.currentState!.validate();
              return;
            }
            if (controller.selectedCourt.value == "") {
              controller.isDropdownError.value = true;
              return;
            }
            isAddSection
                ? controller.addHearingManagement()
                : controller.updateHearingManagement(id: id.toString());
            Get.back();
          },
        );
      },
    );
  }
}
