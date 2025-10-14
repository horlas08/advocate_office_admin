import 'dart:io';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePick extends StatelessWidget {
  final controller;
  final String? title;
  final double? height;

  const ImagePick({
    Key? key,
    required this.controller, this.title, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          controller.pickImage();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (controller.selectImage.value != null) {
                return Container(
                  height: height ?? 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .color!
                          .withAlpha(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Image.network(
                        controller.selectImage.value!,
                      ),
                    ),
                  ),
                );
              }
              if (controller.image.value == null) {
                return Container(
                  height: height ?? 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .color!
                          .withAlpha(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: CustomTextWidget(
                        maxLine: 20,
                        text: title ?? "Upload Voucher Image",
                        fontWeight: FontWeight.bold,
                        fontColor: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .color!
                            .withAlpha(120),
                      ),
                    ),
                  ),
                );
              } else if (kIsWeb) {
                return Container(
                  height:height ?? 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .color!
                          .withAlpha(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Image.memory(controller.image.value!)),
                  ),
                );
              } else {
                return Container(
                  height: height ?? 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .color!
                          .withAlpha(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Image.file(File(controller.imagePath.value!))),
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
