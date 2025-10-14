import 'dart:typed_data';
import 'package:advocateoffice/controller/api/settings/employee.dart';
import 'package:advocateoffice/model/employee_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EmployeeController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController employeeNumberController = TextEditingController();
  final TextEditingController employeeMailController = TextEditingController();
  final TextEditingController employeeDesignationController = TextEditingController();
  final fromKey = Get.put(GlobalKey<FormState>());
  RxList<EmployeeDataModel> employeeList = <EmployeeDataModel>[].obs;
  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  RxBool isLoading = true.obs;
  Rx<Uint8List?> image = Rx<Uint8List?>(null);
  Rx<String?> imagePath = Rx<String?>(null);
  XFile? imgFile;
  Rx<String?> selectImage = Rx<String?>(null);

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  getEmployee() async {
    isLoading.value = true;
    employeeList.value = await EmployeeService.getService();
    isLoading.value = false;
  }

  clearDataFunction({join}) {
    employeeNameController.clear();
    employeeNumberController.clear();
    employeeMailController.clear();
    employeeDesignationController.clear();
  }

  initialDataFunction({required EmployeeDataModel data}) {
    employeeNameController.text = data.name.toString();
    employeeNumberController.text = data.phone.toString();
    employeeMailController.text = data.mail.toString();
    employeeDesignationController.text = data.designation.toString();
    final parsedDate = DateFormat("d MMM yyyy").parse(data.joinDate.toString());
    selectedDate.value = parsedDate;
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
  }
}
