import 'package:advocateoffice/controller/ui/case/case_list.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
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
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CaseListTabletDesktop extends StatelessWidget {
  CaseListTabletDesktop({super.key, required this.controller, this.width});
  final CaseListController controller;
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
                            const DashboardHeader(title: 'قائمة القضايا'),
                            const SizedBox(height: 20),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SearchAndAddSectionWidget(
                                      buttonName: 'أضف حالة',
                                      totalData:
                                          "إجمالي الحالات :  ${controller.caseList.length}",
                                      searchController:
                                          controller.searchController,
                                      searchTap: (query) {
                                        controller.filterCase(query);
                                      },
                                      buttonTap: () {
                                        Get.toNamed(RoutesName.caseCreate);
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    Obx(
                                      () => CommonTableWidget(
                                        width: width ??
                                            MediaQuery.of(context).size.width -
                                                260,
                                        listLength:
                                            controller.filteredCaseList.length,
                                        dataColumn: const [
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "SL")),
                                              fixedWidth: 50),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "معرّف القضية")),
                                              fixedWidth: 120),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "معلومات العميل"))),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "نوع العميل"))),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "نوع القضية")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "مرحلة القضية")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "الحالة")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "الأولوية")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "ملاحظة")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "مخصص إلى")),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "إجراءات")),
                                              fixedWidth: 120),
                                        ],
                                        dataRow: List.generate(
                                          controller.filteredCaseList.length,
                                          (index) {
                                            var data = controller
                                                .filteredCaseList[index];
                                            return DataRow(
                                              cells: [
                                                DataCell(Center(
                                                    child:
                                                        CustomSelectableTextWidget(
                                                            text:
                                                                "${index + 1}"))),
                                                DataCell(Center(
                                                    child: CustomSelectableTextWidget(
                                                        text:
                                                            "${data.caseID.toString()}"))),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.clientName}\n${data.clientPhone}")),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.clientType.toString()}")),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.caseType.toString()}")),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.caseStage.toString()}")),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.status.toString()}")),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.priority.toString()}")),
                                                DataCell(CustomSelectableTextWidget(
                                                    text:
                                                        "${data.remark.toString()}")),
                                                DataCell(
                                                    CustomSelectableTextWidget(
                                                        text: "Jhon Doe")),
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
                                                            child: const Icon(Icons
                                                                .remove_red_eye),
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  '${Get.currentRoute}${RoutesName.caseDetails}/${data.caseID}');
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            child: Icon(Icons
                                                                .work_outline),
                                                            onTap: () {
                                                              buildShowDialog(
                                                                  context:
                                                                      context);
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
                            SizedBox(height: 20)
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

  Future<dynamic> buildShowDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => CustomAlertDialogue(
        title: "تعيين القضية إلى محامٍ آخر",
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: CommonDropDown(
                context: context,
                label: "اختر محامياً",
                value: controller.selectEmployee,
                items: controller.employeeList,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectEmployee.value = value;
                    controller.selectedEmployeeList.add(value);
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: controller.selectedEmployeeList.map(
                  (id) {
                    return Chip(
                      label: CustomTextWidget(text: id, fontSize: 14),
                      deleteIcon: Icon(Icons.delete_forever),
                      onDeleted: () {
                        controller.selectedEmployeeList.remove(id);
                      },
                    );
                  },
                ).toList(),
              ),
            )
          ],
        ),
        confirmButtonFunction: () {
          if (controller.selectedEmployeeList.isEmpty) {
            EasyLoading.showError("الرجاء تعيين محامٍ.");
            return;
          }
          Get.back();
        },
      ),
    );
  }
}
