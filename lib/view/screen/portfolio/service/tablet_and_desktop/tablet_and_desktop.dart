// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:advocateoffice/controller/ui/portfolio/service.dart';
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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:get/get.dart';

class ServiceScreenDesktopTablet extends StatelessWidget {
  const ServiceScreenDesktopTablet({
    Key? key,
    required this.controller,
    this.width,
  }) : super(key: key);
  final ServiceController controller;
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
                            const DashboardHeader(title: 'خدماتنا'),
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
                                        _showAddEditDialog(
                                            context: context,
                                            title: "اضافة خدمة جديدة");
                                      },
                                      buttonName: 'اضافة خدمة',
                                    ),
                                    const SizedBox(height: 16),
                                    Obx(
                                      () => CommonTableWidget(
                                        width: width ??
                                            MediaQuery.of(context).size.width -
                                                260,
                                        listLength:
                                            controller.serviceList.length,
                                        dataColumn: const [
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "SL")),
                                              fixedWidth: 50),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "الصورة")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "الأيقونة")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "العنوان")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "الوصف")),
                                          DataColumn2(
                                              fixedWidth: 100,
                                              label: CustomTblHeadText(
                                                  text: "الحالة")),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "الإجراءات")),
                                              fixedWidth: 100),
                                        ],
                                        dataRow: List.generate(
                                          controller.serviceList.length,
                                          (index) {
                                            var data =
                                                controller.serviceList[index];
                                            return DataRow(cells: [
                                              DataCell(
                                                  CustomSelectableTextWidget(
                                                      text: "${index + 1}")),
                                              DataCell(Image.network(
                                                "${data.image}",
                                                width: 100,
                                                height: 100,
                                              )),
                                              DataCell(CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey.shade300,
                                                  backgroundImage: NetworkImage(
                                                    "${data.icon}",
                                                  ))),
                                              DataCell(CustomSelectableTextWidget(
                                                  text:
                                                      "${data.title.toString()}")),
                                              DataCell(CustomSelectableTextWidget(
                                                  text: "${data.description}")),
                                              DataCell(
                                                  CustomSelectableTextWidget(
                                                      text: data.status == 1
                                                          ? "نشط"
                                                          : "غير نشط")),
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
                                                                .initialDataFunction(
                                                                    data: data);

                                                            controller
                                                                    .titleController
                                                                    .text =
                                                                data.title
                                                                    .toString();
                                                            controller
                                                                    .descriptionController
                                                                    .text =
                                                                data.description
                                                                    .toString();

                                                            controller
                                                                    .selectImage
                                                                    .value =
                                                                data.image
                                                                    .toString();
                                                            controller
                                                                    .selectIcon
                                                                    .value =
                                                                data.icon
                                                                    .toString();
                                                            _showAddEditDialog(
                                                                context:
                                                                    context,
                                                                title:
                                                                    "Edit Service");
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

  Widget buildImage(String data) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image(
          image: NetworkImage(data),
          height: 50,
          width: 50,
        ),
      );

  void _showAddEditDialog({required BuildContext context, String? title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogue(
            title: title ?? "Add Service",
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: controller.fromKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(text: "Service Image"),
                      const SizedBox(height: 16),
                      ImagePick(
                        controller: controller,
                        title: "Upload Service Image",
                      ),
                      const SizedBox(height: 16),
                      CustomTextWidget(text: "Service Icon"),
                      const SizedBox(height: 16),
                      IconImagePick(
                        controller: controller,
                        title: "Upload Icon Image",
                      ),
                      const SizedBox(height: 16),
                      CommonField(
                        controller: controller.titleController,
                        text: 'Service Title',
                        hintText: 'Enter Service Title',
                        validator: 'Please, Enter Service Title',
                        keyboardType: TextInputType.text,
                        validatorIcon: true,
                      ),
                      const SizedBox(width: 16),
                      CommonField(
                        controller: controller.descriptionController,
                        text: 'Service Description',
                        minLines: 5,
                        hintText: 'Enter Service Description',
                        validator: 'Please ,Enter Service Description',
                        keyboardType: TextInputType.text,
                        validatorIcon: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            confirmButtonFunction: () {
              controller.addNewServiceFun();
            });
      },
    );
  }
}

class IconImagePick extends StatelessWidget {
  final controller;
  final String? title;

  const IconImagePick({
    Key? key,
    required this.controller,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          controller.pickIconImage();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (controller.selectIcon.value != null) {
                return Container(
                  height: 200,
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
                    child: Center(
                      child: Image.network(
                        controller.selectIcon.value!,
                      ),
                    ),
                  ),
                );
              }
              if (controller.iconImage.value == null) {
                return Container(
                  height: 200,
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
                    child: Center(
                      child: CustomTextWidget(
                        maxLine: 20,
                        text: title ?? "Upload Icon Image",
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .color!
                            .withAlpha(120),
                      ),
                    ),
                  ),
                );
              } else if (kIsWeb) {
                return Container(
                  height: 200,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Image.memory(controller.iconImage.value!)),
                  ),
                );
              } else {
                return Container(
                  height: 200,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child:
                            Image.file(File(controller.iconImagePath.value!))),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
