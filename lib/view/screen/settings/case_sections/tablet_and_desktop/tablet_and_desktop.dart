import 'dart:developer';
import 'package:advocateoffice/controller/ui/settings/case_sections.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseSectionTableTabletDesktop extends StatelessWidget {
  const CaseSectionTableTabletDesktop({super.key, required this.controller, this.width});
  final CaseSectionsController controller;
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
                            const DashboardHeader(title: 'Case Section'),
                            const SizedBox(height: 20),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SearchAndAddSectionWidget(
                                      buttonName: 'إضافة قسم',
                                      totalData: "إجمالي قسم الحالة: ${controller.caseSectionList.length}",
                                      searchController: controller.searchController,
                                      searchTap: (query) {},
                                      buttonTap: () {
                                        controller.selectCaseCategory.value = "";
                                        controller.caseSectionDetails.clear();
                                        controller.caseSectionCode.clear();
                                        showAddDialog(context: context, isAddSection: true);
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    Obx(
                                      () => CommonTableWidget(
                                        width: width ?? MediaQuery.of(context).size.width - 260,
                                        listLength: controller.caseSectionList.length,
                                        dataColumn: const [
                                          DataColumn2(label: Center(child: CustomTblHeadText(text: "SL")), fixedWidth: 50),
                                          DataColumn2(label: CustomTblHeadText(text: "فئة الحالة")),
                                          DataColumn2(label: CustomTblHeadText(text: "قسم الحالة")),
                                          DataColumn2(label: CustomTblHeadText(text: "تفاصيل القضية")),
                                          DataColumn2(label: Center(child: CustomTblHeadText(text: "عمل")), fixedWidth: 100),
                                        ],
                                        dataRow: List.generate(
                                          controller.caseSectionList.length,
                                          (index) {
                                            var data = controller.caseSectionList[index];
                                            return DataRow(cells: [
                                              DataCell(CustomSelectableTextWidget(text: "${index + 1}")),
                                              DataCell(CustomSelectableTextWidget(text: "${data.caseCategory}")),
                                              DataCell(CustomSelectableTextWidget(text: "${data.caseSection}")),
                                              DataCell(CustomSelectableTextWidget(text: "${data.details}")),
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
                                                            controller.selectCaseCategory.value = data.caseCategory!;
                                                            controller.caseSectionDetails.text = data.details!;
                                                            controller.caseSectionCode.text = data.caseSection!;
                                                            showAddDialog(context: context, isAddSection: false);
                                                          },
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: GestureDetector(
                                                          child: const Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                            size: 20,
                                                          ),
                                                          onTap: () {},
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

  void showAddDialog({required BuildContext context, required bool isAddSection, int? id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogue(
          title:  isAddSection ? 'Add Case Section' : "Edit Case Section",
          body: Container(
            width: 700,
            padding: const EdgeInsets.all(24),
            child: Form(
              key: controller.fromKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonField(
                    controller: controller.caseSectionCode,
                    text: 'Case Section Code',
                    hintText: 'Enter Case Section code here.',
                    validator: "Case Section code can't Empty.!",
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 16),
                  CommonField(
                    controller: controller.caseSectionDetails,
                    text: 'Case Section Details',
                    hintText: 'Enter Case Section Details.',
                    validator: "Case Section Details can't Empty.!",
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Obx(
                        () => Expanded(
                          child: Container(
                            child: CommonDropDown(
                              context: context,
                              label: "Select Case Category",
                              value: controller.selectCaseCategory,
                              items: controller.caseCategoryList,
                              borderColor: controller.isDropdownError.isTrue ? Colors.red : null,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.selectCaseCategory.value = value;
                                  log("message :${controller.selectCaseCategory.value}");
                                  controller.isDropdownError.value = false;
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          confirmButtonFunction: () {
            if (!controller.fromKey.currentState!.validate()) {
              controller.fromKey.currentState!.validate();
              return;
            }
            if (controller.selectCaseCategory.value == "") {
              controller.isDropdownError.value = true;
              return;
            }
            isAddSection ? controller.addCaseSection() : controller.updateCaseSection(id: id ?? 0);
            Get.back();
          },
        );
      },
    );
  }
}
