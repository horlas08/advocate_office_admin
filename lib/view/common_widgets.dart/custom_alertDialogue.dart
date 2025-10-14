import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomAlertDialogue extends StatelessWidget {
  const CustomAlertDialogue({
    super.key,
    required this.title,
    required this.body,
    this.cancelButtonName,
    this.confirmButtonName,
    required this.confirmButtonFunction,
  });

  final String title;
  final Widget body;
  final String? cancelButtonName;
  final String? confirmButtonName;
  final VoidCallback confirmButtonFunction;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        surfaceTintColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
            text:  title,
            maxLine: 2,
           
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontColor: Theme.of(context).textTheme.headlineMedium!.color,
       
            ),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Theme.of(context).textTheme.headlineMedium!.color,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: Container(
          width: 800,
          child: body,
        ),
        actions: [
          CustomButtonWidget(
              width: 100,
              buttonName: confirmButtonName ?? "أكد",
              onTap: confirmButtonFunction),
        ],
      ),
    );
  }
}
