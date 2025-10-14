import 'package:advocateoffice/controller/ui/settings/case_sections.dart';
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/screen/settings/case_sections/mobile/widgets/add.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseSectionTableMobile extends StatelessWidget {
  const CaseSectionTableMobile({super.key, required this.controller, this.width});
  final CaseSectionsController controller;
  final double? width;


  @override
  Widget build(BuildContext context) {
    return Card(
     
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchAndAddSectionWidgetMobile(
              searchTap: (searchTap) {},
              buttonTap: () {
                Get.to(CaseSectionAddMobile(
                  controller: controller,
                  isAddSection: true,
                ));
              },
              buttonName: 'Case Section',
              totalData: "",
            ),
            const SizedBox(height: 16),

            Obx(
              () => CommonTableWidget(
                width: width ??  1000,
                listLength: controller.caseSectionList.length,
                dataColumn: [
                  DataColumn2(label: Center(child: Text('SL')), fixedWidth: 50),
                  DataColumn2(label: Center(child: Text('فئة القضية')), size: ColumnSize.S),
                  DataColumn2(label: Center(child: Text('قسم القضايا')), fixedWidth: 150),
                  DataColumn2(label: Center(child: Text('تفاصيل القضية')), size: ColumnSize.L),
                  DataColumn2(label: Center(child: Text('عمل')), fixedWidth: 150),
                ],
                dataRow: List.generate(
                  controller.caseSectionList.length,
                  (index) {
                    var data = controller.caseSectionList[index];
                    return DataRow(
                      cells: [
                        DataCell(Center(child: Text((index + 1).toString()))),
                        DataCell(Center(
                          child: SelectableText(
                              "${data.caseCategory.toString()}",
                              autofocus: true),
                        )),
                        DataCell(Center(
                            child: SelectableText(data.caseSection.toString(),
                                autofocus: true))),
                        DataCell(Center(
                          child: SelectableText(data.details.toString(),
                              autofocus: true),
                        )),
                        DataCell(
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    child: const Icon(Icons.edit),
                                    onTap: () {
                                      controller.caseSectionCode.text =
                                          "${data.caseSection}";
                                      controller.caseSectionDetails.text =
                                          "${data.details}";
                                      controller.selectCaseCategory.value =
                                          "${data.caseCategory}";
                                      Get.to(CaseSectionAddMobile(
                                          controller: controller,
                                          isAddSection: false,
                                          id: data.id ?? 0));
                                    },
                                  ),
                                ),

                                Expanded(
                            child: GestureDetector(
                              child: Icon(
                                Icons.delete,
                                color: AppColors.errorColor,
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomAlertDialogue(
                                    title: "حذف التأكيد",
                                    body: CustomTextWidget(
                                        text:
                                            "هل أنت متأكد من حذف قسم الحالة هذا؟"),
                                    confirmButtonName: "حذف",
                                    confirmButtonFunction: () {
                                      //controller.removeBus(data.id.toString());
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
    );
  }

  void showDeleteDialog(String text, BuildContext context, onPressed) {
    Get.defaultDialog(
      title: 'أكد',
      content: Text(text),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'No'.tr,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Yes'.tr,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ],
    );
  }
}
