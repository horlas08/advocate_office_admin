// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:advocateoffice/controller/ui/portfolio/team.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_table_heading_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/datatable.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:get/get.dart';

class TeamScreenDesktopTablet extends StatelessWidget {
  const TeamScreenDesktopTablet({
    Key? key,
    required this.controller,
    this.width,
  }) : super(key: key);
  final TeamController controller;
  final double? width;
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
                            const DashboardHeader(title: 'فريقنا'),
                            const SizedBox(height: 20),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => CommonTableWidget(
                                        width: width ??
                                            MediaQuery.of(context).size.width -
                                                260,
                                        listLength: controller.teamList.length,
                                        dataColumn: const [
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "م")),
                                              fixedWidth: 50),
                                          DataColumn2(
                                              label: Center(
                                                  child: CustomTblHeadText(
                                                      text: "هوية")),
                                              fixedWidth: 150),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "الصورة")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "الاسم")),
                                          DataColumn2(
                                              label: CustomTblHeadText(
                                                  text: "الخبرة")),
                                          DataColumn2(
                                              fixedWidth: 100,
                                              label: CustomTblHeadText(
                                                  text: "الحالة")),
                                          DataColumn2(
                                              fixedWidth: 100,
                                              label: CustomTblHeadText(
                                                  text: "الإجراءات")),
                                        ],
                                        dataRow: List.generate(
                                          controller.teamList.length,
                                          (index) {
                                            var data =
                                                controller.teamList[index];
                                            return DataRow(cells: [
                                              DataCell(
                                                  CustomSelectableTextWidget(
                                                      text: "${index + 1}")),
                                              DataCell(
                                                  CustomSelectableTextWidget(
                                                      text: "${data.id}")),
                                              DataCell(Image.network(
                                                  "${data.image}",
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover)),
                                              DataCell(CustomSelectableTextWidget(
                                                  text:
                                                      "${data.name.toString()}")),
                                              DataCell(CustomSelectableTextWidget(
                                                  text:
                                                      "${data.expertise.toString()}")),
                                              DataCell(
                                                  CustomSelectableTextWidget(
                                                      text:
                                                          controller.teamStatus[
                                                                      index] ==
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
                                                                    .teamStatus[
                                                                index],
                                                            onChanged: (v) {
                                                              controller
                                                                      .teamStatus[
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

  Widget buildImage(String data) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image(
          image: NetworkImage(data),
          height: 50,
          width: 50,
        ),
      );
}
