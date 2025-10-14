import 'package:advocateoffice/controller/ui/login.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_text_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key, required this.loginController});
  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  opacity: .8,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/login_image.jpeg"))),
          child: Center(
            child: Card(
              elevation: 20,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,
                child: Row(
                  children: [
                    MediaQuery.sizeOf(context).width > 1000
                        ? Expanded(
                            child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/bg_removed.png"))),
                          ))
                        : SizedBox(),
                    SizedBox(width: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Form(
                          key: loginController.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextWidget(
                                text: "تسجيل الدخول",
                                fontColor: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color,
                                fontSize: 25,
                                maxLine: 2,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: 20),
                              CustomTextField(
                                hintText: "أدخل بريدك الإلكتروني",
                                maxLines: 1,
                                controller: loginController.mailController,
                                validator: (v) {
                                  if (v.toString() == "" ||
                                      v.toString().isEmpty) {
                                    return "لا يمكن ترك الحقل فارغاً";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              CustomTextField(
                                hintText: "أدخل كلمة المرور",
                                maxLines: 1,
                                controller: loginController.passController,
                                validator: (v) {
                                  if (v.toString() == "" ||
                                      v.toString().isEmpty) {
                                    return "لا يمكن ترك الحقل فارغاً";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              Obx(
                                () => loginController.isLoading.value
                                    ? buildCardLoading(context)
                                    : InkWell(
                                        onTap: () {
                                          loginController.loginFunction();
                                        },
                                        child: buildCardButton(context),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card buildCardButton(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget(
                text: "تسجيل الدخول",
                fontColor: Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 25)
          ],
        ),
      ),
    );
  }

  Card buildCardLoading(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Theme.of(context).cardColor,
              backgroundColor:
                  Theme.of(context).textTheme.headlineMedium!.color,
            )
          ],
        ),
      ),
    );
  }
}
