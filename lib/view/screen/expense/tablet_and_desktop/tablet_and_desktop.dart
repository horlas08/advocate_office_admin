import 'package:advocateoffice/controller/ui/expense.dart';
import 'package:advocateoffice/model/exp_model.dart';
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/utils/global_value.dart';
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
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ExpenseTabletDesktop extends StatelessWidget {
  ExpenseTabletDesktop({super.key, required this.controller, this.width});
  final ExpenseController controller;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBarView(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DashboardHeader(title: 'النفقات'),
                    const SizedBox(height: 20),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchAndAddSectionWidget(
                              buttonName: 'إضافة نفقة',
                              totalData:
                                  "إجمالي النفقات :  ${controller.expDataList.length}",
                              searchController: controller.searchController,
                              searchTap: (query) {},
                              buttonTap: () {
                                controller.clearValue();
                                _showAddEditDialog(
                                    context: context, title: 'أضف النفقات');
                              },
                            ),
                            const SizedBox(height: 16),
                            Obx(
                              () => CommonTableWidget(
                                width: width ??
                                    MediaQuery.of(context).size.width - 250,
                                listLength: controller.expDataList.length,
                                dataColumn: [
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(text: "SL")),
                                      fixedWidth: 50),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "الغرض / معرف القضية")),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "المبلغ")),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "الحالة")),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "ملاحظة")),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "تاريخ الإنشاء"),
                                      fixedWidth: 160),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "أنشأ بواسطة"),
                                      fixedWidth: 150),
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(
                                              text: "إجراءات")),
                                      fixedWidth: 120),
                                ],
                                dataRow: List.generate(
                                  controller.expDataList.length,
                                  (index) {
                                    ExpenseDataModel data =
                                        controller.expDataList[index];
                                    return DataRow(cells: [
                                      DataCell(Center(
                                          child: CustomSelectableTextWidget(
                                              text: "${index + 1}"))),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.purpose}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text:
                                              "${data.amount} ${currencySymbol}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.status}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.remark}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.createdAt}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.createdBy}")),
                                      DataCell(
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                      title: "تفاصيل النفقة",
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
                                                    controller.initialValue(
                                                        data: data);
                                                    _showAddEditDialog(
                                                        title: "تعديل النفقة",
                                                        context: context);
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 20,
                                                    color: AppColors.errorColor,
                                                  ),
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          CustomAlertDialogue(
                                                        title: "تأكيد الحذف",
                                                        body: CustomTextWidget(
                                                            text:
                                                                "هل أنت متأكد أنك تريد حذف هذه النفقة؟"),
                                                        confirmButtonName:
                                                            "حذف",
                                                        confirmButtonFunction:
                                                            () {
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
        ],
      ),
    );
  }

  void _showAddEditDialog(
      {required BuildContext context, required String title}) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(text: "صورة القسيمة"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomTextWidget(text: "نفقة القضية"),
                            Obx(() {
                              return Checkbox(
                                activeColor: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .color,
                                checkColor: Theme.of(context).cardColor,
                                side: BorderSide(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .color!),
                                value: controller.isChecked.value,
                                onChanged: (value) {
                                  controller.isChecked.value = value!;
                                },
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                    ImagePick(
                      controller: controller,
                    ),
                    Obx(() => controller.isChecked.value
                        ? CommonDropDown(
                            context: context,
                            label: "حدد معرف الحالة",
                            value: controller.selectedCaseID,
                            items: controller.caseIdList,
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectedCaseID.value = value;
                              }
                            },
                          )
                        : CommonDropDown(
                            context: context,
                            label: "حدد الغرض",
                            value: controller.selectedPurposeOf,
                            items: controller.purposeList,
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectedPurposeOf.value = value;
                              }
                            },
                          )),
                    CommonField(
                      controller: controller.amountController,
                      text: 'Amount',
                      hintText: 'أدخل المبلغ',
                      validator: 'من فضلك، أدخل المبلغ',
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    CommonField(
                      controller: controller.commentController,
                      minLines: 5,
                      text: 'تعليق',
                      hintText: 'أدخل التعليق',
                      validator: 'من فضلك، أدخل التعليق',
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              confirmButtonFunction: () {
                Get.back();
              }),
        );
      },
    );
  }

  void showViewDialog(
      {required BuildContext context,
      required String title,
      required ExpenseDataModel data}) {
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
                      CustomTextWidget(
                          text: "الغرض أو معرف الحالة",
                          fontColor: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .color!),
                      CustomTextWidget(
                        text: data.purpose.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .color!
                            .withAlpha(120),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "Amount",
                        fontColor:
                            Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                      CustomTextWidget(
                        text: data.amount.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .color!
                            .withAlpha(120),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "Created At",
                        fontColor:
                            Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                      CustomTextWidget(
                        text: data.createdAt.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .color!
                            .withAlpha(120),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "Created BY",
                        fontColor:
                            Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                      CustomTextWidget(
                        text: data.createdBy.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .color!
                            .withAlpha(120),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "Status",
                        fontColor:
                            Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                      CustomTextWidget(
                        text: data.status.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .color!
                            .withAlpha(120),
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
                          text: "مسودة",
                          fontColor: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .color!,
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .color!
                                  .withAlpha(50),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CustomTextWidget(
                              maxLine: 20,
                              text: data.remark.toString(),
                              fontWeight: FontWeight.bold,
                              fontColor: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .color!
                                  .withAlpha(120),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  data.voucherImg == null
                      ? SizedBox()
                      : Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: "Voucher",
                                fontColor: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .color!,
                              ),
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Image.network(
                                  data.voucherImg.toString(),
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
