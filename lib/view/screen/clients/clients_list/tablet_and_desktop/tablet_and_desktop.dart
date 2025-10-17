import 'dart:developer';

import 'package:advocateoffice/controller/ui/clients/clients.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ClientsTabletDesktop extends StatelessWidget {
  ClientsTabletDesktop({super.key, required this.controller, this.width});
  final ClientsController controller;
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DashboardHeader(title: 'العملاء'),
                      const SizedBox(height: 20),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SearchAndAddSectionWidget(
                                buttonName: 'موكل جديد',
                                totalData:
                                "إجمالي العملاء: ${controller.clientsList.length}",
                                searchController: controller.nameSearchController,
                                searchTap: (query) {},
                                buttonTap: () {
                                  controller.clearField();
                                  showAddEditDialog(
                                    context: context,
                                    isEditSection: false,
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              Obx(
                                    () => CommonTableWidget(
                                  width: width ?? MediaQuery.of(context).size.width - 220,
                                  listLength: controller.filteredClientsList.length,
                                  dataColumn: const [
                                    DataColumn2(
                                        label: Center(child: CustomTblHeadText(text: "م")),
                                        fixedWidth: 50),
                                    DataColumn2(
                                        label: Center(child: CustomTblHeadText(text: "الرقم المدنى")),
                                        fixedWidth: 120),
                                    DataColumn2(label: CustomTblHeadText(text: "اسم الموكل")),
                                    DataColumn2(label: CustomTblHeadText(text: "الاسم الأخير")),
                                    DataColumn2(label: CustomTblHeadText(text: "المهنة")),
                                    DataColumn2(label: CustomTblHeadText(text: "المهنة")),
                                    DataColumn2(label: CustomTblHeadText(text: "البريد الإلكتروني")),
                                    DataColumn2(
                                        label: Center(child: CustomTblHeadText(text: "الدعاوي")),
                                        fixedWidth: 100),
                                    DataColumn2(label: CustomTblHeadText(text: "أنشئ بواسطة")),
                                    DataColumn2(
                                        label: Center(child: CustomTblHeadText(text: "التفاصيل")),
                                        fixedWidth: 150),
                                  ],
                                  dataRow: List.generate(
                                    controller.filteredClientsList.length,
                                        (index) {
                                      var data = controller.filteredClientsList[index];
                                      return DataRow(
                                        cells: [
                                          DataCell(CustomSelectableTextWidget(text: "${index + 1}")),
                                          DataCell(Center(child: CustomSelectableTextWidget(text: "${data.id}"))),
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
                                                  GestureDetector(
                                                    child: const Icon(Icons.remove_red_eye),
                                                    onTap: () {
                                                      Get.toNamed('${Get.currentRoute}${RoutesName.clientDetails}');
                                                    },
                                                  ),
                                                  const SizedBox(width: 10),
                                                  GestureDetector(
                                                    child: Icon(Icons.edit, color: Theme.of(context).iconTheme.color),
                                                    onTap: () async {
                                                      await controller.setData(myData: data);
                                                      showAddEditDialog(
                                                          context: context,
                                                          isEditSection: true,
                                                          id: data.id);
                                                    },
                                                  ),
                                                  const SizedBox(width: 10),
                                                  GestureDetector(
                                                    child: Icon(Icons.delete, size: 20, color: AppColors.errorColor),
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) => CustomAlertDialogue(
                                                          title: "تأكيد الحذف",
                                                          body: CustomTextWidget(text: "هل أنت متأكد من حذف هذا العميل؟"),
                                                          confirmButtonName: "حذف",
                                                          confirmButtonFunction: () {
                                                            Get.back();
                                                          },
                                                        ),
                                                      );
                                                    },
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

  void showAddEditDialog({required BuildContext context, required bool isEditSection, String? id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogue(
          title: isEditSection ? "تعديل العميل" : "إنشاء العميل",
          body: SingleChildScrollView(
            child: Container(
              width: 700,
              padding: const EdgeInsets.all(24),
              child: Form(
                key: controller.fromKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            controller: controller.clientNameController,
                            validatorIcon: true,
                            text: 'اسم الموكل',
                            hintText: 'أدخل اسم الموكل',
                            validator: 'أدخل اسم الموكل',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.clientFatherNameController,
                            validatorIcon: true,
                            text: 'الاسم الأخير',
                            hintText: 'أدخل اسم الأخير',
                            validator: 'أدخل اسم الأخير',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            controller: controller.clientPhoneNumberController,
                            validatorIcon: true,
                            text: 'رقم الهاتف',
                            hintText: 'أدخل رقم الهاتف',
                            validator: 'أدخل رقم الهاتف',
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.clientAlternativeNumberController,
                            text: 'رقم الهاتف الموكل',
                            hintText: 'أدخل رقم الهاتف الموكل',
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            controller: controller.clientMailController,
                            validatorIcon: true,
                            text: 'البريد الإلكتروني',
                            hintText: 'أدخل البريد الإلكتروني',
                            validator: 'أدخل البريد الإلكتروني',
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.clientProfessionController,
                            validatorIcon: true,
                            text: 'المهنةالموكل',
                            hintText: 'أدخل المهنةالموكل',
                            validator: 'أدخل المهنةالموكل',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            controller: controller.extra1,
                            text: "المنطقة الادارية",
                            validatorIcon: true,
                            hintText: 'اكتب اسم المنطقة',
                            validator: 'أدخل المنطقة الادارية',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.extra2,
                            text: "،الولاية",
                            validatorIcon: true,
                            hintText: 'اكتب اسم الولاية',
                            validator: 'أدخل اكتب اسم الولاية',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            controller: controller.extra3,
                            text: "ا- المنطقة الفرعية / القرية",
                            validatorIcon: true,
                            hintText: 'اكتب اسم المنطقة الفرعية',
                            validator: 'أدخل اكتب اسم المنطقة الفرعية',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.clientVillageController,
                            validatorIcon: true,
                            text: 'صفة الموكل',
                            hintText: 'اكتب صفة الموكل',
                            validator: 'اكتب صفة الموكل',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          confirmButtonFunction: () {
            if (!controller.fromKey.currentState!.validate()) return;
            isEditSection
                ? controller.editSection(id: id ?? "")
                : Get.toNamed(RoutesName.caseCreate);
          },
        );
      },
    );
  }
}
