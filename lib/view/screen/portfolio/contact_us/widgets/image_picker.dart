import 'dart:io';
import 'package:advocateoffice/controller/ui/portfolio/home.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickImageFromHome extends StatelessWidget {
  const PickImageFromHome(
      {super.key,
      required this.controller,
      this.height,
      this.title,
      required this.selectImg,
      required this.imgPath,
      required this.img,
      required this.onTap});
  final HomeController controller;
  final double? height;
  final String? title;
  final Rx<String?> selectImg;
  final Rx<String?> imgPath;
  final Rx<Uint8List?> img;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (selectImg.value != null) {
                return Container(
                  height: height ?? 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Image.network(
                        selectImg.value!,
                      ),
                    ),
                  ),
                );
              }
              if (img.value == null) {
                return Container(
                  height: height ?? 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: CustomTextWidget(
                        maxLine: 20,
                        text: title ?? "تحميل صورة القسيمة",
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(120),
                      ),
                    ),
                  ),
                );
              } else if (kIsWeb) {
                return Container(
                  height: height ?? 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Image.memory(img.value!)),
                  ),
                );
              } else {
                return Container(
                  height: height ?? 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).textTheme.headlineMedium!.color!.withAlpha(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Image.file(File(imgPath.value!))),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
