import 'package:advocateoffice/controller/ui/dashboard.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResentVisitorTableDesktop extends StatelessWidget {
  ResentVisitorTableDesktop({super.key, required this.controller, this.width});
  final TextEditingController searchController = TextEditingController();
  final DashboardController controller;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            SearchAndAddSectionWidget(
              isButtonEnable: false,
              searchTap: (searchTap) {},
              buttonTap: () {},
              buttonName: "buttonName",
              totalData: "زائر اليوم",
            ),
            SizedBox(height: 17),
            Obx(
              () => CommonTableWidget(
                width: width ?? MediaQuery.sizeOf(context).width - 220,
                listLength: controller.resentVisitorList.length,
                dataColumn: [
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "SL")), fixedWidth: 50),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "هوية الزائر")), fixedWidth: 120),
                  DataColumn2(label: CustomTblHeadText(text: "اسم الزائر")),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "هاتف"))),
                  DataColumn2(label: CustomTblHeadText(text: "نوع الحالة")),
                  DataColumn2(label: CustomTblHeadText(text: "أفضلية")),
                  DataColumn2(label: CustomTblHeadText(text: "تم الإنشاء بواسطة")),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "تعليق"))),
                ],
                dataRow: List.generate(
                  controller.resentVisitorList.length,
                  (index) {
                    var data = controller.resentVisitorList[index];
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
                          text:
                              "${data.name.toString()}",
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
                          text: data.createdBy.toString(),
                        )),
                        DataCell(CustomSelectableTextWidget(
                          text: "${data.remark.toString()}",
                          textOverflow: TextOverflow.ellipsis,
                          maxLine: 2,
                        )),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
