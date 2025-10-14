import 'package:advocateoffice/controller/ui/dashboard.dart';
import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  StatsRow({super.key, required this.controller});
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildContainer(
          context: context,
          title: "الزوار",
          subTitle1: "الإجمالي",
          subValue1: "256",
          subTitle2: "الايام",
          subValue2: "6",
        ),
        _buildContainer(
          context: context,
          title: "الموكلين",
          subTitle1: "الإجمالي",
          subValue1: "179",
          subTitle2: "الايام",
          subValue2: "8",
        ),
        _buildContainer(
          context: context,
          title: "الدعاويالدعاوي",
          subTitle1: "الإجمالي",
          subValue1: "205",
          subTitle2: "ليوم",
          subValue2: "3",
        ),
        _buildContainer(
          context: context,
          title: "الجلسات",
          subTitle1: "اليوم",
          subValue1: "1",
          subTitle2: "اليوم التالي",
          subValue2: "3",
        ),
        _buildContainer(
            context: context,
            title: "الاتعاب المستلمة",
            subTitle1: "هذا الشهر",
            subValue1: "48025.00 $currencySymbol",
            subTitle2: "اليوم",
            subValue2: "3650.00 $currencySymbol"),
        _buildContainer(
            context: context,
            title: "الدخل الاضافى",
            subTitle1: "هذا الشهر",
            subValue1: "5505.00 $currencySymbol",
            subTitle2: "اليوم",
            subValue2: "150.00 $currencySymbol"),
        _buildContainer(
            context: context,
            title: "المصاريف",
            subTitle1: "هذا الشهر",
            subValue1: "6650.00 $currencySymbol",
            subTitle2: "اليوم",
            subValue2: "350.00 $currencySymbol"),
        _buildContainer(
            context: context,
            title: "الموظفون",
            subTitle1: "الاجمالي",
            subValue1: "8",
            subTitle2: "هذا الشهر",
            subValue2: "0"),
      ],
    );
  }

  Container _buildContainer(
      {required BuildContext context,
      required String title,
      required String subTitle1,
      required String subValue1,
      required String subTitle2,
      required String subValue2}) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).textTheme.headlineSmall!.color!.withOpacity(0.8),
            Theme.of(context).textTheme.headlineSmall!.color!.withOpacity(0.4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.layers_outlined, size: 35, color: Theme.of(context).textTheme.titleLarge!.color),
                SizedBox(width: 10),
                CustomTextWidget(text: title, fontSize: 20, fontWeight: FontWeight.w500, fontColor: Theme.of(context).textTheme.titleLarge!.color),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _customTextWidget(context: context, title: subTitle1, fSize: 14),
                    _customTextWidget(context: context, title: " : "),
                    _customTextWidget(context: context, title: subValue1),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _customTextWidget(context: context, title: subTitle2, fSize: 14),
                    _customTextWidget(context: context, title: " : "),
                    _customTextWidget(context: context, title: subValue2),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CustomTextWidget _customTextWidget({required BuildContext context, required String title, double? fSize}) {
    return CustomTextWidget(
        text: title, fontWeight: FontWeight.normal, fontSize: fSize ?? 15, fontColor: Theme.of(context).textTheme.titleLarge!.color);
  }
}
