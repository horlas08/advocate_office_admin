import 'package:advocateoffice/controller/api/case_task.dart';
import 'package:advocateoffice/controller/api/client_list.dart';
import 'package:advocateoffice/model/case_task_model.dart';
import 'package:advocateoffice/model/client_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseTaskController extends GetxController {
  RxList<CaseTaskModel> caseTaskList = <CaseTaskModel>[].obs;
  var clientsList = <ClientListModel>[].obs;
  RxBool isLoading = false.obs;
  final fromKey = Get.put(GlobalKey<FormState>());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController clientNumberController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  RxString selectedEmployee = "".obs;
  var selectCaseId = "".obs;
  var caseIdList = <String>[].obs;
  var selectEmployee = "".obs;
  var employeeList = ["John Doe", "Jane Smith", "Alice Johnson"].obs;
  var selectEmployeeList = <String>[].obs;
  var selectPriority = "High".obs;
  final priorityList = ["High", "Medium", "Low"].obs;
  var selectedFromDate = Rxn<DateTime>();
  var selectedToDate = Rxn<DateTime>();
  var tags = <String>[].obs;
  RxBool isShow = false.obs;
  List<String> filterEmployeeList = [];
  List<String> employeeSectionsList = [];

  void updateSelectedFromDate(DateTime date) {
    selectedFromDate.value = date;
  }

  void fetchClientData() async{
    clientsList.value =  await ClientListService.service();
    caseIdList.value = clientsList.map((client) => client.id ?? "").toSet().toList();
  }

  getCaseTaskFunction() async {
    caseTaskList.value = await CaseTaskService.service();
  }

  void updateSelectedToDate(DateTime date) {
    selectedToDate.value = date;
  }

  void updateClientInfo() {
    final selectedFee = clientsList.firstWhereOrNull(
      (value) => value.id == selectCaseId.value,
    );

    if (selectedFee != null) {
      clientNameController.text = selectedFee.name ?? "";
      clientNumberController.text = selectedFee.phone ?? "";
    } else {
      clientNameController.clear();
      clientNumberController.clear();
    }
  }

  void onTagSubmitted(String tag) {
    if (!tags.contains(tag)) {
      tags.add(tag);
    }
  }

  void removeTag(String tag) {
    tags.remove(tag);
  }

  void clearTags() {
    tags.clear();
  }

  List<String> getSuggestions(String query) {
    if (query.isEmpty) return [];
    return employeeList.where((option) => option.contains(query.toLowerCase())).toList();
  }

  fulter() {
    filterEmployeeList = employeeList.where((item) => item.contains(searchController.text.toLowerCase())).toList();
    employeeSectionsList = filterEmployeeList;
    isShow.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    getCaseTaskFunction();
    fetchClientData();
    selectCaseId.listen((_) => updateClientInfo());
  }
}
