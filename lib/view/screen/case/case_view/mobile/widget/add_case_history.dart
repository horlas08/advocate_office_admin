import 'package:advocateoffice/controller/ui/case/case_view.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/date_picker.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseHistoryCreateMobile extends StatelessWidget {
  CaseHistoryCreateMobile({super.key, required this.controller});
  final CaseViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: "إنشاء سجل الحالة",
          fontColor: Colors.white,
        ),
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
                const SizedBox(height: 20),
                CustomTextWidget(text: "مرفق القضية"),
                const SizedBox(height: 10),
                ImagePick(
                  controller: controller,title: "إضافة وثائق الحالة",
                ),
                const SizedBox(height: 25),
                SfDatePickerWidget(
                  selectedDate: controller.selectedDate,
                  title: 'تاريخ الجلسة',
                  maxDate: DateTime(2030),
                  onSelectionChanged: (args) {
                    if (args.value is DateTime) {
                      controller.selectedDate.value = args.value;
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.activityController,
                  text: 'النشاط',
                  hintText: 'أدخل النشاط',
                  validator: 'من فضلك، أدخل النشاط',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.courtDictionController,
                  text: 'انطباع المحكمة',
                  hintText: 'أدخل كلام المحكمة',
                  validator: 'الرجاء إدخال قيمة صالحة',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.commentController,
                  text: 'تعليق',
                  hintText: 'أدخل التعليق',
                  validator: 'من فضلك أدخل التعليق',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: CustomButtonWidget(
                    buttonName: 'عرض',
                    onTap: () {Get.back();},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
