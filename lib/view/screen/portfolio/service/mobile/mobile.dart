import 'package:advocateoffice/controller/ui/portfolio/service.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/portfolio/service/mobile/widgets/add_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:data_table_2/data_table_2.dart';

class ServiceScreenMobile extends StatelessWidget {
  const ServiceScreenMobile(
      {super.key, required this.controller, required this.width});
  final ServiceController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'الخدمات'),
      ),
      drawer: NavigationBarViewMobile(),
      body: Obx(
        () => controller.isLoading.isTrue
            ? DashboardShimmer()
            : SingleChildScrollView(
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
                              searchTap: (query) {},
                              buttonTap: () {
                                controller.clearDataFunction();
                                Get.to(ServiceScreenMobileAddEdit(
                                    controller: controller,
                                    isAddSection: true));
                              },
                              buttonName: 'اضافة خدمة جديدة',
                              totalData: "",
                            ),
                            const SizedBox(height: 16),
                            Obx(
                              () => CommonTableWidget(
                                width: width,
                                listLength: controller.serviceList.length,
                                dataColumn: const [
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(text: "SL")),
                                      fixedWidth: 50),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "الصورة")),
                                  DataColumn2(
                                      label:
                                          CustomTblHeadText(text: "الأيقونة")),
                                  DataColumn2(
                                      label:
                                          CustomTblHeadText(text: "العنوان")),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "الوصف")),
                                  DataColumn2(
                                      fixedWidth: 100,
                                      label: CustomTblHeadText(text: "الحالة")),
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(
                                              text: "الإجراءات")),
                                      fixedWidth: 100),
                                ],
                                dataRow: List.generate(
                                  controller.serviceList.length,
                                  (index) {
                                    var data = controller.serviceList[index];
                                    return DataRow(cells: [
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${index + 1}")),
                                      DataCell(Image.network(
                                        "${data.image}",
                                        width: 100,
                                        height: 100,
                                      )),
                                      DataCell(CircleAvatar(
                                          backgroundImage: NetworkImage(
                                        "${data.icon}",
                                      ))),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.title.toString()}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.description}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text: data.status == 1
                                              ? "نشط"
                                              : "غير نشط")),
                                      DataCell(
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  child: const Icon(
                                                    Icons.edit,
                                                    size: 20,
                                                  ),
                                                  onTap: () {
                                                    controller
                                                        .initialDataFunction(
                                                            data: data);

                                                    controller.titleController
                                                            .text =
                                                        data.title.toString();
                                                    controller
                                                            .descriptionController
                                                            .text =
                                                        data.description
                                                            .toString();

                                                    controller
                                                            .selectImage.value =
                                                        data.image.toString();
                                                    controller
                                                            .selectIcon.value =
                                                        data.icon.toString();
                                                    Get.to(
                                                        ServiceScreenMobileAddEdit(
                                                      controller: controller,
                                                      isAddSection: false,
                                                    ));
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
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
