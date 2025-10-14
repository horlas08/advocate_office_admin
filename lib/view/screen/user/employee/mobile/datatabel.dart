import 'package:advocateoffice/controller/ui/user/employee.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/screen/user/employee/mobile/add.dart';
import 'package:advocateoffice/view/screen/user/employee/mobile/edit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeTableMobile extends StatelessWidget {
  EmployeeTableMobile({super.key, required this.controller, required this.width});
  final EmployeeController controller;
  final double width;

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
                  controller.clearDataFunction();
                Get.to(
                    EmployeeAddMobile(
                      controller: controller,
                    ),
                    routeName: "${RoutesName.employee}/create");
              },
              buttonName: 'إضافة موظف',
              totalData: "",
            ),
            SizedBox(height: 16),
            Obx(
              () => CommonTableWidget(
                width: width,
                listLength: controller.employeeList.length,
                dataColumn: const [
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "م")), fixedWidth: 50),
                  DataColumn2(label: CustomTblHeadText(text: "صورة")),
                  DataColumn2(label: CustomTblHeadText(text: "الاسم")),
                  DataColumn2(label: CustomTblHeadText(text: "الهاتف")),
                  DataColumn2(label: CustomTblHeadText(text: "البريد الإلكتروني")),
                  DataColumn2(label: CustomTblHeadText(text: "المسمى الوظيفي")),
                  DataColumn2(label: CustomTblHeadText(text: "خبرة")),
                  DataColumn2(label: CustomTblHeadText(text: "تاريخ الانضمام")),
                  DataColumn2(label: CustomTblHeadText(text: "الحالة")),
                  DataColumn2(label: Center(child: CustomTblHeadText(text: "الإجراءات")), fixedWidth: 60),
                ],
                dataRow: List.generate(
                  controller.employeeList.length,
                  (index) {
                    var data = controller.employeeList[index];
                    return DataRow(cells: [
                      DataCell(CustomSelectableTextWidget(text: "${index + 1}")),
                      DataCell(buildImage(data.image.toString())),
                      DataCell(CustomSelectableTextWidget(text: "${data.name}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.phone}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.mail}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.designation}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.expertise}")),
                      DataCell(CustomSelectableTextWidget(text: "${data.joinDate}")),
                      DataCell(CustomSelectableTextWidget(text: data.status == 1 ? "نشط" : "غير نشط")),
                      DataCell(
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: FittedBox(child: SizedBox(height: 10, child: Switch(value: true, onChanged: (v) {}))),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  child: const Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                  onTap: () {
                                    Get.to(EmployeeEdit(data: data, controller: controller));
                                  },
                                ),
                              ),
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
    );
  }

  Widget buildImage(String data) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image(
          image: NetworkImage(data),
          height: 50,
          width: 50,
        ),
      );
}
