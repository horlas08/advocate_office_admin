import 'dart:typed_data';
import 'package:advocateoffice/controller/api/portfolio/service.dart';
import 'package:advocateoffice/model/portfile/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ServiceController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final fromKey = Get.put(GlobalKey<FormState>());
  RxList<ServiceModel> serviceList = <ServiceModel>[].obs;

  RxBool isLoading = true.obs;
  Rx<Uint8List?> image = Rx<Uint8List?>(null);
  Rx<String?> imagePath = Rx<String?>(null);
  XFile? imgFile;
  Rx<String?> selectImage = Rx<String?>(null);
  Rx<Uint8List?> iconImage = Rx<Uint8List?>(null);
  Rx<String?> iconImagePath = Rx<String?>(null);
  Rx<String?> selectIcon = Rx<String?>(null);

  getService() async {
    isLoading.value = true;
    serviceList.value = await PortfolioServiceService.service();
    isLoading.value = false;
  }

  clearDataFunction({join}) {}

  addNewServiceFun() async {
    ServiceModel serviceModel = ServiceModel(
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq2tmjnY2DqdFTuH8aON-uyibS1ST3xTJ9fA&s",
        title: titleController.text,
        id: "SR250105",
        status: 1,
        icon: "https://img.icons8.com/?size=100&id=bGXrrvAUiJZ8&format=png&color=000000",
        description: descriptionController.text);
    serviceList.add(serviceModel);
    titleController.clear();
    descriptionController.clear();
    EasyLoading.showSuccess("تمت الإضافة بنجاح");
    Get.back();
  }

  initialDataFunction({required ServiceModel data}) {
    titleController.text = data.title.toString();
    descriptionController.text = data.description.toString();
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

  Future<void> pickIconImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      iconImagePath.value = pickedFile.path;
      iconImage.value = await pickedFile.readAsBytes();
      imgFile = pickedFile;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getService();
  }
}
