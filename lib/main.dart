import 'package:advocateoffice/routes/get_pages.dart';
import 'package:advocateoffice/utils/settings/easyloading_settings.dart';
import 'package:advocateoffice/utils/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'utils/settings/localization.dart';
import 'controller/ui/auth_controller.dart';

// If you run in web (for dynamic Routing) then you need to uncomment this(12,14,15,16,21) lines.

// import 'package:flutter_web_plugins/flutter_web_plugins.dart';
//
// void configureApp() {
//   setUrlStrategy(PathUrlStrategy());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyloadingSettings().easyloadingSetting();
  //configureApp();
  final authController = Get.put(AuthController());
  await authController.initializeAuthState(); //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Advocate Office',
      translations: Localization(), // your translations
      locale: const Locale('ar'), // default locale is Arabic
      fallbackLocale: const Locale('ar'),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: LightThemes.light,
      getPages: GetPages.getPage,
    );
  }
}
