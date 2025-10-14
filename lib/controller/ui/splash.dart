
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    timer();
  }

  void timer() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Get.offNamed(RoutesName.dashboard);
    });
  }
}