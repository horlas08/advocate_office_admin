import 'package:advocateoffice/controller/ui/profile.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key, this.data, required this.controller});

  final data;
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    controller.fastNameController.text = data['firstName'].toString();
    controller.lastNameController.text = data["lastName"].toString();
    controller.phoneNumberController.text = data["phone"].toString();
    controller.mailController.text = data["email"].toString();
    controller.addressController.text = data["address"].toString();

    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: "Profile Edit",
          fontColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.fromKey,
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonField(
                  controller: controller.fastNameController,
                  validatorIcon: true,
                  text: 'Fast Name',
                  hintText: 'Enter Fast Name',
                  validator: 'Enter Fast Name',
                  keyboardType: TextInputType.name,
                ),
                CommonField(
                  controller: controller.lastNameController,
                  validatorIcon: true,
                  text: 'Last Name',
                  hintText: 'Enter Last Name',
                  validator: 'Enter Last Name',
                  keyboardType: TextInputType.name,
                ),
                CommonField(
                  controller: controller.phoneNumberController,
                  validatorIcon: true,
                  text: 'Phone Number',
                  hintText: 'Enter Phone Number',
                  validator: 'Enter Phone number',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                CommonField(
                  controller: controller.mailController,
                  validatorIcon: true,
                  text: 'E-Mail',
                  hintText: 'Enter E-Mail',
                  validator: 'Enter E-Mail',
                  keyboardType: TextInputType.emailAddress,
                ),
                CommonField(
                  controller: controller.addressController,
                  validatorIcon: true,
                  text: 'Address',
                  hintText: 'Enter  Address',
                  validator: 'Enter  Address',
                  keyboardType: TextInputType.text,
                ),
                SfDatePickerWidget(
                  selectedDate: controller.selectedDate,
                  title: 'Date of Birth',
                  maxDate: DateTime.now(),
                  onSelectionChanged: (args) {
                    if (args.value is DateTime) {
                      controller.updateSelectedDate(args.value);
                      Navigator.pop(context);
                    }
                  },
                ),
                CustomButtonWidget(buttonName: "Update", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
