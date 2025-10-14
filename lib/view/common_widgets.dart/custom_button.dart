import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.buttonName,
    this.horizontal,
    this.vertical,
    this.textColor,
    this.buttonColor,
    required this.onTap,
    this.width,
  });

  final String buttonName;
  final VoidCallback onTap;
  final double? horizontal;
  final double? vertical;
  final Color? textColor;
  final Color? buttonColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(.3))),
        color: buttonColor ?? Theme.of(context).textTheme.headlineMedium!.color,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontal ?? 20, vertical: vertical ?? 10),
          child: SizedBox(
            width: width,
            child: Center(
              child: CustomTextWidget(
                text: buttonName,
                fontWeight: FontWeight.w600,
                fontColor:
                    textColor ?? Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
