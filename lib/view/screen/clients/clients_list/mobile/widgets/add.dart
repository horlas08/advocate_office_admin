import 'package:advocateoffice/controller/ui/clients/clients.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ClientAddMobile extends StatelessWidget {
  ClientAddMobile({super.key, required this.controller});
  final ClientsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "إنشاء عميل",
          style: TextStyle(color: Colors.white),
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
                CommonField(
                  controller: controller.clientNameController,
                  text: 'اسم العميل',
                  hintText: 'أدخل اسم العميل',
                  validator: 'أدخل اسم العميل',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientFatherNameController,
                  text: 'اسم والد العميل',
                  hintText: 'أدخل اسم والد العميل',
                  validator: 'أدخل اسم والد العميل',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientPhoneNumberController,
                  text: 'رقم الهاتف',
                  hintText: 'أدخل رقم الهاتف',
                  validator: 'أدخل رقم الهاتف',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientAlternativeNumberController,
                  text: 'رقم الهاتف البديل',
                  hintText: 'أدخل رقم الهاتف البديل',
                  validator: 'أدخل رقم الهاتف البديل',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientMailController,
                  text: 'البريد الإلكتروني',
                  hintText: 'أدخل البريد الإلكتروني',
                  validator: 'أدخل البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientProfessionController,
                  text: 'المهنة',
                  hintText: 'أدخل المهنة',
                  validator: 'أدخل المهنة',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CommonDropDown(
                  context: context,
                  label: "اختر المنطقة",
                  value: controller.selectedDivision,
                  items: controller.testList,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedDivision.value = value;
                    }
                  },
                ),
                const SizedBox(height: 16),
                CommonDropDown(
                  context: context,
                  label: "اختر المديرية",
                  value: controller.selectedDistrict,
                  items: controller.testList,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedDistrict.value = value;
                    }
                  },
                ),
                const SizedBox(height: 16),
                CommonDropDown(
                  context: context,
                  label: "اختر الثانا",
                  value: controller.selectedThana,
                  items: controller.testList,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedThana.value = value;
                    }
                  },
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.clientVillageController,
                  text: 'القرية',
                  hintText: 'أدخل القرية',
                  validator: 'أدخل القرية',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 24),
                CustomButtonWidget(
                  buttonName: 'تأكيد',
                  onTap: () {
                    if (!controller.fromKey.currentState!.validate()) return;
                    Get.toNamed(RoutesName.caseCreate);
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
