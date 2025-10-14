import 'package:advocateoffice/utils/local_storage/local_data.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  initializeAuthState() async {
    var data = await LocalData().readData(key: "user_info");
    isLoggedIn.value = data.isNotEmpty;
    return;
  }
}
