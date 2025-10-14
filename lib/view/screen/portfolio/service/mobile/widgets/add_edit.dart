import 'package:advocateoffice/controller/ui/portfolio/service.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:advocateoffice/view/screen/portfolio/service/tablet_and_desktop/tablet_and_desktop.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceScreenMobileAddEdit extends StatelessWidget {
  ServiceScreenMobileAddEdit(
      {super.key,
      required this.controller,
      required this.isAddSection,
      this.id});
  final ServiceController controller;

  final bool isAddSection;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الخدمة"),
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
                CustomTextWidget(text: "صورة الخدمة"),
                const SizedBox(height: 16),
                ImagePick(
                  controller: controller,
                  title: "Upload Service Image",
                ),
                const SizedBox(height: 16),
                CustomTextWidget(text: "أيقونة الخدمة"),
                const SizedBox(height: 16),
                IconImagePick(
                  controller: controller,
                  title: "Upload Icon Image",
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.titleController,
                  text: 'عنوان الخدمة',
                  hintText: 'ادخل عنوان الخدمة',
                  validator: 'الرجاء إدخال عنوان الخدمة',
                  keyboardType: TextInputType.text,
                  validatorIcon: true,
                ),
                const SizedBox(width: 16),
                CommonField(
                  controller: controller.descriptionController,
                  text: 'وصف الخدمة',
                  minLines: 5,
                  hintText: 'ادخل وصف الخدمة',
                  validator: 'الرجاء إدخال وصف الخدمة',
                  keyboardType: TextInputType.text,
                  validatorIcon: true,
                ),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  buttonName: 'تأكيد',
                  onTap: () {
                    if (!controller.fromKey.currentState!.validate()) {
                      controller.fromKey.currentState!.validate();
                      return;
                    }

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
