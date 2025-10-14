import 'dart:typed_data';
import 'package:advocateoffice/data/portfolio/home.dart';
import 'package:advocateoffice/model/portfile/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final TextEditingController homeQuoteController = TextEditingController(text: HomeData.homeQuote);
  final TextEditingController homeQuoteDetailsController = TextEditingController(text: HomeData.quoteDetails);
  final TextEditingController aboutTitleController = TextEditingController();
  final TextEditingController aboutDetailsController = TextEditingController();
  RxString portfolioTitle = "أدخل اسم المحفظة".obs;
  final fromKey = Get.put(GlobalKey<FormState>());
  RxList<ServiceModel> serviceList = <ServiceModel>[].obs;

  RxBool isLoading = true.obs;
  Rx<Uint8List?> homeImage = Rx<Uint8List?>(null);
  Rx<Uint8List?> aboutImage = Rx<Uint8List?>(null);
  Rx<String?> homeImagePath = Rx<String?>(null);
  Rx<String?> aboutImagePath = Rx<String?>(null);
  XFile? imgFile;
  Rx<String?> selectHomeImage = Rx<String?>(null);
  Rx<String?> selectAboutImage = Rx<String?>(null);


  fetchData() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    selectHomeImage.value = HomeData.logo;
    isLoading.value = false;
  }

  Future<void> pickHomeImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      homeImagePath.value = pickedFile.path;
      homeImage.value = await pickedFile.readAsBytes();
      imgFile = pickedFile;
    }
  }
  Future<void> pickAboutImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      aboutImagePath.value = pickedFile.path;
      aboutImage.value = await pickedFile.readAsBytes();
      imgFile = pickedFile;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}
