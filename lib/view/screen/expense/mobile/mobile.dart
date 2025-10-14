import 'package:advocateoffice/controller/ui/expense.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/screen/expense/mobile/widgets/add.dart';
import 'package:advocateoffice/view/screen/expense/mobile/widgets/edit.dart';
import 'package:advocateoffice/view/screen/expense/mobile/widgets/view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseMobile extends StatelessWidget {
  ExpenseMobile({super.key, required this.controller, this.width});
  final ExpenseController controller;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DashboardHeaderMobile(title: 'Expense'),
      ),
      drawer: NavigationBarViewMobile(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SearchAndAddSectionWidgetMobile(
                            searchTap: (searchTap) {},
                            buttonTap: () {
                              controller.amountController.clear();
                              controller.commentController.clear();
                              Get.to(ExpenseCreateMobile(controller: controller));
                            },
                            buttonName: 'Add Expense',
                            totalData: "",
                          ),
                          const SizedBox(height: 16),
                          Obx(
                            () => CommonTableWidget(
                              width: width ?? MediaQuery.of(context).size.width - 270,
                              listLength: controller.expDataList.length,
                              dataColumn: [
                                DataColumn2(label: Center(child: CustomTblHeadText(text: "SL")), fixedWidth: 50),
                                DataColumn2(label: CustomTblHeadText(text: "الغرض/معرف الحالة")),
                                DataColumn2(label: CustomTblHeadText(text: "كمية")),
                                DataColumn2(label: CustomTblHeadText(text: "حالة")),
                                DataColumn2(label: CustomTblHeadText(text: "تعليق")),
                                DataColumn2(label: CustomTblHeadText(text: "تم الإنشاء في")),
                                DataColumn2(label: CustomTblHeadText(text: "تم الإنشاء بواسطة")),
                                DataColumn2(label: Center(child: CustomTblHeadText(text: "عمل")), fixedWidth: 120),
                              ],
                              dataRow: List.generate(
                                controller.expDataList.length,
                                (index) {
                                  var data = controller.expDataList[index];
                                  return DataRow(cells: [
                                    DataCell(Center(child: CustomSelectableTextWidget(text: "${index + 1}"))),
                                    DataCell(CustomSelectableTextWidget(text: "${data.purpose}")),
                                    DataCell(CustomSelectableTextWidget(text: "${data.amount} ${currencySymbol}")),
                                    DataCell(CustomSelectableTextWidget(text: "${data.status}")),
                                    DataCell(CustomSelectableTextWidget(text: "${data.remark}")),
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
                                                  controller.initialValue(data: data);
                                                  Get.to(ExpenseViewMobile(controller: controller, data: data),
                                                      routeName: "${RoutesName.expense}/details");
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
                                                  controller.initialValue(data: data);
                                                  Get.to(
                                                      ExpenseEditMobile(
                                                        controller: controller,
                                                        data: data,
                                                      ),
                                                      routeName: "${RoutesName.expense}/edit");
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
                                                    builder: (context) => CustomAlertDialogue(
                                                      title: "حذف التأكيد",
                                                      body: CustomTextWidget(text: "هل أنت متأكد من حذف هذه النفقات؟"),
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
        ],
      ),
    );
  }
}
