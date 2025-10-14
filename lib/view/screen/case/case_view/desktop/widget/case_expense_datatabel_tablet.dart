import 'package:advocateoffice/controller/ui/case/case_view.dart';
import 'package:advocateoffice/model/expense.dart';
import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'case_history_datatabel_tablet.dart';

class CaseExpenseHistoryTable extends StatelessWidget {
  CaseExpenseHistoryTable({super.key, required this.controller, this.screenType});
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
              title: "تاريخ المصاريف",
              buttonName: "إضافة مصروف",
              onTap: () {
                _showAddEditDialog(
                  context: context,
                  title: 'إضافة مصروف',
                  id: "1254",
                );
              },
            ),
            const SizedBox(height: 16),
            Obx(
                  () => CommonTableWidget(
                width: screenType == "Tablet" ? 1100 : MediaQuery.of(context).size.width - 250,
                listLength: controller.expenseList.length,
                dataColumn: [
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "م")), fixedWidth: 50),
                  DataColumn2(label: CustomTblHeadText(text: "المبلغ")),
                  DataColumn2(label: CustomTblHeadText(text: "الحالة")),
                  DataColumn2(label: CustomTblHeadText(text: "ملاحظة")),
                  DataColumn2(label: CustomTblHeadText(text: "تاريخ الإنشاء"), fixedWidth: 160),
                  DataColumn2(label: CustomTblHeadText(text: "تم الإنشاء بواسطة"), fixedWidth: 150),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "إجراءات")), fixedWidth: 100),
                ],
                dataRow: List.generate(
                  controller.expenseList.length,
                      (index) {
                    var data = controller.expenseList[index];
                    return DataRow(
                      cells: [
                        DataCell(Center(child: CustomSelectableTextWidget(text: "${index + 1}"))),
                        DataCell(CustomSelectableTextWidget(text: "${data.amount} ${currencySymbol}")),
                        DataCell(CustomSelectableTextWidget(text: "${data.status}")),
                        DataCell(CustomSelectableTextWidget(text: "${data.comment}")),
                        DataCell(CustomSelectableTextWidget(text: "${data.createdAt}")),
                        DataCell(CustomSelectableTextWidget(text: "${data.createdBy}")),
                        DataCell(
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    child: const Icon(
                                      size: 20,
                                      Icons.remove_red_eye,
                                    ),
                                    onTap: () {
                                      showViewDialog(
                                        context: context,
                                        title: "تفاصيل المصروف",
                                        data: data,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: GestureDetector(
                                    child: const Icon(
                                      Icons.edit,
                                      size: 20,
                                    ),
                                    onTap: () {
                                      _showAddEditDialog(
                                        context: context,
                                        title: 'تعديل المصروف',
                                        id: "1254",
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

  void _showAddEditDialog({context, required String title, required String id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: CustomAlertDialogue(
              title: title,
              body: Form(
                key: controller.fromKey,
                child: Column(
                  spacing: 16,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "صورة الإيصال",
                      fontColor: Theme.of(context).textTheme.bodyMedium!.color!,
                    ),
                    ImagePick(
                      controller: controller,
                    ),
                    CommonField(
                      controller: controller.selectController,
                      text: 'معرّف القضية',
                      readOnly: true,
                      hintText: 'معرّف القضية',
                    ),
                    CommonField(
                      controller: controller.amountController,
                      text: 'المبلغ',
                      hintText: 'أدخل المبلغ',
                      validator: 'من فضلك، أدخل المبلغ',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    CommonField(
                      controller: controller.commentController,
                      minLines: 5,
                      text: 'ملاحظة',
                      hintText: 'اكتب الملاحظة',
                      validator: 'من فضلك، اكتب الملاحظة',
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              confirmButtonFunction: () {}),
        );
      },
    );
  }

  void showViewDialog({required BuildContext context, required String title, required ExpenseModel data}) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(text: "معرّف القضية أو الغرض", fontColor: Theme.of(context).textTheme.headlineMedium!.color!),
                      CustomTextWidget(
                        text: data.purposeOforCaseID.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(120),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "المبلغ",
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                      CustomTextWidget(
                        text: data.amount.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(120),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "تاريخ الإنشاء",
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                      CustomTextWidget(
                        text: data.createdAt.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(120),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "تم الإنشاء بواسطة",
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                      CustomTextWidget(
                        text: data.createdBy.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(120),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "الحالة",
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                      CustomTextWidget(
                        text: data.status.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(120),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: "ملاحظات",
                          fontColor: Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(50),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CustomTextWidget(
                              maxLine: 20,
                              text: data.comment.toString(),
                              fontWeight: FontWeight.bold,
                              fontColor: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(120),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  data.image == null
                      ? SizedBox()
                      : Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: "الإيصال",
                          fontColor: Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.network(
                            data.image.toString(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
