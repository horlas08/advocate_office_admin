import 'package:advocateoffice/controller/ui/login.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/login/desktop_tablet/login.dart';
import 'package:advocateoffice/view/screen/login/mobile/login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: LoginDesktopTablet(loginController: controller),
          tablet: LoginDesktopTablet(loginController: controller),
          phone: LoginMobile(loginController: controller),
        ),
      ),
    );
  }
}
