import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class DragDropBackup extends StatelessWidget {
  const DragDropBackup({Key? key, required this.controller}) : super(key: key);
  final controller;

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? GestureDetector(
            onTap: () {
              log("Add");

              controller.pickImage();
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      // Ensure DropzoneView has a size constraint
                      Positioned.fill(
                        child: DropzoneView(
                          onCreated: (ctrl) {},
                          onDrop: (file) async {
                            // File dropped, now we need to get its data
                            final fileName = file.name;
                            log("File dropped: $fileName");
                            controller.message.value =
                                "File dropped: $fileName";
                            log("File dropped: ${controller.message.value}");

                            final fileObject = File(file.name);
                            final bytes = await fileObject.readAsBytes();
                            controller.image.value = bytes;
                            log("File bytes: ${controller.image.value}");
                          },
                          onHover: () {
                            controller.message.value = "Drop the file here...";
                            log("Hovering over dropzone");
                          },
                          onLeave: () {
                            controller.message.value =
                                "Drag & Drop a backup to import it";
                            log("Leaving dropzone");
                          },
                        ),
                      ),
                      Container(
                        height: 210,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // When no image is selected
                            Obx(() => controller.image.value == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.cloud_upload,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        controller.message.value,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )
                                : SizedBox()),

                            Obx(
                              () => controller.image.value != null
                                  ? Image.memory(
                                      controller.image.value!,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    )
                                  : SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Center(
            child: Stack(
              children: [
                Obx(() {
                  return CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blueAccent,
                    child: CircleAvatar(
                      radius: 58,
                      backgroundImage: controller.image.value == null
                          ? NetworkImage(
                              "https://img.icons8.com/?size=100&id=23280&format=png&color=000000")
                          : MemoryImage(
                              controller.image.value!,
                            ),
                    ),
                  );
                }),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      controller.pickImage(); // Open image picker
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.blueAccent,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
