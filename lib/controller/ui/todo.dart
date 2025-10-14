import 'package:advocateoffice/data/todo.dart';

import 'package:advocateoffice/model/todo.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ToDoController extends GetxController {
  RxBool isLoading = false.obs;

  final fromKey = Get.put(GlobalKey<FormState>());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  var todos = <ToDoModel>[].obs;

  void fetchTasks() {
    todos.value = toDoList;
  }
}
