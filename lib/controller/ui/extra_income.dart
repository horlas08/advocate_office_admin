import 'package:advocateoffice/controller/api/case_list.dart';
import 'package:advocateoffice/controller/api/extra_income.dart';
import 'package:advocateoffice/controller/api/settings/payment.dart';
import 'package:advocateoffice/model/case_list.dart';
import 'package:advocateoffice/model/extra_income.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtraIncomeController extends GetxController {
  var extraIncomeList = <ExtraIncomeModel>[].obs;
  var filteredExtraIncomeList = <ExtraIncomeModel>[].obs;
  TextEditingController searchController = TextEditingController();
  final fromKey = Get.put(GlobalKey<FormState>());
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController clientNumberController = TextEditingController();
  final TextEditingController feeController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();
  TextEditingController caseIdController =
        TextEditingController();

 var selectCaseId = "".obs;

  var caseIdList = <String>[].obs;
  var clientsList = <CaseListModel>[].obs;
  void fetchCaseData() async {
    clientsList.value = await CaseService.service();
    caseIdList.value =
        clientsList.map((client) => client.caseID ?? "").toSet().toList();
  }

  void updateClientInfo() {
    final selectedCaseId = clientsList.firstWhereOrNull(
      (value) => value.caseID == selectCaseId.value,
    );

    if (selectedCaseId != null) {
      clientNameController.text = selectedCaseId.clientName ?? "";
      clientNumberController.text = selectedCaseId.clientPhone ?? "";
    } else {
      clientNameController.clear();
      clientNumberController.clear();
    }
  }

  var selectedPaymentType = "".obs;
  RxBool isDropdownError = false.obs;

  var paymentTypeList = <String>[].obs;
  void fetchCountData() async {
    paymentTypeList.value = await PaymentTypeService.service();
  }

  @override
  void onInit() {
    super.onInit();
    fetchCountData();
    fetchExtraIncomeData();
    updateExtraIncome();
    selectCaseId.listen((_) => updateExtraIncome());
  }

  void fetchExtraIncomeData() async{
    extraIncomeList.value =await ExtraIncomeListService.service(); 
    filteredExtraIncomeList.value = extraIncomeList;
    updateCaseIdList();
  }

  void updateCaseIdList() {
    caseIdList.value =
        extraIncomeList.map((extraFee) => extraFee.caseID ?? "").toSet().toList();
  }

  void filterExtraFee(String query) {
    if (query.isEmpty) {
      filteredExtraIncomeList.value = extraIncomeList;
    } else {
      filteredExtraIncomeList.value = extraIncomeList
          .where((extraFee) =>
              extraFee.caseID
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              extraFee.clientName
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              extraFee.receivedAmount
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }
  }

  void updateExtraIncome() {
    final selectedFee = extraIncomeList.firstWhereOrNull(
      (fee) => fee.caseID == selectCaseId.value,
    );

    if (selectedFee != null) {
      clientNameController.text = selectedFee.clientName ?? "";
      clientNumberController.text = selectedFee.clientPhone ?? "";
    } else {
      clientNameController.clear();
      clientNumberController.clear();
    }
  }
}
