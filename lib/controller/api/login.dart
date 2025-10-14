import 'dart:developer';
import 'package:advocateoffice/data/employee.dart';
import 'package:advocateoffice/utils/common_function/common_snackbar_message.dart';

class LoginService {
  static Future<bool> service({required String email, required String password}) async {
    try {
       bool isUserFound = false;
      for (var i in EmployeeData.employeeList) {
        log("======${i["mail"]}====================");
        if (i["mail"] == email && password == "123456") {
          isUserFound = true;
          break;
        }
      }
      if (isUserFound) {
        CommonSnackBarMessage.successMessage(text: "تم تسجيل الدخول بنجاح.");
        return true;
      }
      CommonSnackBarMessage.errorMessage(text: "مستخدم خاطئ..!!");
      return false;
    } catch (e) {
      log("Error : $e");
    }
    CommonSnackBarMessage.errorMessage(text: "حدث خطأ ما.!!");
    return false;
  }
}
