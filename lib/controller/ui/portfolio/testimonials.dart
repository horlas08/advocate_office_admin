import 'dart:typed_data';
import 'package:advocateoffice/controller/api/portfolio/testimonials.dart';
import 'package:advocateoffice/model/portfile/testimonials.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TestimonialsController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController quoteController = TextEditingController();

  final fromKey = Get.put(GlobalKey<FormState>());
  RxList<TestimonialsModel> testimonialsList = <TestimonialsModel>[].obs;

  RxBool isLoading = true.obs;
  XFile? imgFile;
  Rx<Uint8List?> image = Rx<Uint8List?>(null);
  Rx<String?> imagePath = Rx<String?>(null);
  Rx<String?> selectImage = Rx<String?>(null);

  getService() async {
    isLoading.value = true;
    testimonialsList.value = await PortfolioTestimonialsService.service();
    isLoading.value = false;
  }

  clearDataFunction({join}) {
    nameController.clear();
    professionController.clear();
    quoteController.clear();
    imagePath.value = null;
    image.value = null;
    selectImage.value = null;
    
  }

  initialDataFunction({required TestimonialsModel data}) {
    nameController.text = data.name.toString();
    professionController.text = data.profession.toString();
    quoteController.text = data.quote.toString();
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

  @override
  void onInit() {
    super.onInit();
    getService();
  }
}
