import 'package:advocateoffice/controller/ui/case/case_add.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_text_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/screen/case/case_add/image_card.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:advocateoffice/view/screen/case/case_add/witness_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CaseCreateFieldDesktop extends StatelessWidget {
  CaseCreateFieldDesktop({super.key, required this.controller, this.width, this.buttonWidth});
  final CaseCreateController controller;

  final double? width;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).focusColor,
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "تفاصيل القضية",
                      fontSize: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 16,
                  children: [
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width / 5,
                      child: CommonDropDown(
                        context: context,
                        label: "اختر نوع العميل",
                        value: controller.selectedClientType,
                        items: controller.clientTypeList,
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedClientType.value = value;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width / 5,
                      child: CommonDropDown(
                        context: context,
                        label: "اختر نوع القضية",
                        value: controller.selectedCaseType,
                        items: controller.caseTypeList,
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedCaseType.value = value;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width / 5,
                      child: CommonDropDown(
                        context: context,
                        label: "اختر المحكمة",
                        value: controller.selectedCourt,
                        items: controller.courtList,
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedCourt.value = value;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width / 5,
                      child: CommonField(
                        controller: controller.branchController,
                        text: 'فرع المحكمة',
                        hintText: 'فرع المحكمة',
                        validator: 'فرع المحكمة',
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width / 5,
                      child: CommonDropDown(
                        context: context,
                        label: "اختر مرحلة القضية",
                        value: controller.selectCaseStage,
                        items: controller.caseStageList,
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectCaseStage.value = value;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width / 5,
                      child: CommonField(
                        controller: controller.oppositionNameController,
                        text: 'الاسم الكامل للخصم',
                        hintText: 'الاسم الكامل للخصم',
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width / 5,
                      child: CommonField(
                        controller: controller.oppositionPhoneController,
                        text: 'رقم هاتف الخصم',
                        hintText: 'رقم هاتف الخصم',
                        validator: 'رقم هاتف الخصم',
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width / 5,
                      child: CommonField(
                        controller: controller.feeController,
                        text: 'الأتعاب',
                        hintText: 'الأتعاب',
                        validator: 'الأتعاب',
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      width: width ?? MediaQuery.of(context).size.width / 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TagFiledWidget(controller: controller),
                          Obx(
                                () => Wrap(
                              spacing: 2,
                              children: controller.selectedCaseSectionList.map((id) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Chip(
                                    label: CustomTextWidget(text: id, fontSize: 12),
                                    deleteIcon: Icon(Icons.delete_forever),
                                    onDeleted: () {
                                      controller.selectedCaseSectionList.remove(id);
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        showAddWitnessDialog(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Theme.of(context).textTheme.headlineMedium!.color!),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                ),
                                SizedBox(width: 8),
                                CustomTextWidget(
                                  text: "شاهد القضية",
                                  fontSize: 20,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                      () => controller.witnessList.isEmpty ? SizedBox() : WitnessRow(controller: controller),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        showAddDialog(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Theme.of(context).textTheme.headlineMedium!.color!),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                SizedBox(width: 8),
                                CustomTextWidget(
                                  text: "إضافة مستند",
                                  fontSize: 20,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Obx(
                      () => controller.imageList.isEmpty
                      ? SizedBox()
                      : ImageRow(
                    controller: controller,
                    width: width,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CommonField(
              controller: controller.commentController,
              text: 'تعليق',
              minLines: 5,
              hintText: 'اكتب التعليق هنا',
              validator: 'أدخل التعليق',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomButtonWidget(
                  buttonName: 'حفظ',
                  width: buttonWidth ?? 100,
                  onTap: () {
                    if (!controller.formKey.currentState!.validate()) {
                      controller.formKey.currentState!.validate();
                      return;
                    }
                    EasyLoading.showSuccess("تم بنجاح");
                    Get.back();
                  }),
            )
          ],
        ),
      ),
    );
  }

  void showAddWitnessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            color: Theme.of(context).focusColor,
            width: 500,
            padding: const EdgeInsets.all(24),
            child: Form(
              key: controller.dialogFormKey,
              child: Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonField(
                    controller: controller.witnessNameController,
                    text: 'اسم الشاهد',
                    hintText: 'اسم الشاهد',
                    validator: 'اسم الشاهد',
                    // keyboardType: TextInputType.text,
                  ),
                  CommonField(
                    controller: controller.witnessPhoneController,
                    text: 'رقم هاتف الشاهد',
                    hintText: 'رقم هاتف الشاهد',
                    validator: 'رقم هاتف الشاهد',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          controller.addWitness(
                            controller.witnessNameController.text,
                            controller.witnessPhoneController.text,
                          );

                          Navigator.of(context).pop();

                          controller.witnessNameController.clear();
                          controller.witnessPhoneController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: const Text(
                          "حفظ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            color: Theme.of(context).focusColor,
            width: 500,
            padding: const EdgeInsets.all(24),
            child: Form(
              key: controller.dialogFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "حدد الصورة",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CommonField(
                    controller: controller.remarkController,
                    text: 'عنوان المستندات',
                    hintText: 'كتابة عنوان المستندات',
                    validator: 'من فضلك، اكتب عنوان المستندات',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  ImagePick(
                    controller: controller,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (!controller.dialogFormKey.currentState!.validate()) {
                            controller.dialogFormKey.currentState!.validate();
                            return;
                          }

                          controller.addImage(
                            controller.remarkController.text,
                            controller.image.value,
                          );

                          Navigator.of(context).pop();

                          controller.remarkController.clear();
                          controller.image.value = null;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: const Text(
                          "حفظ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TagFiledWidget extends StatelessWidget {
  const TagFiledWidget({super.key, required this.controller});
  final CaseCreateController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomTextWidget(
              text: "قسم القضية",
              fontColor: Theme.of(context).textTheme.headlineMedium?.color!,
            ),
          ],
        ),
        const Gap(10),
        CustomTextField(
          hintText: "أدخل قسم القضية.",
          controller: controller.caseSectionController,
          suffixIcon: InkWell(
              onTap: () {
                var data = controller.caseSectionController;
                if (data.text.isNotEmpty) {
                  if (controller.selectedCaseSectionList.length < 4) {
                    if (!controller.selectedCaseSectionList.contains(data.text)) {
                      controller.selectedCaseSectionList.add(data.text.toUpperCase());
                    } else {
                      EasyLoading.showError("تم إضافته مسبقًا!");
                    }
                  } else {
                    EasyLoading.showError("تم الوصول للحد الأقصى! لا يمكنك إضافة المزيد.");
                  }
                }
                data.clear();
              },
              child: Icon(Icons.add_circle, color: Theme.of(context).textTheme.headlineMedium!.color)),
        ),
      ],
    );
  }
}
