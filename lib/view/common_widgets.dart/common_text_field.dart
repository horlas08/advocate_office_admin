import 'package:advocateoffice/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final bool? readOnly;
  final String? labelText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  const CustomTextField({
    super.key,
    this.controller,
    this.textInputAction,
    this.hintText,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.labelText,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.readOnly,
    this.inputFormatters,this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode ?? FocusNode(),
      controller: controller,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: readOnly == true
            ? Theme.of(context).textTheme.headlineMedium?.color!.withOpacity(.5)
            : Theme.of(context).textTheme.headlineMedium?.color!,
      ),
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType ?? TextInputType.text,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines ?? 1,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: Theme.of(context).textTheme.headlineMedium?.color,
        hintText: hintText ?? "Enter text".tr,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(),
        hintStyle: TextStyle(
          fontSize: 14,
          color: Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(.5),
        ),
        errorStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.errorColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
                Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(.5),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
                Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(.5),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
                Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(.5),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
                Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(.5),
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
                Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(.5),
            width: 1,
          ),
        ),
      ),
    );
  }
}
