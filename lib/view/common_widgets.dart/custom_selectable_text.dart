import 'package:flutter/material.dart';

class CustomSelectableTextWidget extends StatelessWidget {
  const CustomSelectableTextWidget(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontColor,
      this.maxLine,
      this.fontWeight,
      this.textOverflow,
      this.textAlign,
      this.fontFamily,
      this.textLineThrough});

  final String text;
  final bool? textLineThrough;
  final double? fontSize;
  final Color? fontColor;
  final int? maxLine;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      maxLines: maxLine ?? 1,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: Theme.of(context).dividerColor,
        decoration: textLineThrough == true
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        decorationThickness: 2.1,
        fontFamily: fontFamily ?? 'normal',
        fontSize: fontSize ?? 14,
        color: fontColor ??
            Theme.of(context).textTheme.headlineMedium?.color!,
        fontWeight: fontWeight ?? FontWeight.normal,
        overflow: textOverflow ?? TextOverflow.ellipsis,
      ),
    );
  }
}
