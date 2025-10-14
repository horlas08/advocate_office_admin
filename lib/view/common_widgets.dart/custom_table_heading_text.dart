import 'package:flutter/material.dart';

class CustomTblHeadText extends StatelessWidget {
  const CustomTblHeadText({super.key, required this.text, this.fontSize, this.fontColor, this.textAlign});

  final String text;
  final double? fontSize;
  final Color? fontColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      maxLines: 1,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        letterSpacing: 1,
        decorationStyle: TextDecorationStyle.solid,
        fontSize: fontSize ?? 16,
        color: fontColor ?? Theme.of(context).textTheme.headlineMedium?.color,
        fontWeight: FontWeight.w600 ,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
