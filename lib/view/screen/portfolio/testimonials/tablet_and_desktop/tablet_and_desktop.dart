
import 'package:advocateoffice/controller/ui/portfolio/testimonials.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TestimonialsScreenDesktopTablet extends StatelessWidget {
  const TestimonialsScreenDesktopTablet({
    Key? key,
    required this.controller,
    this.width,
  }) : super(key: key);
  final TestimonialsController controller;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBarView(),
          Obx(
            () => controller.isLoading.isTrue
                ? Expanded(child: DashboardShimmer())
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DashboardHeader(title: 'شهادة'),
                            const SizedBox(height: 20),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SearchAndAddSectionWidget(
                                      searchTap: (query) {},
                                      buttonTap: () {
                                        controller.clearDataFunction();
                                        _showAddEditDialog(context: context, title: "إضافة شهادات جديدة");
                                      },
                                      buttonName: 'إضافة شهادات جديدة',
                                    ),
                                    const SizedBox(height: 16),
                                    Obx(
                                      () => CommonTableWidget(
                                        width: width ?? MediaQuery.of(context).size.width - 260,
                                        listLength: controller.testimonialsList.length,
                                        dataColumn: const [
                                          DataColumn2(label: Center(child: CustomTblHeadText(text: "SL")), fixedWidth: 50),
                                          DataColumn2(label: CustomTblHeadText(text: "صورة")),
                                          DataColumn2(label: CustomTblHeadText(text: "اسم")),
                                          DataColumn2(label: CustomTblHeadText(text: "مهنة")),
                                          DataColumn2(label: CustomTblHeadText(text: "اقتبس")),
                                          DataColumn2(label: Center(child: CustomTblHeadText(text: "عمل")), fixedWidth: 100),
                                        ],
                                        dataRow: List.generate(
                                          controller.testimonialsList.length,
                                          (index) {
                                            var data = controller.testimonialsList[index];
                                            return DataRow(
                                              cells: [
                                                DataCell(CustomSelectableTextWidget(text: "${index + 1}")),
                                                DataCell(Image.network("${data.image}", width: 100, height: 100, fit: BoxFit.cover)),
                                                DataCell(CustomSelectableTextWidget(text: "${data.name.toString()}")),
                                                DataCell(CustomSelectableTextWidget(text: "${data.profession.toString()}")),
                                                DataCell(CustomSelectableTextWidget(text: "${data.quote.toString()}")),
                                                DataCell(
                                                  Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                            child: const Icon(Icons.edit, size: 20),
                                                            onTap: () {
                                                              controller.nameController.text = data.name.toString();
                                                              controller.professionController.text = data.profession.toString();
                                                              controller.quoteController.text = data.quote.toString();
                                                              controller.selectImage.value = data.image.toString();
                                                              _showAddEditDialog(context: context, title: "تحرير العميل");
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
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _showAddEditDialog({required BuildContext context, String? title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogue(
            title: title ?? "Add Client",
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: controller.fromKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(text: "صورة العميل"),
                      const SizedBox(height: 16),
                      ImagePick(
                        controller: controller,
                        title: "تحميل صورة العميل",
                      ),
                      const SizedBox(height: 16),
                      CommonField(
                        controller: controller.nameController,
                        text: 'اسم العميل',
                        hintText: 'أدخل اسم العميل',
                        validator: 'من فضلك، أدخل اسم العميل',
                        keyboardType: TextInputType.text,
                        validatorIcon: true,
                      ),
                      const SizedBox(width: 16),
                      CommonField(
                        controller: controller.professionController,
                        text: 'مهنة العميل',
                        hintText: 'أدخل مهنة العميل',
                        validator: 'من فضلك، أدخل مهنة العميل',
                        keyboardType: TextInputType.text,
                        validatorIcon: true,
                      ),
                      const SizedBox(width: 16),
                      CommonField(
                        controller: controller.quoteController,
                        text: 'اقتباس العميل',
                        minLines: 5,
                        hintText: 'أدخل عرض أسعار العميل',
                        validator: 'من فضلك، أدخل عرض أسعار العميل',
                        keyboardType: TextInputType.text,
                        validatorIcon: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            confirmButtonFunction: () {
              if(!controller.fromKey.currentState!.validate()){
                return;
              }
              EasyLoading.showSuccess("ناجح");
              Get.back();
            });
      },
    );
  }
}
