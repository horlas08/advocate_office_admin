import 'package:advocateoffice/controller/ui/fee_received.dart';
import 'package:advocateoffice/model/payment_list.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeeEditMobile extends StatelessWidget {
  FeeEditMobile({super.key, required this.controller, required this.data});
  final FeeReceivedController controller;
  final PaymentListModel data;

  @override
  Widget build(BuildContext context) {
    controller.clientNameController.text = data.clientName.toString();
    controller.clientNumberController.text = data.clientPhone.toString();
    controller.feeController.text = data.receivedAmount.toString();
    controller.remarkController.text = data.remark.toString();
    TextEditingController caseIdController =
        TextEditingController(text: data.caseID.toString());
    controller.selectedPaymentType.value = data.paymentMethod.toString();
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: "تعديل دفعة",
          fontColor: Colors.white,
        ),
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
                const SizedBox(height: 20),
                CommonField(
                  controller: caseIdController,
                  readOnly: true,
                  text: 'رقم القضية',
                  hintText: 'أدخل رقم القضية',
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientNameController,
                  readOnly: true,
                  text: 'اسم العميل',
                  hintText: 'أدخل اسم العميل',
                  validator: 'الرجاء إدخال اسم العميل',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientNumberController,
                  readOnly: true,
                  text: 'رقم هاتف العميل',
                  hintText: 'أدخل رقم هاتف العميل',
                  validator: 'الرجاء إدخال رقم هاتف العميل',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.feeController,
                  text: 'مبلغ الرسوم',
                  hintText: 'أدخل مبلغ الرسوم',
                  validator: 'الرجاء إدخال مبلغ الرسوم',
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
                  label: "اختر طريقة الدفع",
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
                  controller: controller.remarkController,
                  minLines: 5,
                  text: 'تعليق',
                  hintText: 'أدخل تعليقًا',
                  validator: 'الرجاء إدخال تعليق',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
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
