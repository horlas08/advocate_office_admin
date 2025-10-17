import 'package:advocateoffice/controller/ui/visitor.dart';
import 'package:advocateoffice/model/visitor.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class VisitorTabletDesktop extends StatelessWidget {
  VisitorTabletDesktop({super.key, required this.controller, this.width});
  final VisitorController controller;
  final double? width;
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
                            DashboardHeader(title: 'زائر'),
                            const SizedBox(height: 20),
                            Card(
                              color: Theme.of(context).cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SearchAndAddSectionWidget(
                                      totalData: "إجمالي الزوار :  ${controller.filteredVisitorList.length}",
                                      searchController: controller.searchController,
                                      searchTap: (query) {
                                     
                                      },
                                      buttonTap: () {
                                        controller.visitorNameController.clear();
                                        controller.visitorNumberController.clear();
                                        controller.selectPriority.value = "High";
                                        controller.selectCondition.value = "Positive";
                                        controller.selectCaseType.value = "Property";
                                        showAddEditDialog(context: context);
                                      },
                                      buttonName: 'إضافة زائر',
                                    ),
                                    const SizedBox(height: 16),
                                    Obx(
                                      () => CommonTableWidget(
                                        width: width ?? MediaQuery.sizeOf(context).width - 220,
                                        listLength: controller.filteredVisitorList.length,
                                        dataColumn: [
                                          DataColumn2(label: Center(child: CustomTblHeadText(text: "ت")), fixedWidth: 50),
                                          DataColumn2(label: Center(child: CustomTblHeadText(text: "الرقم المدني")), fixedWidth: 120),
                                          DataColumn2(label: CustomTblHeadText(text: "اسم الزائر")),
                                          DataColumn2(label: Center(child: CustomTblHeadText(text: "رقم الهاتف"))),
                                          DataColumn2(label: CustomTblHeadText(text: "نوع القضية")),
                                          DataColumn2(label: CustomTblHeadText(text: "الأولوية")),
                                          DataColumn2(label: Center(child: CustomTblHeadText(text: "ملاحظة"))),
                                          DataColumn2(label: Center(child: CustomTblHeadText(text: "إجراءات")), fixedWidth: 150),
                                        ],
                                        dataRow: List.generate(
                                          controller.filteredVisitorList.length,
                                          (index) {
                                            var data = controller.filteredVisitorList[index];
                                            return DataRow(
                                              cells: [
                                                DataCell(Center(
                                                  child: CustomSelectableTextWidget(text: "${index + 1}"),
                                                )),
                                                DataCell(Center(
                                                  child: CustomSelectableTextWidget(
                                                    text: data.id.toString(),
                                                  ),
                                                )),
                                                DataCell(CustomSelectableTextWidget(
                                                  text: "${data.name.toString()}",
                                                )),
                                                DataCell(Center(
                                                  child: CustomSelectableTextWidget(
                                                    text: data.phone.toString(),
                                                  ),
                                                )),
                                                DataCell(CustomSelectableTextWidget(
                                                  text: data.caseType.toString(),
                                                )),
                                                DataCell(CustomSelectableTextWidget(
                                                  text: data.priority.toString(),
                                                )),
                                                DataCell(CustomSelectableTextWidget(
                                                  text: "${data.remark.toString()}",
                                                  textOverflow: TextOverflow.ellipsis,
                                                  maxLine: 2,
                                                )),
                                                DataCell(
                                                  Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                            child: const Icon(
                                                              Icons.arrow_circle_right_outlined,
                                                              size: 20,
                                                            ),
                                                            onTap: () {
                                                              Get.offNamed("${RoutesName.clients}");
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            child: const Icon(
                                                              Icons.visibility,
                                                              size: 20,
                                                            ),
                                                            onTap: () {
                                                              showVisitorsDialog(context: context, data: data);
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            child: const Icon(Icons.edit, size: 20),
                                                            onTap: () {
                                                              showAddEditDialog(context: context, title: "Edit Visitor's Data", id: index);
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            child: Icon(
                                                              Icons.delete,
                                                              size: 20,
                                                              color: AppColors.errorColor,
                                                            ),
                                                            onTap: () {
                                                              showDialog(
                                                                barrierDismissible: false,
                                                                anchorPoint: Offset(1, 1),
                                                                context: context,
                                                                builder: (context) => CustomAlertDialogue(
                                                                  title: "تأكيد الحذف",
                                                                  body: CustomTextWidget(text: "هل أنت متأكد من حذف هذا الزائر؟"),
                                                                  confirmButtonName: "حذف",
                                                                  confirmButtonFunction: () {},
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

  void showVisitorsDialog({required BuildContext context, required VisitorModel data}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          surfaceTintColor: Theme.of(context).cardColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              CustomSelectableTextWidget(text: "عرض تفاصيل الزائر", fontSize: 20, fontWeight: FontWeight.w600),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).textTheme.headlineMedium!.color,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                myRow(title: "هوية الزائر", value: data.id.toString()),
                myRow(title: "اسم الزائر", value: data.name.toString()),
                myRow(title: "هاتف الزائر", value: data.phone.toString()),
                myRow(title: "نوع القضية", value: data.caseType.toString()),
                myRow(title: "رسوم التسجيل", value: data.fee.toString()),
                myRow(title: "الأولوية", value: data.priority.toString()),
                myRow(title: "تم الإنشاء بواسطة", value: data.createdBy.toString()),
                myRow(title: "تم الإنشاء في", value: data.createdAt.toString()),
                myRow(title: "ملاحظة", maxLine: 5, value: "${data.remark.toString()}"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget myRow({required String title, required String value, int? maxLine}) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: CustomSelectableTextWidget(
            text: title,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          )),
          Expanded(
              flex: 2,
              child: CustomSelectableTextWidget(
                text: value,
                maxLine: maxLine ?? 1,
                textAlign: TextAlign.end,
              )),
        ],
      ),
    );
  }

  void showAddEditDialog({required BuildContext context, String? title, int? id}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: CustomAlertDialogue(
            title: title ?? "إضافة بيانات الزائر",
            body: Form(
              key: controller.fromKey,
              child: Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: CommonField(
                          controller: controller.visitorNameController,
                          text: 'اسم الزائر',
                          hintText: 'أدخل اسم الزائر',
                          validator: 'أدخل اسم الزائر',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Expanded(
                        child: CommonField(
                          controller: controller.visitorNumberController,
                          text: 'رقم الزائر',
                          hintText: 'أدخل رقم الزائر',
                          validator: 'أدخل رقم الزائر',
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
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: CommonField(
                            controller: controller.titleController,
                            text: "عنوان الدعوى",
                            hintText: "عنوان الدعوى",
                            validator: "عنوان الدعوى",
                            onChanged: (value) {
                              controller.selectCaseType.value = value!;
                            }),
                      ),
                      Expanded(
                        child: CommonField(
                          controller: controller.amountController,
                          text: 'رسوم القضية',
                          hintText: 'أدخل رسوم الحالة',
                          validator: 'أدخل رسوم الحالة',
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
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: CommonDropDown(
                            context: context,
                            label: "الأولوية",
                            value: controller.selectPriority,
                            items: controller.priorityList,
                            onChanged: (value) {
                              controller.selectPriority.value = value!;
                            }),
                      ),
                      Expanded(
                        child: CommonField(
                          controller: controller.referenceNamePhoneController,
                          text: 'الاسم المرجعي والهاتف',
                          hintText: 'أدخل الاسم المرجعي والهاتف',
                          validator: 'أدخل الاسم المرجعي والهاتف',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  CommonField(
                    minLines: 5,
                    controller: controller.commentController,
                    text: 'تعليق',
                    hintText: 'أدخل الملاحظات',
                    validator: 'أدخل الملاحظات',
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            confirmButtonFunction: () {
              controller.visitorAddAndUpdateFun();
            },
          ),
        );
      },
    );
  }
}
