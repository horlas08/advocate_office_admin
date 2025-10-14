import 'package:advocateoffice/controller/ui/payment_invoice/monye.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExtraIncomeCreateMobile extends StatelessWidget {
  ExtraIncomeCreateMobile({super.key, required this.controller});
  final controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: "إنشاء دخل إضافي",
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
                CommonDropDown(
                  context: context,
                  label: "حدد معرف القضية",
                  value: controller.selectCaseId,
                  items: controller.caseIdList,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectCaseId.value = value;
                    }
                  },
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientNameController,
                  readOnly: true,
                  text: 'اسم العميل',
                  hintText: 'أدخل اسم العميل',
                  validator: 'من فضلك، أدخل اسم العميل',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientNumberController,
                  readOnly: true,
                  text: 'هاتف العميل',
                  hintText: 'أدخل رقم هاتف العميل',
                  validator: 'من فضلك، أدخل رقم هاتف العميل',
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
                  validator: 'من فضلك، أدخل مبلغ الرسوم',
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
                  label: "حدد طريقة الدفع",
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
                  text: 'ملاحظة',
                  hintText: 'أدخل الملاحظة',
                  validator: 'من فضلك، أدخل الملاحظة',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  width: MediaQuery.of(context).size.width,
                  onTap: () async {
                    await PaymentReceiptPdf().generateTwoReceipts(
                      {
                        "mrNo": "12345",
                        "date": "2024-12-22",
                        "name": "Md. Abdullah Al Siddik",
                        "contact": "01737374083",
                        "caseId": "CASE1001",
                        "caseType": "Civil",
                        "paymentMethod": "Bkash",
                        "amount": "500000.00",
                      },
                    );
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
