import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDropDown extends StatelessWidget {
  const CommonDropDown({
    super.key,
    required this.context,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.borderColor,
  });

  final BuildContext context;
  final String label;
  final RxString value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w100,
              color: Theme.of(context).textTheme.headlineMedium?.color,
            )),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: borderColor ?? Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(.5),
            ),
          ),
          child: Obx(() {
            return DropdownButton<String>(
              padding: const EdgeInsets.only(left: 10),
              elevation: 8,
              borderRadius: BorderRadius.circular(10),
              isExpanded: true,
              hint: CustomTextWidget(text: label),
              value: value.value.isNotEmpty ? value.value : null,
              iconDisabledColor: Theme.of(context).textTheme.headlineMedium?.color,
              iconEnabledColor: Theme.of(context).textTheme.headlineMedium?.color,
              focusColor: Colors.transparent,
              dropdownColor: Theme.of(context).focusColor,
              underline: const SizedBox(),
              onChanged: onChanged,
              items: items.isEmpty
                  ? [
                      DropdownMenuItem<String>(
                        value: "",
                        child: CustomTextWidget(
                          text: "لا توجد عناصر متاحة",
                          fontColor: Theme.of(context).textTheme.headlineMedium?.color!,
                        ),
                      )
                    ]
                  : items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: CustomTextWidget(
                          text: item,
                          fontColor: Theme.of(context).textTheme.headlineMedium?.color!,
                        ),
                      );
                    }).toList(),
            );
          }),
        ),
      ],
    );
  }
}
