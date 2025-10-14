import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseInfoCard extends StatelessWidget {
  const CaseInfoCard({
    super.key,
    required this.cardTitle,
    required this.cardList,
    required this.buttonName,
    required this.addButton,
    required this.onDelete,
  });

  final String cardTitle;
  final String buttonName;
  final RxList<String> cardList;
  final VoidCallback addButton;
  final Function(String) onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(text: cardTitle,  fontSize: 20),
            CustomButtonWidget(
              vertical: 13,
              buttonName: buttonName,
              onTap: addButton,
            )
          ],
        ),
        SizedBox(height: 10),
        Obx(
          () => Card(
            elevation: 10,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: cardList.map((stage) {
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Card(
                          color: Theme.of(context).focusColor,
                          margin: EdgeInsets.all(8),
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: CustomTextWidget(
                              text: stage,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: InkWell(
                            radius: 10,
                            onTap: () => onDelete(stage),
                            child: Icon(
                              Icons.close,
                              size: 17,
                            ),
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
