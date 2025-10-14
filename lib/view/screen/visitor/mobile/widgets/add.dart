
import 'package:advocateoffice/controller/ui/visitor.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VisitorAddMobile extends StatelessWidget {
  VisitorAddMobile({super.key, required this.controller});
  final VisitorController controller ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const CustomTextWidget( text:"إنشاء زائر" , fontColor: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).focusColor,
          width: 700,
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.fromKey,
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
        
                CommonDropDown(
                    context: context,
                    label: "حالة",
                    value: controller.selectCondition,
                    items: controller.conditionList,
                    onChanged: (value) {
                      controller.selectCondition.value = value!;
                    }),
              CommonField(
                          controller: controller.referenceNamePhoneController,
                          text: 'الاسم المرجعي والهاتف',
                          hintText: 'أدخل الاسم المرجعي والهاتف',
                          validator: 'أدخل الاسم المرجعي والهاتف',
                          keyboardType: TextInputType.text,
                        ),
                CommonDropDown(
                    context: context,
                    label: "الأولوية",
                    value: controller.selectPriority,
                    items: controller.priorityList,
                    onChanged: (value) {
                      controller.selectPriority.value = value!;
                    }),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  buttonName: 'أكد',
                  onTap: () {
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
