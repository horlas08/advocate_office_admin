import 'package:advocateoffice/controller/ui/hearing_management.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/hearing_management/mobile/widgets/add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:data_table_2/data_table_2.dart';

class HearingManagementMobile extends StatelessWidget {
  const HearingManagementMobile(
      {super.key, required this.controller, required this.width});
  final HearingManagementController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'المواعيد'),
      ),
      drawer: NavigationBarViewMobile(),
      body: Obx(
        () => controller.isLoading.isTrue
            ? DashboardShimmer()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchAndAddSectionWidgetMobile(
                              searchTap: (query) {
                                controller.filter(query);
                              },
                              buttonTap: () {
                                Get.to(
                                  HearingManagementAddMobile(
                                      controller: controller,
                                      isAddSection: false),
                                );
                              },
                              buttonName: 'إدارة الجلسات',
                              totalData: "",
                            ),
                            const SizedBox(height: 16),
                            Obx(
                              () => CommonTableWidget(
                                width: width,
                                listLength:
                                    controller.filteredHearingList.length,
                                dataColumn: [
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(text: "م")),
                                      fixedWidth: 50),
                                  DataColumn2(
                                      label:
                                          CustomTblHeadText(text: "رقم القضية"),
                                      fixedWidth: 120),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "التاريخ والوقت")),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "العميل")),
                                  DataColumn2(
                                      label: CustomTblHeadText(
                                          text: "نوع القضية")),
                                  DataColumn2(
                                      label:
                                          CustomTblHeadText(text: "المحكمة")),
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(
                                              text: "إعلام؟"))),
                                  DataColumn2(
                                      label:
                                          CustomTblHeadText(text: "ملاحظات")),
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(
                                              text: "إجراءات")),
                                      fixedWidth: 100),
                                ],
                                dataRow: List.generate(
                                  controller.filteredHearingList.length,
                                  (index) {
                                    var data =
                                        controller.filteredHearingList[index];
                                    return DataRow(
                                      cells: [
                                        DataCell(CustomSelectableTextWidget(
                                            text: "${index + 1}")),
                                        DataCell(CustomSelectableTextWidget(
                                            text: "${data.caseID}")),
                                        DataCell(CustomSelectableTextWidget(
                                            text: "${data.hearingDate}")),
                                        DataCell(CustomSelectableTextWidget(
                                            text:
                                                "${data.clientName}\n${data.clientPhone}")),
                                        DataCell(CustomSelectableTextWidget(
                                            text: "${data.caseType}")),
                                        DataCell(CustomSelectableTextWidget(
                                            text: "${data.courtType}")),
                                        DataCell(Center(
                                            child: CustomSelectableTextWidget(
                                                text: data.informClient!
                                                    ? "نعم"
                                                    : "لا"))),
                                        DataCell(CustomSelectableTextWidget(
                                            text: "${data.remark}",
                                            maxLine: 2)),
                                        DataCell(
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: data.informClient!
                                                      ? Icon(Icons.done_all)
                                                      : InkWell(
                                                          child: const Icon(
                                                              Icons.message,
                                                              size: 20),
                                                          onTap: () {
                                                            buildSMSDialogue(
                                                                context);
                                                          },
                                                        ),
                                                ),
                                                Expanded(
                                                  child: InkWell(
                                                    child: const Icon(
                                                        Icons.remove_red_eye,
                                                        size: 20),
                                                    onTap: () {
                                                      Get.toNamed(
                                                          "${Get.currentRoute}${RoutesName.caseDetails}/${data.caseID}");
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: InkWell(
                                                    child: const Icon(
                                                        Icons.edit,
                                                        size: 20),
                                                    onTap: () {
                                                      Get.to(
                                                        HearingManagementAddMobile(
                                                          controller:
                                                              controller,
                                                          isAddSection: true,
                                                          id: data.caseID
                                                              .toString(),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<dynamic> buildSMSDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialogue(
          title: "تأكيد",
          body: CustomTextWidget(
            text:
                "هل تريد إرسال رسالة نصية إلى العميل بخصوص الجلسة في الوقت المحدد؟",
            fontSize: 16,
            maxLine: 3,
          ),
          confirmButtonFunction: () {
            EasyLoading.showSuccess("تم إرسال الرسالة بنجاح");
            Get.back();
          },
        );
      },
    );
  }
}
