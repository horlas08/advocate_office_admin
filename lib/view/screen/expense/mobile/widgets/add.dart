import 'package:advocateoffice/controller/ui/expense.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExpenseCreateMobile extends StatelessWidget {
  ExpenseCreateMobile({super.key, required this.controller});
  final ExpenseController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(text: "إنشاء النفقة"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).focusColor,
          padding: const EdgeInsets.all(12),
          child: Form(
            key: controller.fromKey,
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: "صورة الإيصال",
                      fontColor: Theme.of(context).textTheme.bodyMedium!.color!,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextWidget(
                          text: "نفقة القضية", //case expense
                          fontColor:
                              Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                        Obx(() {
                          return Checkbox(
                            activeColor:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            checkColor: Theme.of(context).cardColor,
                            side: BorderSide(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color!),
                            value: controller.isChecked.value,
                            onChanged: (value) {
                              controller.isChecked.value = value!;
                            },
                          );
                        }),
                      ],
                    ),
                  ],
                ),
                ImagePick(controller: controller),
                Obx(() => controller.isChecked.value
                    ? CommonDropDown(
                        context: context,
                        label: "حدد معرف الحالة",
                        value: controller.selectedCaseID,
                        items: controller.caseIdList,
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedCaseID.value = value;
                          }
                        },
                      )
                    : CommonDropDown(
                        context: context,
                        label: "حدد الغرض", //Select Purpose
                        value: controller.selectedPurposeOf,
                        items: controller.purposeList,
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedPurposeOf.value = value;
                          }
                        },
                      )),
                CommonField(
                  controller: controller.amountController,
                  text: 'المبلغ',
                  hintText: 'أدخل المبلغ',
                  validator: 'من فضلك، أدخل المبلغ',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                CommonField(
                  controller: controller.commentController,
                  minLines: 5,
                  text: 'تعليق',
                  hintText: 'أدخل التعليق',
                  validator: 'من فضلك، أدخل التعليق',
                  keyboardType: TextInputType.text,
                ),
                CustomButtonWidget(
                  onTap: () {
                    Get.back();
                  },
                  buttonName: 'تأكيد',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
