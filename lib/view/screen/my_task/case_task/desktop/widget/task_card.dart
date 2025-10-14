import 'package:advocateoffice/controller/ui/task/case_task.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CaseTaskCardDesktopTablet extends StatelessWidget {
  const CaseTaskCardDesktopTablet({
    super.key,
    required this.controller,
    required this.data,
  });
  final CaseTaskController controller;
  final data;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 500,
        width: 500,
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.transparent)),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            fontColor: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .color,
                            text: "مد. مامون إسلام - 01761810531",
                            maxLine: 2,
                          ),
                          CustomTextWidget(
                            text: "رقم القضية : C256B3",
                            fontColor: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .color,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomTextWidget(
                            text: "متبقي 3 أيام",
                            fontColor: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .color,
                          ),
                          CustomTextWidget(
                            text: "عالي",
                            fontColor: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .color,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextWidget(
                    maxLine: 20,
                    textOverflow: TextOverflow.ellipsis,
                    text:
                        "هذه فقرة نصية تجريبية تستخدم لملء المساحة في التصميم. استخدم هذه الملاحظة كمثال لعرض النصوص في واجهة المستخدم."),
              ),
            ),
            Card(
              margin: EdgeInsets.zero,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.transparent)),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: "تاريخ التعيين",
                            //fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                            maxLine: 2,
                          ),
                          CustomTextWidget(
                            text: "21 Dec 2024, 3:52 PM",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_red_eye,
                              size: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showEditDialog(
                                context: context,
                                title: "تعديل المهمة",
                                data: data,
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => CustomAlertDialogue(
                                  title: "تأكيد الحذف",
                                  body: Text(
                                      "هل أنت متأكد أنك تريد حذف هذه المهمة؟"),
                                  confirmButtonName: "حذف",
                                  confirmButtonFunction: () {
                                    Get.back();
                                  },
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showEditDialog({
    required BuildContext context,
    required String title,
    required data,
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
                            text: 'اسم الموكل',
                            hintText: 'ادخل اسم الموكل',
                            validator: 'الرجاء إدخال اسم الموكل',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.clientNumberController,
                            readOnly: true,
                            text: 'هاتف الموكل',
                            hintText: 'ادخل رقم هاتف الموكل',
                            validator: 'الرجاء إدخال رقم هاتف الموكل',
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
                            label: "الأولوية",
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
                            title: 'اختر تاريخ الجلسة',
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
                      text: 'ملاحظتك',
                      hintText: 'اكتب بعض الملاحظات',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    CustomTextWidget(text: "قم بتعيين مهمتك لموظف"),
                    const SizedBox(height: 16),
                    CommonDropDown(
                      context: context,
                      label: "اختر الموظف",
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
              confirmButtonFunction: () {}),
        );
      },
    );
  }
}
