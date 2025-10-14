import 'package:advocateoffice/controller/ui/portfolio/home.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/dashboard_shimmer.dart';
import 'package:advocateoffice/view/common_widgets.dart/header.dart';
import 'package:advocateoffice/view/common_widgets.dart/header_mobile.dart';
import 'package:advocateoffice/view/common_widgets.dart/mobile_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:advocateoffice/view/common_widgets.dart/nav_bar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'image_picker.dart';

class HomePortfolioScreenDesktopTablet extends StatelessWidget {
  const HomePortfolioScreenDesktopTablet(
      {Key? key, required this.controller, required this.screenType})
      : super(key: key);
  final HomeController controller;
  final String screenType;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: screenType == "Mob"
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: const DashboardHeaderMobile(title: 'الصفحة الرئيسية'),
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
                            screenType == "Mob"
                                ? SizedBox()
                                : DashboardHeader(
                                    title:
                                        'الصفحة الرئيسية ومعلومات عنا ${screenType}'),
                            const SizedBox(height: 20),
                            Card(
                              child: SizedBox(
                                width: size,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                          text: "قسم الصفحة الرئيسية",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 25),
                                      SizedBox(height: 20),
                                      Wrap(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 300,
                                              width: screenType == "Mob"
                                                  ? MediaQuery.sizeOf(context)
                                                      .width
                                                  : 150 + (size / 3.5),
                                              child: PickImageFromHome(
                                                controller: controller,
                                                height: 300,
                                                title: "اختر شعار المحفظة",
                                                selectImg:
                                                    controller.selectHomeImage,
                                                imgPath:
                                                    controller.homeImagePath,
                                                img: controller.homeImage,
                                                onTap: () {
                                                  controller.pickHomeImage();
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(height: 20),
                                                Obx(
                                                  () => CustomTextWidget(
                                                      text:
                                                          "${controller.portfolioTitle.value}",
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      maxLine: 2),
                                                ),
                                                SizedBox(height: 25),
                                                SizedBox(
                                                    width: 400,
                                                    child: CommonField(
                                                        onChanged: (v) {
                                                          if (v != null &&
                                                              v.length != 0) {
                                                            controller
                                                                .portfolioTitle
                                                                .value = v;
                                                          } else {
                                                            controller
                                                                    .portfolioTitle
                                                                    .value =
                                                                "ادخل اسم المحفظة";
                                                          }
                                                        },
                                                        text: "اسم الشركة",
                                                        hintText:
                                                            "اسم شركتك.")),
                                                SizedBox(height: 20),
                                                SizedBox(
                                                    width: 600,
                                                    child: CommonField(
                                                        controller: controller
                                                            .homeQuoteController,
                                                        text:
                                                            "اقتباس الصفحة الرئيسية",
                                                        hintText:
                                                            "اكتب اقتباسك.",
                                                        minLines: 2)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      CommonField(
                                          controller: controller
                                              .homeQuoteDetailsController,
                                          text: "تفاصيل الاقتباس",
                                          hintText: "اكتب تفاصيل الاقتباس.",
                                          minLines: 5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Card(
                              child: SizedBox(
                                width: size,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                          text: "قسم معلومات عنا",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 25),
                                      SizedBox(height: 20),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        alignment: WrapAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            height: 300,
                                            width: screenType == "Mob"
                                                ? MediaQuery.sizeOf(context)
                                                    .width
                                                : 150 + (size / 3.5),
                                            child: PickImageFromHome(
                                              controller: controller,
                                              height: 300,
                                              title:
                                                  "اختر صورة غلاف قسم معلومات عنا",
                                              selectImg:
                                                  controller.selectAboutImage,
                                              imgPath:
                                                  controller.aboutImagePath,
                                              img: controller.aboutImage,
                                              onTap: () {
                                                controller.pickAboutImage();
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(height: 20),
                                                SizedBox(
                                                    width: 400,
                                                    child: CommonField(
                                                        text:
                                                            "عنوان معلومات عنا",
                                                        hintText:
                                                            "ادخل عنوان معلومات عنا")),
                                                SizedBox(height: 20),
                                                SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width /
                                                        2.5,
                                                    child: CommonField(
                                                        text:
                                                            "تفاصيل معلومات عنا",
                                                        hintText:
                                                            "اكتب تفاصيل معلومات عنا.",
                                                        minLines: 6)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
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
          buttonName: 'حفظ',
          onTap: () {
            EasyLoading.showSuccess("تم بنجاح");
          },
        ),
      ),
    );
  }
}
