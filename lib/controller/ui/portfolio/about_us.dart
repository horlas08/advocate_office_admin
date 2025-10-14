import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AboutUsController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final fromKey = Get.put(GlobalKey<FormState>());

  RxBool isLoading = true.obs;
  var image = Rx<Uint8List?>(null);
  var imagePath = Rx<String?>(null);
  XFile? imgFile;
  var selectImage = Rx<String?>(null);

  fetchData()async{
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
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
  void onInit() {fetchData();
    super.onInit();
  }
}
