import 'package:advocateoffice/controller/api/case_list.dart';
import 'package:advocateoffice/controller/api/fee_received.dart';
import 'package:advocateoffice/controller/api/settings/payment.dart';
import 'package:advocateoffice/model/case_list.dart';
import 'package:advocateoffice/model/payment_list.dart';
import 'package:advocateoffice/model/payment_create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeeReceivedController extends GetxController {
  var feeReceivedList = <PaymentListModel>[].obs;
  var filteredFeeReceivedList = <PaymentListModel>[].obs;
  TextEditingController searchController = TextEditingController();
  final fromKey = Get.put(GlobalKey<FormState>());
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController clientNumberController = TextEditingController();
  final TextEditingController feeController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();
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
  RxBool isDownloadLoading = false.obs;

  var paymentTypeList = <String>[].obs;
  void fetchCountData() async {
    paymentTypeList.value = await PaymentTypeService.service();
  }

  RxBool isLoading = true.obs;
  getLoading() async {
    feeReceivedList.value = await PaymentListService.service();
    filteredFeeReceivedList.value = feeReceivedList;

    isLoading.value = false;
  }

  void filter(String query) {
    if (query.isEmpty) {
      filteredFeeReceivedList.value = feeReceivedList;
    } else {
      filteredFeeReceivedList.value = feeReceivedList
          .where((feeReceived) =>
              feeReceived.caseID
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              feeReceived.clientName
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              feeReceived.clientPhone
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();

    fetchCaseData();
    selectCaseId.listen((_) => updateClientInfo());
    fetchCountData();
  }

  addFeeReceived() {
    PaymentCreateModel(
      incomeType: "Fee Received",
      caseID: selectCaseId.value,
      remark: remarkController.text,
      recevedAmount: double.parse(feeController.text),
      paymentMethode: selectedPaymentType.value,
    );
  }

  updateFeeReceived({required String id}) {
    for (var data in filteredFeeReceivedList.where((v) => v.caseID == id)) {
      PaymentCreateModel(
        incomeType: data.incomeType,
        caseID: data.caseID,
        remark: remarkController.text,
        recevedAmount: data.receivedAmount,
        paymentMethode: data.paymentMethod,
      );
    }
  }

  deleteFeeReceived({required String id}) async {
    filteredFeeReceivedList.removeAt(int.parse(id));
  }
}
