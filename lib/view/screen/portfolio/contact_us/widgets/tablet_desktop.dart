import 'package:advocateoffice/controller/ui/portfolio/contact_us.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ContactUsPortfolioScreenDesktopTablet extends StatelessWidget {
  const ContactUsPortfolioScreenDesktopTablet({Key? key, required this.controller, required this.screenType}) : super(key: key);
  final ContactUsController controller;
  final String screenType;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: screenType == "Mob"
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: const DashboardHeaderMobile(title: 'اتصل بنا'),
            )
          : null,
      drawer: screenType == "Mob" ? NavigationBarViewMobile() : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          screenType == "Mob" ? SizedBox() : NavigationBarView(),
          Obx(
            () => controller.isLoading.isTrue
                ? Expanded(child: DashboardShimmer())
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            screenType == "Mob" ? SizedBox() : DashboardHeader(title: 'اتصل بنا ${screenType}'),
                            const SizedBox(height: 50),
                            Card(
                              child: SizedBox(
                                width: size,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.start,
                                        alignment: WrapAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              CustomTextWidget(text: "صورة الموقع على خريطة جوجل", fontWeight: FontWeight.w700, fontSize: 25),
                                              Container(
                                                  margin: EdgeInsets.all(8),
                                                  height: 400,
                                                  width: screenType != "Desk"
                                                      ? MediaQuery.sizeOf(context).width
                                                      : MediaQuery.sizeOf(context).width / 2.8,
                                                  child: ImagePick(
                                                    controller: controller,
                                                    height: 400,
                                                    title: "صورة الموقع على خريطة جوجل",
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                CustomTextWidget(text: "معلومات الاتصال", fontWeight: FontWeight.w700, fontSize: 25),
                                                SizedBox(height: 20),
                                                SizedBox(
                                                  width: screenType != "Desk"
                                                      ? MediaQuery.sizeOf(context).width
                                                      : MediaQuery.sizeOf(context).width / 2.8,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                          child: CommonField(
                                                              text: "خط العرض", hintText: "أدخل خط العرض", keyboardType: TextInputType.number)),
                                                      SizedBox(width: 20),
                                                      Expanded(
                                                          child: CommonField(
                                                              text: "خط الطول", hintText: "أدخل خط الطول", keyboardType: TextInputType.number)),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                SizedBox(
                                                    width: screenType != "Desk"
                                                        ? MediaQuery.sizeOf(context).width
                                                        : MediaQuery.sizeOf(context).width / 2.8,
                                                    child: CommonField(text: "العنوان الكامل", hintText: "أدخل عنوان الشركة")),
                                                SizedBox(height: 20),
                                                SizedBox(
                                                  width: screenType != "Desk"
                                                      ? MediaQuery.sizeOf(context).width
                                                      : MediaQuery.sizeOf(context).width / 2.8,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(child: CommonField(text: "عنوان البريد الإلكتروني", hintText: "أدخل عنوان البريد الإلكتروني")),
                                                      SizedBox(width: 20),
                                                      Expanded(child: CommonField(text: "رقم الهاتف", hintText: "أدخل رقم الهاتف")),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                SizedBox(
                                                    width: screenType != "Desk"
                                                        ? MediaQuery.sizeOf(context).width
                                                        : MediaQuery.sizeOf(context).width / 2.8,
                                                    child: CommonField(text: "رابط صفحة الفيسبوك", hintText: "أدخل على رابط صفحة الفيسبوك الخاصة بالشركة")),
                                                SizedBox(height: 20),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          width: MediaQuery.sizeOf(context).width,
                                          child: CommonField(
                                            text: "تفاصيل للموقع",
                                            hintText: "أدخل التفاصيل للعثور على الموقع بسهولة.",
                                            minLines: 6,
                                          )),
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
        ],
      ),
      floatingActionButton: FittedBox(
        child: CustomButtonWidget(
          buttonName: 'يحفظ',
          onTap: () {
            EasyLoading.showSuccess("ناجح");
          },
        ),
      ),
    );
  }
}
