import 'package:advocateoffice/controller/ui/case/case_view.dart'; import 'package:advocateoffice/view/common_widgets.dart/common_field.dart'; import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart'; import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart'; import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart'; import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart'; import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart'; import 'package:advocateoffice/view/common_widgets.dart/datatable.dart'; import 'package:advocateoffice/view/common_widgets.dart/date_picker.dart'; import 'package:advocateoffice/view/common_widgets.dart/image.dart'; import 'package:data_table_2/data_table_2.dart'; import 'package:flutter/material.dart'; import 'package:get/get.dart'; import 'package:widget_zoom/widget_zoom.dart';
class CaseHistoryTableDesktop extends StatelessWidget {
  CaseHistoryTableDesktop({super.key, required this.controller, this.screenType});
  final CaseViewController controller;
  final String? screenType;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableTitleWidget(
              title: "تاريخ القضية",
              buttonName: "إضافة سجل قضية",
              onTap: () {
                _showAddEditDialog(
                  context: context,
                  title: "إضافة سجل قضية",
                );
              },
            ),
            const SizedBox(height: 16),
            Obx(
                  () => CommonTableWidget(
                width: screenType == "Tablet" ? 1100 : MediaQuery.of(context).size.width - 260,
                listLength: controller.filteredCaseHistoryList.length,
                dataColumn: const [
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "م")), fixedWidth: 50),
                  DataColumn2(label: CustomTblHeadText(text: "تاريخ الجلسة")),
                  DataColumn2(label: CustomTblHeadText(text: "النشاط")),
                  DataColumn2(label: CustomTblHeadText(text: "قرار المحكمة")),
                  DataColumn2(label: CustomTblHeadText(text: "ملاحظة")),
                  DataColumn2(label: CustomTblHeadText(text: "تاريخ الإنشاء")),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "إجراءات")), fixedWidth: 120),
                ],
                dataRow: List.generate(
                  controller.filteredCaseHistoryList.length,
                      (index) {
                    var data = controller.filteredCaseHistoryList[index];
                    return DataRow(
                      cells: [
                        DataCell(CustomSelectableTextWidget(text: "${index + 1}")),
                        DataCell(CustomSelectableTextWidget(text: "${data.nextHearingDate}")),
                        DataCell(CustomSelectableTextWidget(text: "${data.activity}")),
                        DataCell(CustomSelectableTextWidget(text: "${data.court}")),
                        DataCell(CustomSelectableTextWidget(text: "${data.comment}")),
                        DataCell(CustomSelectableTextWidget(text: "${data.createAt}")),
                        DataCell(
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    child: const Icon(
                                      Icons.remove_red_eye,
                                      size: 20,
                                    ),
                                    onTap: () {
                                      showViewDialog(
                                          context: context,
                                          title: "وثيقة جلسة القضية",
                                          img:
                                          "https://png.pngtree.com/template/20210823/ourmid/pngtree-elegant-professional-invoice-template-design-image_579636.jpg");
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: const Icon(Icons.edit, size: 20),
                                    onTap: () {
                                      _showAddEditDialog(
                                        context: context,
                                        title: "تعديل سجل القضية",
                                      );
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
    );
  }

  void _showAddEditDialog({required BuildContext context, required String title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogue(
            title: title,
            body: Form(
              key: controller.fromKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  CustomTextWidget(text: "مرفقات القضية"),
                  const SizedBox(height: 10),
                  ImagePick(
                    title: "تحميل مستندات القضية",
                    controller: controller,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: SfDatePickerWidget(
                          selectedDate: controller.selectedDate,
                          title: 'تاريخ الجلسة',
                          maxDate: DateTime(2030),
                          onSelectionChanged: (args) {
                            if (args.value is DateTime) {
                              controller.selectedDate.value = args.value;
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CommonField(
                          controller: controller.activityController,
                          text: 'النشاط',
                          hintText: 'أدخل النشاط',
                          validator: 'من فضلك أدخل النشاط',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CommonField(
                          controller: controller.courtDictionController,
                          text: 'انطباع المحكمة',
                          hintText: 'أدخل انطباع المحكمة',
                          validator: 'من فضلك أدخل انطباع المحكمة',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CommonField(
                          controller: controller.commentController,
                          text: 'ملاحظة',
                          hintText: 'أدخل الملاحظة',
                          validator: 'من فضلك أدخل الملاحظة',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            confirmButtonFunction: () {});
      },
    );
  }

  void showViewDialog({required BuildContext context, required String title, required String img}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            backgroundColor: Theme.of(context).cardColor,
            surfaceTintColor: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headlineMedium!.color,
                  ),
                ),
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
            content: Container(
              width: 500,
              child: Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  WidgetZoom(
                    heroAnimationTag: 'tag',
                    zoomWidget: Image.network(img),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TableTitleWidget extends StatelessWidget {
  const TableTitleWidget({super.key, required this.onTap, required this.title, required this.buttonName});
  final VoidCallback onTap;
  final String title;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomTextWidget(
            text: title,
            fontColor: Theme.of(context).textTheme.headlineMedium!.color,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomButtonWidget(
          vertical: 15,
          buttonColor: Colors.white,
          textColor: Theme.of(context).primaryColor,
          buttonName: buttonName,
          onTap: onTap,
        ),
      ],
    );
  }
}
