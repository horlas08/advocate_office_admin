import 'package:advocateoffice/controller/ui/task/case_task.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/date_picker.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/my_task/case_task/mobile/widget/case_task_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CaseTaskMobile extends StatelessWidget {
  const CaseTaskMobile(
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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'مهام القضية'),
      ),
      drawer: NavigationBarViewMobile(),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Expanded(child: DashboardShimmer())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              child: CommonDropDown(
                                  context: context,
                                  label: "اختر الموظف",
                                  value: controller.selectedEmployee,
                                  items: controller.employeeList,
                                  onChanged: (value) {
                                    controller.selectedEmployee.value = value!;
                                  }),
                            ),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomTextWidget(
                                    text: "Md. Mamun Islam Mim",
                                    fontSize: 20,
                                  ),
                                  CustomTextWidget(
                                    text: "Flutter Developer",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                  ),
                                  CustomTextWidget(text: "01761810531"),
                                  CustomTextWidget(text: "mail123@gmail.com"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        children: [
                          FittedBox(
                            fit: BoxFit.cover,
                            child: SfDatePickerWidget(
                              selectedDate: controller.selectedFromDate,
                              title: 'من تاريخ',
                              maxDate: DateTime(2030),
                              onSelectionChanged: (args) {
                                if (args.value is DateTime) {
                                  controller.updateSelectedFromDate(args.value);
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                            height: 20,
                          ),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: SfDatePickerWidget(
                              selectedDate: controller.selectedToDate,
                              title: 'إلى تاريخ',
                              maxDate: DateTime(2030),
                              onSelectionChanged: (args) {
                                if (args.value is DateTime) {
                                  controller.updateSelectedToDate(args.value);
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        ],
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Divider(),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.caseTaskList.length,
                          itemBuilder: (context, index) {
                            return CaseTaskCardMobile(controller: controller);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                    CommonField(
                      controller: controller.clientNameController,
                      readOnly: true,
                      text: 'اسم الموكل',
                      hintText: 'ادخل اسم الموكل',
                      validator: 'الرجاء إدخال اسم الموكل',
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 16),
                    CommonField(
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
                    const SizedBox(height: 16),
                    CommonDropDown(
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
                    const SizedBox(height: 16),
                    SfDatePickerWidget(
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
                    const SizedBox(height: 16),
                    CommonField(
                      controller: controller.commentController,
                      minLines: 5,
                      text: 'ملاحظتك',
                      hintText: 'اكتب بعض الملاحظات',
                      keyboardType: TextInputType.text,
                      validator: 'الرجاء إدخال الملاحظات',
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
              confirmButtonFunction: () async {
                if (!controller.fromKey.currentState!.validate()) {
                  return;
                }

                EasyLoading.showSuccess("تم بنجاح");
                Get.back();
              }),
        );
      },
    );
  }
}
