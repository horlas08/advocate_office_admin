// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/date_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:advocateoffice/controller/ui/profile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';

class ProfileScreenDesktopTablet extends StatelessWidget { 
  final ProfileController controller;
  const ProfileScreenDesktopTablet({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBarView(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DashboardHeader(title: 'مظهر جانبي'),
                    const SizedBox(height: 20),
                    _buildProfileHeader(),
                    const SizedBox(height: 20),
                    _buildPersonalInfoSection(context),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          child: FittedBox(
                              child: Obx(() => Checkbox(
                                  activeColor: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .color,
                                  checkColor: Theme.of(context).cardColor,
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .color!),
                                  value: controller.isShowPassword.value,
                                  onChanged: (value) {
                                    controller.toggleShowPassword();
                                  }))),
                        ),
                        CustomTextWidget(
                          text: "تغيير كلمة المرور",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => controller.isShowPassword.isTrue
                          ? _buildUpdatePassword()
                          : SizedBox(),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Center(
              child: Stack(
                children: [
                  Obx(() {
                    return CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blueAccent,
                      child: CircleAvatar(
                        radius: 58,
                        backgroundImage: controller.image.value == null
                            ? const NetworkImage(
                                "https://img.icons8.com/?size=100&id=52232&format=png&color=000000")
                            : kIsWeb
                                ? MemoryImage(controller.image.value!)
                                : FileImage(File(controller.imagePath.value!)),
                      ),
                    );
                  }),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        controller.pickImage(); // Open image picker
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.blueAccent,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: "Md. Abdullah Al Siddik",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomTextWidget(text: "Admin"),
                CustomTextWidget(text: "Criminal Law Expert"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoSection(context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width - 230,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "Personal Information",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        showAddEditDialog(
                            context: context, isEditSection: true);
                      }),
                ],
              ),
              Wrap(
                children: [
                  _buildEditableField(
                    "First Name",
                    "Md. Abdullah Al",
                  ),
                  _buildEditableField(
                    "Last Name",
                    "Siddik",
                  ),
                  _buildEditableField(
                    "Profession",
                    "Lawyer",
                  ),
                  _buildEditableField(
                    "Designation",
                    "Criminal Law Export",
                  ),
                  _buildEditableField(
                    "Role",
                    "Admin",
                  ),
                  _buildEditableField(
                    "Joining Date",
                    "10 Oct 2022",
                  ),
                  _buildEditableField(
                    "Salary",
                    "1,00,000 $currencySymbol",
                  ),
                  _buildEditableField(
                    "Email Address",
                    "mabdullahalsiddik@gmail.com",
                  ),
                  _buildEditableField(
                    "Phone Number",
                    "01737374083",
                  ),
                  _buildEditableField(
                    "Date of Birth",
                    "10 Oct 2004",
                  ),
                  _buildEditableField(
                    "Address",
                    "Uttara",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpdatePassword() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 20,
              children: [
                SizedBox(
                  width: 300,
                  child: CommonField(
                    controller: controller.currentPasswordController,
                    validatorIcon: true,
                    text: 'Current Password',
                    hintText: 'Current Password',
                    validator: 'Enter Current Password',
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: CommonField(
                    controller: controller.newPasswordController,
                    validatorIcon: true,
                    text: 'New Password',
                    hintText: 'New Password',
                    validator: 'Enter New Password',
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: CommonField(
                    controller: controller.newPasswordConfirmController,
                    validatorIcon: true,
                    text: 'New أكد Password',
                    hintText: 'New أكد Password',
                    validator: 'New أكد Password',
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: 100,
                    child:
                        CustomButtonWidget(buttonName: "Update", onTap: () {})),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, String value) {
    return SizedBox(
      width: 240,
      child: ListTile(
        title: CustomTextWidget(text: label, fontWeight: FontWeight.bold),
        subtitle: CustomTextWidget(text: value),
      ),
    );
  }

  void showAddEditDialog(
      {required BuildContext context,
      required bool isEditSection,
      String? id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogue(
          title: "Edit Profile",
          body: SingleChildScrollView(
            child: Container(
              width: 700,
              padding: const EdgeInsets.all(24),
              child: Form(
                key: controller.fromKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            controller: controller.fastNameController,
                            validatorIcon: true,
                            text: 'Fast Name',
                            hintText: 'Enter Fast Name',
                            validator: 'Enter Fast Name',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.lastNameController,
                            validatorIcon: true,
                            text: 'Last Name',
                            hintText: 'Enter Last Name',
                            validator: 'Enter Last Name',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
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
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonField(
                            controller: controller.mailController,
                            validatorIcon: true,
                            text: 'E-Mail',
                            hintText: 'Enter E-Mail',
                            validator: 'Enter E-Mail',
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CommonField(
                            controller: controller.addressController,
                            validatorIcon: true,
                            text: 'Address',
                            hintText: 'Enter  Address',
                            validator: 'Enter  Address',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: SfDatePickerWidget(
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          confirmButtonFunction: () {
            if (!controller.fromKey.currentState!.validate()) {
              controller.fromKey.currentState!.validate();
              return;
            }
          },
        );
      },
    );
  }
}
