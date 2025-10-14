import 'package:advocateoffice/controller/ui/clients/clients.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/clients/clients_list/mobile/widgets/add.dart';
import 'package:advocateoffice/view/screen/clients/clients_list/mobile/widgets/edit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsMobile extends StatelessWidget {
  ClientsMobile({super.key, required this.controller, required this.width});
  final ClientsController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'Clients'),
      ),
      drawer: NavigationBarViewMobile(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchAndAddSectionWidgetMobile(
                      searchTap: (searchTap) {},
                      buttonTap: () {
                        controller.clearField();
                        Get.to(ClientAddMobile(controller: controller));
                      },
                      buttonName: "Add Client",
                      totalData: "",
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => CommonTableWidget(
                        width: width,
                        listLength: controller.filteredClientsList.length,
                        dataColumn: const [
                          DataColumn2(label: Center(child: CustomTblHeadText(text: "SL")), fixedWidth: 50),
                          DataColumn2(label: Center(child: CustomTblHeadText(text: "CLIENT ID")), fixedWidth: 120),
                          DataColumn2(label: CustomTblHeadText(text: "اسم العميل")),
                          DataColumn2(label: CustomTblHeadText(text: "اسم الأب")),
                          DataColumn2(label: CustomTblHeadText(text: "مهنة")),
                          DataColumn2(label: CustomTblHeadText(text: "الهاتف/التغيير")),
                          DataColumn2(label: CustomTblHeadText(text: "عنوان البريد")),
                          DataColumn2(label: Center(child: CustomTblHeadText(text: "حالة")), fixedWidth: 100),
                          DataColumn2(label: CustomTblHeadText(text: "تم الإنشاء بواسطة")),
                          DataColumn2(label: Center(child: CustomTblHeadText(text: "عمل")), fixedWidth: 150),
                        ],
                        dataRow: List.generate(
                          controller.filteredClientsList.length,
                          (index) {
                            var data = controller.filteredClientsList[index];
                            return DataRow(
                              cells: [
                                DataCell(CustomSelectableTextWidget(text: "${index + 01}")),
                                DataCell(Center(child: CustomSelectableTextWidget(text: "${data.id.toString()}"))),
                                DataCell(CustomSelectableTextWidget(text: data.name.toString())),
                                DataCell(CustomSelectableTextWidget(text: data.fathersName.toString())),
                                DataCell(CustomSelectableTextWidget(text: data.profession.toString())),
                                DataCell(CustomSelectableTextWidget(text: data.phone.toString())),
                                DataCell(CustomSelectableTextWidget(text: data.mail.toString())),
                                DataCell(Center(child: CustomSelectableTextWidget(text: data.totalCase.toString()))),
                                DataCell(CustomSelectableTextWidget(text: data.createdBy.toString())),
                                DataCell(
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            child: const Icon(
                                              Icons.remove_red_eye,
                                            ),
                                            onTap: () {
                                              Get.toNamed('${Get.currentRoute}${RoutesName.clientDetails}');
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: GestureDetector(
                                            child: const Icon(
                                              Icons.edit,
                                            ),
                                            onTap: () {
                                              controller.setData(myData: data);
                                              Get.to(ClientsEditMobile(data: data, controller: controller));
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
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
                                                  body: CustomTextWidget(text: "هل أنت متأكد من حذف هذا العميل؟"),
                                                  confirmButtonName: "حذف",
                                                  confirmButtonFunction: () {
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
