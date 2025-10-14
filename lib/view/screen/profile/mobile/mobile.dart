// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/profile/mobile/edit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:advocateoffice/controller/ui/profile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';

class ProfileScreenMobile extends StatelessWidget {
  final ProfileController controller;
  const ProfileScreenMobile({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'Profile'),
      ),
      drawer: NavigationBarViewMobile(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    text: "Change Password",
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
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
        width: MediaQuery.of(context).size.width,
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
                        
                      ),
                      onPressed: () {
                        Get.to(
                            ProfileEdit(
                              controller: controller,
                              data: {
                                "firstName": controller.fastNameController.text,
                                "lastName": controller.lastNameController.text,
                                "email": controller.mailController.text,
                                "phone": controller.phoneNumberController.text,
                                "address": controller.addressController.text,
                              },
                            ),
                            routeName: "${RoutesName.profile}/create");
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
}
