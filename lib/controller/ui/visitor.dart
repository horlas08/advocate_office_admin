import 'dart:developer';

import 'package:advocateoffice/controller/api/visitor_list.dart';
import 'package:advocateoffice/model/visitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class VisitorController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController visitorNameController = TextEditingController();
  final TextEditingController visitorNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController referenceNamePhoneController = TextEditingController();
  final fromKey = Get.put(GlobalKey<FormState>());
  RxBool isLoading = true.obs;
  var selectPriority = "High".obs;
  final priorityList = ["High", "Medium", "Low"].obs;
  var selectCondition = "Positive".obs;
  final conditionList = ["Positive", "Negative"].obs;
  var selectCaseType = "Criminal".obs;
  final caseTypeList = ["Criminal", "Civil", "Family", "Labor", "Property"].obs;
  RxList<VisitorModel> filteredVisitorList = <VisitorModel>[].obs;
  RxList<VisitorModel> visitorList = <VisitorModel>[].obs;

  Future<void> fetchVisitorData() async {
    isLoading.value = true;
    filteredVisitorList.value = await VisitorListService.service();
    isLoading.value = false;
  }

  visitorAddAndUpdateFun() async {
    if (!fromKey.currentState!.validate()) {
      log("==============1111111111=====================");
      return;
    }
    EasyLoading.showSuccess("ناجح");
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
