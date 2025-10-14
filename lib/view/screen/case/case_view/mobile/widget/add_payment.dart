import 'package:advocateoffice/controller/ui/case/case_view.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentCreateMobile extends StatelessWidget {
  PaymentCreateMobile({super.key, required this.controller});
  final CaseViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Payment"),
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
                CommonField(
                  controller: controller.caseIdController,
                  text: 'معرّف القضية',
                  hintText: 'أدخل معرف القضية',
                  validator: 'الرجاء إدخال معرف القضية',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
                CommonDropDown(
                  context: context,
                  label: "Select Payment Type",
                  value: controller.selectedPaymentType,
                  items: controller.paymentTypeList,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedPaymentType.value = value;
                    }
                  },
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.commentController,
                  text: 'Comment',
                  hintText: 'Enter Comment',
                  validator: 'Please, Enter Comment',
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: CustomButtonWidget(
                    buttonName: 'حفظ',
                    onTap: () {},
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
