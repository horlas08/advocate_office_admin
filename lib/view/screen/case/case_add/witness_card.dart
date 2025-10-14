import 'package:advocateoffice/controller/ui/case/case_add.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:flutter/material.dart';

class WitnessRow extends StatelessWidget {
  WitnessRow({super.key, required this.controller});

  final CaseCreateController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: controller.witnessList.map((entry) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Chip(
            label: CustomSelectableTextWidget(
              text: "${entry.name}  -  ${entry.phone}",
              fontSize: 15,
            ),
            deleteIcon: Icon(Icons.close),
            onDeleted: () {
              controller.witnessList.remove(entry);
            },
          ),
        );
      }).toList(),
    );
  }
}
