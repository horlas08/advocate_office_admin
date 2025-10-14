import 'package:advocateoffice/controller/ui/task/case_task.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/date_picker.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:advocateoffice/view/screen/my_task/case_task/desktop/widget/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CaseTaskTabletDesktop extends StatelessWidget {
  CaseTaskTabletDesktop(
      {super.key,
      required this.controller,
      this.width,
      this.childAspectRatio,
      this.crossAxisCount});
  final CaseTaskController controller;
  final double? width;
  final double? childAspectRatio;
  final int? crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBarView(),
          Obx(
            () => controller.isLoading.isTrue
                ? Expanded(child: DashboardShimmer())
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DashboardHeader(title: 'المهام'),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                clipBehavior: Clip.hardEdge,
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 20,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    width: 300,
                                    child: CommonDropDown(
                                        context: context,
                                        label: "اختر الموظف",
                                        value: controller.selectedEmployee,
                                        items: controller.employeeList,
                                        onChanged: (value) {
                                          controller.selectedEmployee.value =
                                              value!;
                                        }),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomTextWidget(
                                          text: "مد. مامون إسلام",
                                          fontSize: 20,
                                        ),
                                        CustomTextWidget(
                                          text: "مطوِّر فلاتر",
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                        ),
                                        CustomTextWidget(text: "01761810531"),
                                        CustomTextWidget(
                                            text: "mail123@gmail.com"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButtonWidget(
                                  vertical: 13,
                                  buttonColor: Colors.white,
                                  textColor: Theme.of(context).primaryColor,
                                  buttonName: "إنشاء مهمة",
                                  onTap: () {
                                    showAddDialog(
                                        context: context, title: "إنشاء مهمة");
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount ?? 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: childAspectRatio ?? 1.5,
                                ),
                                itemCount: controller.caseTaskList.length,
                                itemBuilder: (context, index) {
                                  return CaseTaskCardDesktopTablet(
                                    data: controller.caseTaskList[index],
                                    controller: controller,
                                  );
                                },
                              ),
                            )
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

  void showAddDialog({
    required BuildContext context,
    required String title,
  }) {
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
                    CommonDropDown(
                      context: context,
                      label: "Select Case ID",
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
                            text: 'Client Name',
                            hintText: 'Enter client name',
                            validator: 'Please, Enter client name',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.clientNumberController,
                            readOnly: true,
                            text: 'Client Phone Number',
                            hintText: 'Enter client phone number',
                            validator: 'Please ,Enter client phone number',
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
                            label: "Priority",
                            value: controller.selectPriority,
                            items: controller.priorityList,
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectPriority.value = value;
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: SfDatePickerWidget(
                            selectedDate: controller.selectedFromDate,
                            title: 'Select Hearing Date',
                            maxDate: DateTime(2030),
                            onSelectionChanged: (args) {
                              if (args.value is DateTime) {
                                controller.selectedFromDate(args.value);
                                Navigator.pop(context);
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
                      text: 'Your Note',
                      hintText: 'Write some notes',
                      keyboardType: TextInputType.text,
                      validator: 'Please ,Enter Remarks',
                    ),
                    const SizedBox(height: 16),
                    CustomTextWidget(text: "Assign your task to employee"),
                    const SizedBox(height: 16),
                    CommonDropDown(
                      context: context,
                      label: "Select Employee",
                      value: controller.selectEmployee,
                      items: controller.employeeList,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectEmployee.value = value;
                          controller.selectEmployeeList.add(value);
                        }
                      },
                    ),
                    Obx(() => controller.selectEmployeeList.isEmpty
                        ? SizedBox()
                        : SizedBox(
                            height: 100,
                            child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: controller.selectEmployeeList.length,
                              itemBuilder: (BuildContext context, int index) {
                                final String option =
                                    controller.selectEmployeeList[index];

                                return ListTile(
                                  onTap: () {},
                                  title: Text(
                                    option,
                                  ),
                                );
                              },
                            ),
                          )),
                  ],
                ),
              ),
              confirmButtonFunction: () async {
                if (!controller.fromKey.currentState!.validate()) {
                  return;
                }

                EasyLoading.showSuccess("ناجح");
                Get.back();
              }),
        );
      },
    );
  }
}

class CommonTextTag extends StatelessWidget {
  const CommonTextTag({
    super.key,
    required this.controller,
  });

  final CaseTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Autocomplete<String>(
          fieldViewBuilder: (BuildContext context,
              TextEditingController textEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            return CommonField(
              focusNode: focusNode,
              controller: textEditingController,
              text: 'Employee Name',
              hintText: 'Searching Employee Name',
              keyboardType: TextInputType.name,
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 200, // Adjust max height
                maxWidth: 300, // Adjust max width
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return SizedBox(
                    width: 300,
                    child: ListTile(
                      onTap: () {
                        onSelected(option);
                      },
                      title: Text(
                        '$option',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            return controller.getSuggestions(textEditingValue.text);
          },
          onSelected: (String selectedTag) {
            controller.onTagSubmitted(selectedTag);
          },
        ),
        Obx(() => Wrap(
              spacing: 8.0,
              children: controller.tags
                  .map((tag) => Chip(
                        label: Text(tag),
                        deleteIcon: const Icon(Icons.cancel),
                        onDeleted: () => controller.removeTag(tag),
                      ))
                  .toList(),
            )),
      ],
    );
  }
}

class CommonTextSearch extends StatelessWidget {
  const CommonTextSearch({
    super.key,
    required this.controller,
  });

  final CaseTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonField(
          onChanged: (v) {
            controller.filterEmployeeList.clear();
            controller.filterEmployeeList.addAll(
              controller.employeeList.where((employee) =>
                  employee.toLowerCase().contains(v.toString().toLowerCase())),
            );
            controller.isShow.value = true;
          },
          controller: controller.searchController,
          text: 'Employee Name',
          hintText: 'Searching Employee Name',
          keyboardType: TextInputType.name,
        ),
      ],
    );
  }
}
