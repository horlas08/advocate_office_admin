import 'dart:typed_data';
import 'package:advocateoffice/controller/api/extra_income.dart';
import 'package:advocateoffice/controller/api/fee_received.dart';
import 'package:advocateoffice/data/case_document.dart';
import 'package:advocateoffice/data/case_history.dart';
import 'package:advocateoffice/data/expense.dart';
import 'package:advocateoffice/model/case_history.dart';
import 'package:advocateoffice/model/expense.dart';
import 'package:advocateoffice/model/extra_income.dart';
import 'package:advocateoffice/model/image.dart';
import 'package:advocateoffice/model/payment_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CaseViewController extends GetxController {
  RxList<ImageItemModel> imageList = <ImageItemModel>[].obs;
  RxList<CaseHistoryModel> caseHistoryList = <CaseHistoryModel>[].obs;
  RxList<CaseHistoryModel> filteredCaseHistoryList = <CaseHistoryModel>[].obs;
  RxList<PaymentListModel> paymentList = <PaymentListModel>[].obs;
  RxList<PaymentListModel> filteredPaymentList = <PaymentListModel>[].obs;
  var extraIncomeList = <ExtraIncomeModel>[].obs;
  var filteredExtraIncomeList = <ExtraIncomeModel>[].obs;
  final fromKey = Get.put(GlobalKey<FormState>());
  final TextEditingController searchController = TextEditingController();
  final TextEditingController activityController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController courtDictionController = TextEditingController();
  final TextEditingController caseIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController selectController = TextEditingController();
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController clientNumberController = TextEditingController();
  final TextEditingController feeController = TextEditingController();
  final TextEditingController commentExtraController = TextEditingController();
  var selectedDate = Rxn<DateTime>();

  var selectedPaymentType = "".obs; // Selected value for payment type
  var paymentTypeList = ["bKash", "Nagad", "Rocket"].obs;
  RxBool isDownloadLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    facetingImage();
    facetingCaseHistory();
    facetingPayment();
    fetchExpenseData();
    fetchExtraIncomeData();
  }

  facetingImage() {
    imageList.value = imageItems;
  }

  facetingCaseHistory() {
    caseHistoryList.value = caseHistoryDataList;
    filteredCaseHistoryList = caseHistoryList;
  }

  void filterCaseHistory(String query) {
    if (query.isEmpty) {
      filteredCaseHistoryList.value = caseHistoryList;
    } else {
      filteredCaseHistoryList.value = caseHistoryList
          .where((casee) =>
              casee.nextHearingDate.toString().toLowerCase().contains(query.toLowerCase()) ||
              casee.activity.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  facetingPayment() async {
    paymentList.value = await PaymentListService.service();
    filteredPaymentList = paymentList;
  }

  void filterPaymentHistory(String query) {
    if (query.isEmpty) {
      filteredPaymentList.value = paymentList;
    } else {
      filteredPaymentList.value = paymentList
          .where((payment) =>
              payment.createdAt.toString().toLowerCase().contains(query.toLowerCase()) ||
              payment.receivedAmount.toString().toLowerCase().contains(query.toLowerCase()) ||
              payment.paymentMethod.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  var image = Rx<Uint8List?>(null);
  var imagePath = Rx<String?>(null);

  XFile? imgFile;

  var selectImage = Rx<String?>(null);

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      image.value = await pickedFile.readAsBytes();
      imgFile = pickedFile;
    }
  }

  var expenseList = <ExpenseModel>[].obs;
  var filteredExpenseList = <ExpenseModel>[].obs;
  var selectedStatus = "".obs;

  var statusList = [
    "Approved",
    "Pending",
    "Rejected",
  ].obs;

  var selectedCaseID = "".obs;

  var caseIdList = [
    "CASE001",
    "CASE002",
    "CASE003",
    "CASE004",
    "CASE005",
    "CASE006",
    "CASE007",
  ].obs;

  void fetchExpenseData() {
    expenseList.value = expenseDataList;
    filteredExpenseList.value = expenseList;
  }

  void filterExpense(String query) {
    if (query.isEmpty) {
      filteredExpenseList.value = expenseList;
    } else {
      filteredExpenseList.value = expenseList
          .where((expense) =>
              expense.id.toString().toLowerCase().contains(query.toLowerCase()) ||
              expense.purposeOforCaseID.toString().toLowerCase().contains(query.toLowerCase()) ||
              expense.amount.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  RxString selectedStatusUpdate = ''.obs;

  void updateExpenseStatus(String id, String newStatus) {
    final expense = expenseDataList.firstWhere((e) => e.id == id);
    expense.status = newStatus; // Directly update the status in the model

    // Update the reactive selectedStatus (optional, if you want to track it elsewhere)
    selectedStatusUpdate.value = newStatus;
  }

  void fetchExtraIncomeData() async {
    extraIncomeList.value = await ExtraIncomeListService.service();
    filteredExtraIncomeList.value = extraIncomeList;
    updateCaseIdList();
  }

  void updateCaseIdList() {
    caseIdList.value = extraIncomeList.map((extraFee) => extraFee.caseID ?? "").toSet().toList();
  }

  void filterExtraFee(String query) {
    if (query.isEmpty) {
      filteredExtraIncomeList.value = extraIncomeList;
    } else {
      filteredExtraIncomeList.value = extraIncomeList
          .where((extraFee) =>
              extraFee.caseID.toString().toLowerCase().contains(query.toLowerCase()) ||
              extraFee.clientName.toString().toLowerCase().contains(query.toLowerCase()) ||
              extraFee.receivedAmount.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void updateExtraIncome({required String extraIncomeId}) {
    final selectedFee = extraIncomeList.firstWhereOrNull(
      (fee) => fee.caseID == extraIncomeId,
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
