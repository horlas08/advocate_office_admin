import 'package:advocateoffice/controller/ui/portfolio/team.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:data_table_2/data_table_2.dart';

class TeamScreenMobile extends StatelessWidget {
  const TeamScreenMobile(
      {super.key, required this.controller, required this.width});
  final TeamController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'فريقنا'),
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
                            const SizedBox(height: 16),
                            Obx(
                              () => CommonTableWidget(
                                width: width,
                                listLength: controller.teamList.length,
                                dataColumn: const [
                                  DataColumn2(
                                      label: Center(
                                          child: CustomTblHeadText(text: "م")),
                                      fixedWidth: 50),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "الصورة")),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "الاسم")),
                                  DataColumn2(
                                      label: CustomTblHeadText(text: "الخبرة")),
                                  DataColumn2(
                                      fixedWidth: 100,
                                      label: CustomTblHeadText(text: "الحالة")),
                                  DataColumn2(
                                      fixedWidth: 100,
                                      label:
                                          CustomTblHeadText(text: "الإجراءات")),
                                ],
                                dataRow: List.generate(
                                  controller.teamList.length,
                                  (index) {
                                    var data = controller.teamList[index];
                                    return DataRow(cells: [
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${index + 1}")),
                                      DataCell(Image.network("${data.image}",
                                          width: 100, height: 100)),
                                      DataCell(CustomSelectableTextWidget(
                                          text: "${data.name.toString()}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text:
                                              "${data.expertise.toString()}")),
                                      DataCell(CustomSelectableTextWidget(
                                          text: controller.teamStatus[index] ==
                                                  true
                                              ? "Active"
                                              : "Inactive")),
                                      DataCell(
                                        Center(
                                          child: SizedBox(
                                            height: 20,
                                            child: Obx(
                                              () => FittedBox(
                                                child: Switch(
                                                    value: controller
                                                        .teamStatus[index],
                                                    onChanged: (v) {
                                                      controller.teamStatus[
                                                          index] = v;
                                                    }),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]);
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
}
