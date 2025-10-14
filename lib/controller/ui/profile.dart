import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var image = Rx<Uint8List?>(null); 
  var imagePath = Rx<String?>(null);

  XFile? imgFile;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      image.value = await pickedFile.readAsBytes();
      imgFile = pickedFile;
    }
  }

  final TextEditingController fastNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
 

  final TextEditingController addressController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmController =
      TextEditingController();

  GlobalKey<FormState> fromKey = Get.put(GlobalKey<FormState>());

  RxBool isShowPassword = false.obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  var selectedDate = Rxn<DateTime>();
  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  

  void clearField() {
    fastNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    mailController.clear();

    addressController.clear();
  }

  @override
  void dispose() {
    fastNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    mailController.dispose();

    addressController.dispose();

    super.dispose();
  }

  void toggleShowPassword() {
    isShowPassword.value = !isShowPassword.value;
  }
}
