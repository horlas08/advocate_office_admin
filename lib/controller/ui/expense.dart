import 'dart:developer';
import 'dart:typed_data';
import 'package:advocateoffice/controller/api/exp_list.dart';
import 'package:advocateoffice/data/exp_purpose.dart';
import 'package:advocateoffice/model/exp_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ExpenseController extends GetxController {
  final fromKey = Get.put(GlobalKey<FormState>());
  final TextEditingController searchController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  RxList<ExpenseDataModel> expDataList = <ExpenseDataModel>[].obs;
  RxList<String> purposeList = <String>[].obs;
  RxBool isLoading = true.obs;
  RxString selectedPurposeOf = "".obs;
  RxString selectedCaseID = "".obs;
  RxList<String> caseIdList = ["CASE001", "CASE002", "CASE003"].obs;
  RxBool isChecked = false.obs;
  var image = Rx<Uint8List?>(null);
  var imagePath = Rx<String?>(null);
  XFile? imgFile;
  var selectImage = Rx<String?>(null);

  fetchExpData() async {
    isLoading.value = true;
    expDataList.value = await ExpListService.service();
    isLoading.value = false;
  }

  fetchPurposeData() async {
    purposeList.value = ExpPurposeData.data;
  }

  initialValue({required ExpenseDataModel data}) {
    amountController.text = data.amount.toString();
    commentController.text = data.remark.toString();
    selectImage.value = data.voucherImg;
    log("${data.voucherImg}");
  }

  clearValue() {
    amountController.clear();
    commentController.clear();
    selectImage.value = "";
  }

  @override
  void onInit() {
    super.onInit();
    fetchExpData();
    fetchPurposeData();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      image.value = await pickedFile.readAsBytes();
      imgFile = pickedFile;
    }
  }
}
