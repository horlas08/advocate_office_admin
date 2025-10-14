import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:flutter/material.dart';

class ToDoCreateMobile extends StatelessWidget {
  ToDoCreateMobile({super.key, required this.controller});
  final controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DashboardHeaderMobile(title: 'Task Create'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).focusColor,
          padding: const EdgeInsets.all(12),
          child: Form(
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
                Align(
                  alignment: Alignment.center,
                  child: CustomButtonWidget(
                    vertical: 13,
                    buttonColor: Colors.white,
                    textColor: Theme.of(context).primaryColor,
                    buttonName: "Save",
                    onTap: () {},
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
