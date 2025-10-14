import 'package:advocateoffice/controller/api/case_list.dart';
import 'package:advocateoffice/model/case_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseListController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<CaseListModel> caseList = <CaseListModel>[].obs;

  RxList<CaseListModel> filteredCaseList = <CaseListModel>[].obs;
  TextEditingController searchController = TextEditingController();
  RxList<String> selectedEmployeeList = <String>[].obs;
  RxString selectEmployee = "Md Mamun Islam - 01747474745 - Civil".obs;
  RxList<String> employeeList = <String>[
    "Md Mamun Islam - 01747474745 - Civil",
    "Md Afridi Hasan Antar - 01747474758 - Criminal",
    "Md Rakib Isalam - 01747474745 - Family",
    "Emon Hossain - 01747474745 - Education",
    "Tonno Sekhe - 01747474745 - Real state",
    "Arifil Isalam - 01747474745 - Family",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    fetchClientData();
  }

  void fetchClientData() async {
    isLoading.value = true;
    caseList.value = await CaseService.service();
    filteredCaseList.value = caseList;
    isLoading.value = false;
  }

  void filterCase(String query) {
    if (query.isEmpty) {
      filteredCaseList.value = caseList;
    } else {
      filteredCaseList.value = caseList
          .where((casee) =>
              casee.caseID.toString().toLowerCase().contains(query.toLowerCase()) ||
              casee.clientName.toString().toLowerCase().contains(query.toLowerCase()) ||
              casee.caseStage.toString().toLowerCase().contains(query.toLowerCase()) ||
              casee.priority.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
