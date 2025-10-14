import 'package:advocateoffice/controller/ui/case/case_add.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';

class ImageRow extends StatelessWidget {
  ImageRow({super.key, required this.controller, this.width});

  final CaseCreateController controller;

  final double? width;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: controller.imageList.map((entry) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Chip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(image: entry.image != null ? MemoryImage(entry.image!) : AssetImage("assets/bg_removed.png"))),
                  ),
                  SizedBox(width: 5),
                  CustomTextWidget(text: entry.title, maxLine: 3)
                ],
              ),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {
                controller.imageList.remove(entry);
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
