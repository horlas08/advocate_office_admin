
import 'package:get/get.dart';

class PermissionController extends GetxController {
  RxBool isLoading = true.obs;
  RxString selectedEmployee = "".obs;

  Map<String, Map<String, bool>> permissions = {
    "dashboardSection": {
      "view": true,
      "add": false,
      "edit": true,
      "delete": true,
    },
    "clientSection": {
      "view": true,
      "add": false,
      "edit": true,
      "delete": false,
    },
    "visitorSection": {
      "add": true,
      "edit": true,
      "delete": true,
      "makeClient": true,
    },
    "caseSection": {
      "add": true,
      "edit": true,
      "delete": false,
      "makeClient": false,
    },
  };

  List<String> employeeRoleList = [
    "Senior Advocate",
    "Junior Advocate",
    "Legal Advisor",
    "Legal Researcher",
    "Paralegal",
    "Office Manager",
    "Receptionist",
    "Clerk"
  ];

  getLoading() async {
    selectedEmployee.value = "";
    isLoading.value = true;
    await Future.delayed(Duration(milliseconds: 200));
    isLoading.value = false;
  }
}
