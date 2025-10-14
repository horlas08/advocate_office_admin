import 'package:advocateoffice/data/task.dart';
import 'package:advocateoffice/model/task.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TaskController extends GetxController {
  RxBool isLoading = false.obs;
   final fromKey = Get.put(GlobalKey<FormState>());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  RxString selectedEmployee = "".obs;

  var employeeList = [
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "Charlie Davis",
  ].obs;

  var selectedFromDate = Rxn<DateTime>();
  var selectedToDate = Rxn<DateTime>();
  void updateSelectedFromDate(DateTime date) {
    selectedFromDate.value = date;
  }

  void updateSelectedToDate(DateTime date) {
    selectedToDate.value = date;
  }

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  var tasks = <TaskModel>[].obs;
  void fetchTasks() {
    tasks.value = taskList;
  }
}
