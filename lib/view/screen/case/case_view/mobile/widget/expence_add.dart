import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CaseExpenseCreateMobile extends StatelessWidget {
  CaseExpenseCreateMobile({super.key, required this.controller, required this.id});
  final controller;
  final id;

  @override
  Widget build(BuildContext context) {
       controller.selectController.text = id.toString();
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(text: "Expense Create"),
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
                CustomTextWidget(
                  text: "Voucher Image",
                  fontColor: Theme.of(context).textTheme.bodyMedium!.color!,
                ),
                ImagePick(
                  controller: controller,
                ),
                 CommonField(
                      controller: controller.selectController,
                      text: 'معرّف القضية',
                      readOnly: true,
                      hintText: 'معرّف القضية',
                    ),
                CommonField(
                  controller: controller.amountController,
                  text: 'Amount',
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
                  text: 'Comment',
                  hintText: 'Enter comment',
                  validator: 'Please, Enter comment',
                  keyboardType: TextInputType.text,
                ),
                CustomButtonWidget(
                  onTap: () {},
                  buttonName: 'أكد',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
