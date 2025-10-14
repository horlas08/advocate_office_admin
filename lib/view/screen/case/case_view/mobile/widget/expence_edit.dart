import 'package:advocateoffice/model/expense.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CaseExpenseEditMobile extends StatelessWidget {
  CaseExpenseEditMobile({super.key, required this.controller, required this.data});
  final controller;
  final ExpenseModel data;

  @override
  Widget build(BuildContext context) {
      controller.amountController.text = data.amount.toString();
    controller.commentController.text = data.comment.toString();

    controller.selectController.text = data.purposeOforCaseID.toString();
    controller.selectImage.value = data.image;
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(text: "Expense Edit" , fontColor: Colors.white,),
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
                CustomTextWidget(text: "Voucher Image"),
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
                Align(
                  alignment: Alignment.center,
                  child: CustomButtonWidget(
                    onTap: () {},
                    buttonName: 'Submit',
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
