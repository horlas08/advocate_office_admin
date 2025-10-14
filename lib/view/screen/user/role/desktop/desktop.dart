import 'package:advocateoffice/controller/ui/user/permission.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_drop_down.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/screen/user/role/desktop/widget/permission_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleDesktop extends StatelessWidget {
  RoleDesktop({super.key, required this.controller});
  final PermissionController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBarView(),
          Obx(
            () => controller.isLoading.isTrue
                ? Expanded(child: DashboardShimmer())
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DashboardHeader(title: 'صلاحيات المستخدم'),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                clipBehavior: Clip.hardEdge,
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 20,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    width: 300,
                                    child: CommonDropDown(
                                        context: context,
                                        label: "اختر موظف",
                                        value: controller.selectedEmployee,
                                        items: controller.employeeRoleList,
                                        onChanged: (value) {
                                          controller.selectedEmployee.value =
                                              value!;
                                        }),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomTextWidget(
                                          text: "مد. مامون إسلام",
                                          fontSize: 20,
                                        ),
                                        CustomTextWidget(
                                          text: "مطوِّر فلاتر",
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                        ),
                                        CustomTextWidget(text: "01761810531"),
                                        CustomTextWidget(
                                            text: "mail123@gmail.com"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 50),
                            Divider(),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'قسم لوحة القيادة',
                              permissions:
                                  controller.permissions['dashboardSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'قسم الزوار',
                              permissions:
                                  controller.permissions['visitorSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'قسم العملاء',
                              permissions:
                                  controller.permissions['clientSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'قسم القضايا',
                              permissions:
                                  controller.permissions['caseSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'قسم الجلسات',
                              permissions:
                                  controller.permissions['caseSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'الرسوم المستلمة',
                              permissions:
                                  controller.permissions['caseSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'دخل إضافي',
                              permissions:
                                  controller.permissions['caseSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'المصروفات',
                              permissions:
                                  controller.permissions['caseSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'مهام القضية',
                              permissions:
                                  controller.permissions['caseSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'قسم المهام',
                              permissions:
                                  controller.permissions['caseSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
                            const SizedBox(height: 20),
                            PermissionCard(
                              cardTitle: 'قسم الإشعارات',
                              permissions:
                                  controller.permissions['caseSection']!,
                              permissionsList: controller.permissions,
                              onChanged: (bool) {},
                            ),
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
}
