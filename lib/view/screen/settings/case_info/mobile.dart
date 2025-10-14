import 'dart:developer';

import 'package:advocateoffice/controller/ui/settings/case_stage.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_text_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/screen/settings/case_info/widget/case_stage_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseInfoMobile extends StatelessWidget {
  CaseInfoMobile({super.key, required this.controller});
  final CaseInfoController controller;
  @override
  Widget build(BuildContext context) {
    controller.getLoading();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'معلومات القضية'),
      ),
      drawer: NavigationBarViewMobile(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => controller.isLoading.isTrue
                ? Expanded(child: DashboardShimmer())
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: [
                            CaseInfoCard(
                              cardTitle: 'مراحل القضية',
                              cardList: controller.caseStageList,
                              buttonName: 'إضافة مرحلة',
                              addButton: () {
                                controller.textEditingController.clear();

                                showDialog(
                                  context: context,
                                  builder: (context) => CustomAlertDialogue(
                                    title: "إضافة نوع القضية",
                                    body: Form(
                                        key: controller.fromKey,
                                        child: CustomTextField(
                                          controller:
                                              controller.textEditingController,
                                          validator: (v) {
                                            if (v.toString() == "" ||
                                                v.toString().isEmpty) {
                                              return "لا يمكن أن يكون الحقل فارغًا";
                                            }
                                            return null;
                                          },
                                        )),
                                    confirmButtonFunction: () {
                                      log("${!controller.fromKey.currentState!.validate()}");
                                      if (!controller.fromKey.currentState!
                                          .validate()) {
                                        return;
                                      }
                                      controller.addCaseStage(
                                          newStage: controller
                                              .textEditingController.text);
                                      Get.back();
                                    },
                                  ),
                                );
                              },
                              onDelete: (v) {
                                _caseDialog(
                                  context: context,
                                  v: v,
                                  confirmButton: () {
                                    controller.deleteCaseStage(id: v);
                                    Get.back();
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            CaseInfoCard(
                              cardTitle: 'نوع القضية',
                              cardList: controller.caseTypeList,
                              buttonName: 'إضافة نوع',
                              addButton: () {
                                controller.textEditingController.clear();

                                showDialog(
                                  context: context,
                                  builder: (context) => CustomAlertDialogue(
                                    title: "إضافة نوع القضية",
                                    body: Form(
                                        key: controller.fromKey,
                                        child: CustomTextField(
                                          controller:
                                              controller.textEditingController,
                                          validator: (v) {
                                            if (v.toString() == "" ||
                                                v.toString().isEmpty) {
                                              return "لا يمكن أن يكون الحقل فارغًا";
                                            }
                                            return null;
                                          },
                                        )),
                                    confirmButtonFunction: () {
                                      log("${!controller.fromKey.currentState!.validate()}");
                                      if (!controller.fromKey.currentState!
                                          .validate()) {
                                        return;
                                      }
                                      controller.addCaseType(
                                          newType: controller
                                              .textEditingController.text);
                                      Get.back();
                                    },
                                  ),
                                );
                              },
                              onDelete: (v) {
                                _caseDialog(
                                  context: context,
                                  v: v,
                                  confirmButton: () {
                                    controller.deleteCaseType(id: v);
                                    Get.back();
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            CaseInfoCard(
                              cardTitle: 'قائمة المحاكم',
                              cardList: controller.courtList,
                              buttonName: 'إضافة محكمة',
                              addButton: () {
                                controller.textEditingController.clear();

                                showDialog(
                                  context: context,
                                  builder: (context) => CustomAlertDialogue(
                                    title: "إضافة اسم المحكمة",
                                    body: Form(
                                        key: controller.fromKey,
                                        child: CustomTextField(
                                          controller:
                                              controller.textEditingController,
                                          validator: (v) {
                                            if (v.toString() == "" ||
                                                v.toString().isEmpty) {
                                              return "لا يمكن أن يكون الحقل فارغًا";
                                            }
                                            return null;
                                          },
                                        )),
                                    confirmButtonFunction: () {
                                      log("${!controller.fromKey.currentState!.validate()}");
                                      if (!controller.fromKey.currentState!
                                          .validate()) {
                                        return;
                                      }
                                      controller.addCourt(
                                          newType: controller
                                              .textEditingController.text);
                                      Get.back();
                                    },
                                  ),
                                );
                              },
                              onDelete: (v) {
                                _caseDialog(
                                  context: context,
                                  v: v,
                                  confirmButton: () {
                                    controller.deleteCourt(id: v);
                                    Get.back();
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _caseDialog(
      {required BuildContext context,
      required String v,
      required Function() confirmButton}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogue(
            title: "تأكيد الحذف",
            body: CustomTextWidget(
                text: "هل أنت متأكد أنك تريد حذف هذه البيانات؟"),
            confirmButtonFunction: confirmButton);
      },
    );
  }
}
