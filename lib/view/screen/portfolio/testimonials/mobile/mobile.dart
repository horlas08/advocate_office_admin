import 'package:advocateoffice/controller/ui/portfolio/testimonials.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/portfolio/testimonials/mobile/widgets/add_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:data_table_2/data_table_2.dart';

class TestimonialsScreenMobile extends StatelessWidget {
  const TestimonialsScreenMobile(
      {super.key, required this.controller, required this.width});
  final TestimonialsController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'Testimonials'),
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
                                Get.to(TestimonialsMobileAddEdit(
                                    controller: controller,
                                    isAddSection: true));
                              },
                              buttonName: 'إضافة شهادات جديدة',
                              totalData: "",
                            ),
                            const SizedBox(height: 16),
                            Obx(
                                      () => CommonTableWidget(
                                        width: width,
                                        listLength:
                                            controller.testimonialsList.length,
                                        dataColumn: const [
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "SL")),
                                              fixedWidth: 50),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "صورة")),
                                         
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "اسم")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "مهنة")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "اقتبس")),
                                          DataColumn2(
                                              fixedWidth: 100,
                                              label: CustomTblHeadText(
                                                  text: "حالة")),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "عمل")),
                                              fixedWidth: 100),
                                        ],
                                        dataRow: List.generate(
                                          controller.testimonialsList.length,
                                          (index) {
                                            var data = controller
                                                .testimonialsList[index];
                                            return DataRow(cells: [
                                              DataCell(
                                                  CustomSelectableTextWidget(
                                                      text: "${index + 1}")),
                                              DataCell(Image.network(
                                                "${data.image}",
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              )),
                                              DataCell(CustomSelectableTextWidget(
                                                  text:
                                                      "${data.name.toString()}")),
                                              DataCell(CustomSelectableTextWidget(
                                                  text:
                                                      "${data.profession.toString()}")),
                                              DataCell(CustomSelectableTextWidget(
                                                  text:
                                                      "${data.quote.toString()}")),
                                              DataCell(
                                                  CustomSelectableTextWidget(
                                                      text: data.status == 1
                                                          ? "نشط"
                                                          : "غير فعال")),
                                              DataCell(
                                                Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: InkWell(
                                                          child: const Icon(
                                                            Icons.edit,
                                                            size: 20,
                                                          ),
                                                          onTap: () {
                                                            controller
                                                                    .nameController
                                                                    .text =
                                                                data.name
                                                                    .toString();
                                                            controller
                                                                    .professionController
                                                                    .text =
                                                                data.quote
                                                                    .toString();

                                                            controller
                                                                    .selectImage
                                                                    .value =
                                                                data.image
                                                                    .toString();

                                                                     Get.to(TestimonialsMobileAddEdit(
                                    controller: controller,
                                    isAddSection: false));

                                                           
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
