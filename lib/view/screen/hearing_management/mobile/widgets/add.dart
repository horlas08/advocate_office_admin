import 'dart:developer';
import 'package:advocateoffice/controller/ui/hearing_management.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/date_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HearingManagementAddMobile extends StatelessWidget {
  HearingManagementAddMobile(
      {super.key,
      required this.controller,
      required this.isAddSection,
      this.id});
  final HearingManagementController controller;

  final bool isAddSection;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: const CustomTextWidget(
            text: "الجلسة",
            fontColor: Colors.white,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.fromKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonDropDown(
                  context: context,
                  label: "اختر رقم القضية",
                  value: controller.selectCaseId,
                  items: controller.caseIdList,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectCaseId.value = value;
                    }
                  },
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientNameController,
                  readOnly: true,
                  text: 'اسم العميل',
                  hintText: 'أدخل اسم العميل',
                  validator: 'الرجاء إدخال اسم العميل',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientNumberController,
                  readOnly: true,
                  text: 'رقم هاتف العميل',
                  hintText: 'أدخل رقم هاتف العميل',
                  validator: 'الرجاء إدخال رقم هاتف العميل',
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 16),
                SfDatePickerWidget(
                  selectedDate: controller.selectedDate,
                  title: 'اختر تاريخ الجلسة',
                  maxDate: DateTime(2030),
                  onSelectionChanged: (args) {
                    if (args.value is DateTime) {
                      controller.updateSelectedDate(args.value);
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 16),
                CommonDropDown(
                  context: context,
                  label: "اختر المحكمة",
                  value: controller.selectedCourt,
                  items: controller.courtList,
                  borderColor:
                      controller.isDropdownError.isTrue ? Colors.red : null,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedCourt.value = value;
                      log("message :${controller.selectedCourt.value}");
                      controller.isDropdownError.value = false;
                    }
                  },
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.commentController,
                  text: 'ملاحظة',
                  minLines: 5,
                  hintText: 'اكتب بعض النص......',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  buttonName: 'أكد',
                  onTap: () {
                    if (!controller.fromKey.currentState!.validate()) {
                      controller.fromKey.currentState!.validate();
                      return;
                    }
                    if (controller.selectedCourt.value == "") {
                      controller.isDropdownError.value = true;
                      return;
                    }
                    isAddSection
                        ? controller.addHearingManagement()
                        : controller.updateHearingManagement(id: id.toString());
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
