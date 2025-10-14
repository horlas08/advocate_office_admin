import 'package:advocateoffice/controller/api/login.dart';
import 'package:advocateoffice/controller/ui/auth_controller.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/utils/local_storage/local_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController mailController = TextEditingController(text: "admin@gmail.com");
  TextEditingController passController = TextEditingController(text: "123456");
  RxBool isLoading = false.obs;

  Future<void> loginFunction() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;
    bool status = await LoginService.service(email: mailController.text, password: passController.text);

    if (status) {
      await LocalData().writeData(key: "user_info", value: "login");
      AuthController authController = Get.find<AuthController>();
      authController.initializeAuthState();
      await Future.delayed(Duration(seconds: 2));
      isLoading.value = false;
      Get.offAllNamed(RoutesName.dashboard);
    }
    isLoading.value = false;
  }

  @override
  void dispose() {
    mailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
