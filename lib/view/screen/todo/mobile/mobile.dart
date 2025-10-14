import 'package:advocateoffice/controller/ui/todo.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:advocateoffice/view/screen/todo/mobile/add.dart';
import 'package:advocateoffice/view/screen/todo/mobile/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoTabletMobile extends StatelessWidget {
  ToDoTabletMobile({
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
      appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
        title: const DashboardHeaderMobile(title: 'ToDo'),
      ),
      drawer: NavigationBarViewMobile(),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Expanded(child: DashboardShimmer())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              Get.to(() =>
                                  ToDoCreateMobile(controller: controller));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Add Task',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
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
    );
  }
}
