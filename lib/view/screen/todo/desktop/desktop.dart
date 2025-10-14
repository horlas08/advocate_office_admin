import 'package:advocateoffice/controller/ui/todo.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_search_and_add_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:advocateoffice/view/screen/todo/mobile/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ToDoTabletDesktop extends StatelessWidget {
  ToDoTabletDesktop({
    super.key,
    required this.controller,
    this.width,
    this.childAspectRatio,
    this.crossAxisCount,
  });
  final ToDoController controller;
  final double? width;
  final double? childAspectRatio;
  final int? crossAxisCount;
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
                            const DashboardHeader(title: 'ToDo'),
                            const SizedBox(height: 20),
                            SearchAndAddSectionWidget(
                              searchTap: (searchTap) {},
                              buttonTap: () {
                                showAddDialog(
                                    context: context, title: "Create ToDo");
                              },
                              buttonName: "Create ToDo",
                              totalData: "",
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount ?? 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: childAspectRatio ?? 1.5,
                                ),
                                // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 1,childAspectRatio: 1,mainAxisExtent: 2),
                                itemCount: controller.todos.length,
                                itemBuilder: (context, index) {
                                  return ToDoCard(
                                    todo: controller.todos[index],
                                    controller: controller,
                                  );
                                },
                              ),
                            )
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

  void showAddDialog({context, required String title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: CustomAlertDialogue(
              title: title,
              body: Form(
                key: controller.fromKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    CommonField(
                      controller: controller.titleController,
                      text: 'Title',
                      hintText: 'Enter Title',
                      validator: 'Please, Enter Title',
                      keyboardType: TextInputType.text,
                     ),
                    const SizedBox(height: 16),
                    CommonField(
                      controller: controller.commentController,
                      minLines: 5,
                      text: 'Your Note',
                      hintText: 'Write some notes',
                      keyboardType: TextInputType.text,
                      validator: 'Please, Enter Notes',
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              confirmButtonFunction: () {
                if(!controller.fromKey.currentState!.validate()){
                  return;
                }
                EasyLoading.showSuccess("Note Created");
                Get.back();
              }),
        );
      },
    );
  }
}
