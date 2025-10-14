import 'package:advocateoffice/controller/ui/visitor.dart';
import 'package:advocateoffice/model/visitor.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VisitorEdit extends StatelessWidget {
  VisitorEdit({
    super.key,
    required this.data,
  });
  final VisitorModel data;
  final VisitorController controller = Get.put(VisitorController());

  @override
  Widget build(BuildContext context) {
    controller.visitorNameController.text = data.name.toString();
    controller.visitorNumberController.text = data.phone.toString();
    controller.selectPriority.value = data.priority.toString();
    controller.amountController.text = data.fee.toString();
    return Scaffold(
      appBar: AppBar(title: const Text("تحديث الزائر")),
      body: SingleChildScrollView(
        child: Form(
          key: controller.fromKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonField(
                  controller: controller.visitorNameController,
                  text: 'اسم الزائر',
                  hintText: 'أدخل اسم الزائر',
                  validator: 'أدخل اسم الزائر',
                  keyboardType: TextInputType.name,
                ),
                CommonField(
                  controller: controller.visitorNumberController,
                  text: 'رقم الزائر',
                  hintText: 'أدخل رقم الزائر',
                  validator: 'أدخل رقم الزائر',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                CommonDropDown(
                    context: context,
                    label: "نوع القضية",
                    value: controller.selectCaseType,
                    items: controller.caseTypeList,
                    onChanged: (value) {
                      controller.selectCaseType.value = value!;
                    }),
                CommonField(
                  controller: controller.amountController,
                  text: 'رسوم القضية',
                  hintText: 'أدخل رسوم الحالة',
                  validator: 'أدخل رسوم الحالة',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                CommonDropDown(
                    context: context,
                    label: "الأولوية",
                    value: controller.selectPriority,
                    items: controller.priorityList,
                    onChanged: (value) {
                      controller.selectPriority.value = value!;
                    }),
                CommonField(
                  controller: controller.referenceNamePhoneController,
                  text: 'الاسم المرجعي والهاتف',
                  hintText: 'أدخل الاسم المرجعي والهاتف',
                  validator: 'أدخل الاسم المرجعي والهاتف',
                  keyboardType: TextInputType.text,
                ),
                CommonField(
                  minLines: 5,
                  controller: controller.amountController,
                  text: 'تعليق',
                  hintText: 'أدخل الملاحظات',
                  validator: 'أدخل الملاحظات',
                  keyboardType: TextInputType.text,
                ),
                CustomButtonWidget(
                  buttonName: 'أكد',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
