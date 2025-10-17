import 'package:advocateoffice/controller/api/client_list.dart';
import 'package:advocateoffice/controller/api/settings/address.dart';
import 'package:advocateoffice/model/address/district.dart';
import 'package:advocateoffice/model/address/division.dart';
import 'package:advocateoffice/model/address/thana.dart';
import 'package:advocateoffice/model/client_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsController extends GetxController {
  final TextEditingController nameSearchController = TextEditingController();
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController phoneSearchControllers = TextEditingController();

  final TextEditingController clientPhoneNumberController =
      TextEditingController();
  final TextEditingController clientAlternativeNumberController =
      TextEditingController();
  final TextEditingController clientMailController = TextEditingController();
  final TextEditingController clientFatherNameController =
      TextEditingController();
  final TextEditingController clientVillageController = TextEditingController();
  final TextEditingController extra1 = TextEditingController();
  final TextEditingController extra2 = TextEditingController();
  final TextEditingController extra3 = TextEditingController();
  final TextEditingController clientProfessionController =
      TextEditingController();
  RxList<ClientListModel> clientsList = <ClientListModel>[].obs;
  RxList<ClientListModel> filteredClientsList = <ClientListModel>[].obs;
  GlobalKey<FormState> fromKey = Get.put(GlobalKey<FormState>());
  RxList<DivisionModel> divList = <DivisionModel>[].obs;
  RxList<DistrictModel> disList = <DistrictModel>[].obs;
  RxList<ThanaModel> thanaList = <ThanaModel>[].obs;
  RxList<String> testList = <String>["Dhaka", "Chattogram", "Rajshahi"].obs;
  RxString selectedDivision = "".obs;
  RxString selectedDistrict = "".obs;
  RxString selectedThana = "".obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchClient();
    getAddressData();
  }

  fetchClient() async {
    isLoading.value = true;
    clientsList.value = await ClientListService.service();
    filteredClientsList.value = clientsList;
    isLoading.value = false;
  }

  getAddressData() async {
    divList.value = await AddressService.divService();
    disList.value = await AddressService.disService();
    thanaList.value = await AddressService.thanaService();
  }

  editSection({required String id}) {}

  setData({required ClientListModel myData}) async {
    clientNameController.text = myData.name.toString();
    clientFatherNameController.text = myData.fathersName.toString();
    clientProfessionController.text = myData.profession.toString();
    clientPhoneNumberController.text = myData.phone.toString();
    clientAlternativeNumberController.text = myData.alterPhone.toString();
    clientMailController.text = myData.mail.toString();
    clientVillageController.text = myData.address.toString();
  }

  void clearField() {
    clientNameController.clear();
    clientFatherNameController.clear();
    clientProfessionController.clear();
    clientPhoneNumberController.clear();
    clientAlternativeNumberController.clear();
    clientVillageController.clear();
  }

  @override
  void dispose() {
    nameSearchController.dispose();
    clientNameController.dispose();
    clientPhoneNumberController.dispose();
    clientAlternativeNumberController.dispose();
    clientMailController.dispose();
    clientFatherNameController.dispose();
    clientVillageController.dispose();
    clientProfessionController.dispose();
    super.dispose();
  }
}
