import 'package:advocateoffice/controller/api/case_list.dart';
import 'package:advocateoffice/controller/api/hearing.dart';
import 'package:advocateoffice/controller/api/settings/court.dart';
import 'package:advocateoffice/model/case_list.dart';
import 'package:advocateoffice/model/hearing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HearingManagementController extends GetxController {
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController clientNumberController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final fromKey = Get.put(GlobalKey<FormState>());

  RxBool isLoading = true.obs;
  RxBool isDropdownError = false.obs;
  RxBool isMessageSent = false.obs;
  var selectedCourt = "".obs;
  var selectCaseId = "".obs;
  var caseIdList = <String>[].obs;
  var caseType = "Property Dispute".obs;

  RxList<HearingModel> filteredHearingList = <HearingModel>[].obs;
  RxList<HearingModel> hearingDataList = <HearingModel>[].obs;

  getLoading() async {
    isLoading.value = true;
    hearingDataList.value = await HearingService.service();
    filteredHearingList.value = hearingDataList;
    isLoading.value = false;
  }

  void filter(String query) {
    if (query.isEmpty) {
      filteredHearingList.value = hearingDataList;
    } else {
      filteredHearingList.value = hearingDataList
          .where((v) =>
              v.caseID.toString().toLowerCase().contains(query.toLowerCase()) ||
              v.clientName.toString().toLowerCase().contains(query.toLowerCase()) ||
              v.hearingDate
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              v.clientPhone.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  var clientsList = <CaseListModel>[].obs;
  void fetchClientData() async {
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

  var courtList = <String>[].obs;
  void fetchCountData() async {
    courtList.value = await CourtService.service();
  }

  addHearingManagement() {
    HearingModel model = HearingModel(
        caseID: selectCaseId.value,
        clientName: clientNameController.text,
        clientPhone: clientNumberController.text,
        courtType: selectedCourt.value,
        hearingDate: DateFormat('yyyy-MM-dd, h:mm a')
            .format(selectedDate.value ?? DateTime.now()),
        remark: commentController.text,
        caseType: caseType.value,
        informClient: isMessageSent.value);

    filteredHearingList.add(model);
  }

  updateHearingManagement({required String id}) {
    for (var caseModel
        in filteredHearingList.where((caseItem) => caseItem.caseID == id)) {
      caseModel.caseID = selectCaseId.value;
      caseModel.clientName = clientNameController.text;
      caseModel.clientPhone = clientNumberController.text;
      caseModel.courtType = selectedCourt.value;
      caseModel.hearingDate = DateFormat('yyyy-MM-dd, h:mm a')
          .format(selectedDate.value ?? DateTime.now());
      caseModel.remark = commentController.text;
      caseModel.caseType = caseType.value;
      caseModel.informClient = isMessageSent.value;
    }
  }

  deleteHearingManagement({required String data, required int id}) async {
    filteredHearingList.removeAt(id);
  }

  var selectedDate = Rxn<DateTime>();
  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  @override
  void onInit() {
    fetchClientData();
    fetchCountData();
    selectCaseId.listen((_) => updateClientInfo());
    super.onInit();
  }
}
