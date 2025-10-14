import 'dart:developer';
import 'package:advocateoffice/controller/ui/settings/case_sections.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseSectionAddMobile extends StatelessWidget {
  CaseSectionAddMobile(
      {super.key,
      required this.controller,
      required this.isAddSection,
      this.id});
  final CaseSectionsController controller;
  final bool isAddSection;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Case Section"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).focusColor,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.fromKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonField(
                  controller: controller.caseSectionCode,
                  text: 'Case Section Code',
                  hintText: 'Enter Case Section code here.',
                  validator: "Case Section code can't Empty.!",
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 16),
                CommonField(
                  controller: controller.caseSectionDetails,
                  text: 'Case Section Details',
                  hintText: 'Enter Case Section Details.',
                  validator: "Case Section Details can't Empty.!",
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Obx(
                      () => Expanded(
                        child: Container(
                          child: CommonDropDown(
                            context: context,
                            label: "Select Case Category",
                            value: controller.selectCaseCategory,
                            items: controller.caseCategoryList,
                            borderColor: controller.isDropdownError.isTrue
                                ? Colors.red
                                : null,
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectCaseCategory.value = value;
                                log("message :${controller.selectCaseCategory.value}");
                                controller.isDropdownError.value = false;
                              }
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  buttonName: 'أكد',
                  onTap: () {
                    if (!controller.fromKey.currentState!.validate()) {
                      controller.fromKey.currentState!.validate();
                      return;
                    }
                    if (controller.selectCaseCategory.value == "") {
                      controller.isDropdownError.value = true;
                      return;
                    }
                    isAddSection
                        ? controller.addCaseSection()
                        : controller.updateCaseSection(id: id ?? 0);
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
