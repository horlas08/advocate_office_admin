import 'package:advocateoffice/utils/app_colors.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_text_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class CommonField extends StatelessWidget {
  const CommonField({
    super.key,
    required this.text,
    required this.hintText,
    this.validator,
    this.controller,
    this.onChanged,
    this.textInputAction,
    this.readOnly,
    this.keyboardType,
    this.validatorIcon,
    this.minLines,
    this.inputFormatters,
    this.prefixIcon,
    this.validatorFunction,
    this.focusNode,
  });
  final String text;
  final String hintText;
  final String? validator;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final bool? readOnly;
  final bool? validatorIcon;
  final TextInputType? keyboardType;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final String? Function(String?)? validatorFunction;
    final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomTextWidget(
              text: text,
              fontColor: Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(.5),
            ),
            validatorIcon == true
                ? CustomTextWidget(
                    text: "*",
                    fontColor: AppColors.errorColor,
                    fontSize: 16,
                  )
                : Container(),
          ],
        ),
        const Gap(10),
        CustomTextField(
            focusNode: focusNode,
          minLines: minLines ?? 1,
          prefixIcon: prefixIcon,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType ?? TextInputType.text,
          onChanged: onChanged,
          controller: controller,
          readOnly: readOnly ?? false,
          textInputAction: textInputAction ?? TextInputAction.next,
          hintText: hintText,
          validator: validatorFunction ??
              (value) {
                if (value == null || value.isEmpty) {
                  return validator;
                }
                return null;
              },
        ),
      ],
    );
  }
}
