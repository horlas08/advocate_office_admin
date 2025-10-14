import 'package:advocateoffice/controller/ui/portfolio/testimonials.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestimonialsMobileAddEdit extends StatelessWidget {
  TestimonialsMobileAddEdit(
      {super.key,
      required this.controller,
      required this.isAddSection,
      this.id});
  final TestimonialsController controller;

  final bool isAddSection;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(isAddSection ? "اضافة شهادة جديدة" : "تعديل الشهادة"),
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
                CustomTextWidget(text: "صورة العميل"),
                const SizedBox(height: 16),
                ImagePick(
                  controller: controller,
                  title: "رفع صورة العميل",
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.nameController,
                  text: 'اسم العميل',
                  hintText: 'ادخل اسم العميل',
                  validator: 'الرجاء إدخال اسم العميل',
                  keyboardType: TextInputType.text,
                  validatorIcon: true,
                ),
                const SizedBox(width: 16),
                CommonField(
                  controller: controller.professionController,
                  text: 'مهنة العميل',
                  hintText: 'ادخل مهنة العميل',
                  validator: 'الرجاء إدخال مهنة العميل',
                  keyboardType: TextInputType.text,
                  validatorIcon: true,
                ),
                const SizedBox(width: 16),
                CommonField(
                  controller: controller.quoteController,
                  text: 'اقتباس العميل',
                  minLines: 5,
                  hintText: 'ادخل اقتباس العميل',
                  validator: 'الرجاء إدخال اقتباس العميل',
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
