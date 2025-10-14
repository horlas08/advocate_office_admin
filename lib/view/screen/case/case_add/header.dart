import 'package:advocateoffice/controller/ui/clients/clients_view.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseCreateHeaderDesktop extends StatelessWidget {
  CaseCreateHeaderDesktop({super.key});
  final ClientViewController controller = Get.put(ClientViewController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomSelectableTextWidget(
                        text: "محمد عبد الله الصديق",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomSelectableTextWidget(text: "(مطور الرفرفة)"),
                    ],
                  ),
                  SizedBox(height: 4),
                  CustomSelectableTextWidget(text: "اسم الأب : محمد خالد علي"),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      CustomSelectableTextWidget(text: "01737374083"),
                      CustomSelectableTextWidget(text: " , "),
                      CustomSelectableTextWidget(text: "01737374083"),
                    ],
                  ),
                  SizedBox(height: 4),
                  CustomSelectableTextWidget(text: "classicit@gmail.com"),
                  SizedBox(height: 4),
                  CustomSelectableTextWidget(text: "Road - 3, Sector - 12, Uttara - Dhaka"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
