import 'package:advocateoffice/controller/ui/todo.dart';
import 'package:advocateoffice/model/todo.dart';
import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_alertDialogue.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({
    super.key,
    required this.todo,
    required this.controller,
  });
  final ToDoModel todo;
  final ToDoController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: todo.dateTime,
                    fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                    fontSize: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            CustomTextWidget(
              text: todo.title,
              fontColor: Theme.of(context).textTheme.headlineMedium!.color,
              fontSize: 20,
            ),
            SizedBox(height: 10),
            Expanded(
              child: CustomTextWidget(
                text: todo.description,
                fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                fontSize: 14,
                maxLine: 5,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.remove_red_eye,
                  ),
                  onTap: () {
                    showViewDialog(context: context, title: "الجميع", data: todo);
                  },
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  child: const Icon(
                    Icons.edit,
                  ),
                  onTap: () {
                    showEditDialog(context: context, title: "تحرير الكل", data: todo);
                  },
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: AppColors.errorColor,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialogue(
                        title: "حذف التأكيد",
                        body: CustomTextWidget(text: "هل أنت متأكد من حذف هذا ما يجب القيام به؟"),
                        confirmButtonName: "حذف",
                        confirmButtonFunction: () {
                          //controller.removeBus(data.id.toString());
                          Get.back();
                        },
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void showViewDialog({required BuildContext context, required String title, required ToDoModel data}) {
    controller.titleController.text = data.title.toString();
    controller.commentController.text = data.description.toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: CustomAlertDialogue(
              title: title,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: CustomTextWidget(
                        maxLine: 2,
                        text: "${data.title}",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                      CustomTextWidget(
                        text: data.dateTime,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomTextWidget(text: data.description),
                  SizedBox(height: 100),
                ],
              ),
              confirmButtonFunction: () {
                Get.back();
              },
          confirmButtonName: "Okay",
          ),
        );
      },
    );
  }

  void showEditDialog({required BuildContext context, required String title, required ToDoModel data}) {
    controller.titleController.text = data.title.toString();
    controller.commentController.text = data.description.toString();

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
                    CommonField(
                      controller: controller.titleController,
                      text: 'Title',
                      hintText: 'Enter Title',
                      validator: 'Please ,Enter Title',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    CommonField(
                      controller: controller.commentController,
                      minLines: 5,
                      text: 'Your Note',
                      hintText: 'Write some notes',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              confirmButtonFunction: () {}),
        );
      },
    );
  }
}
