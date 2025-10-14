import 'package:advocateoffice/controller/ui/expense.dart';
import 'package:advocateoffice/model/exp_model.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseEditMobile extends StatelessWidget {
  ExpenseEditMobile({super.key, required this.controller, required this.data});
  final ExpenseController controller;
  final ExpenseDataModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(text: "تعديل النفقة", fontColor: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).focusColor,
          padding: const EdgeInsets.all(12),
          child: Form(
            key: controller.fromKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(text: "صورة الإيصال"),
                ImagePick(controller: controller),
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
                Align(
                  alignment: Alignment.center,
                  child: CustomButtonWidget(
                    onTap: () {},
                    buttonName: 'إرسال',
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
