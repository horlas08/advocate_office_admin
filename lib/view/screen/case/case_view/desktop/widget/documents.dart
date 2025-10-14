import 'package:advocateoffice/controller/ui/case/case_view.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

class DocumentRowDesktop extends StatelessWidget {
  const DocumentRowDesktop({super.key, required this.controller});
  final CaseViewController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: "وثيقة القضية", fontWeight: FontWeight.w600),
        SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: controller.imageList.map((entry) {
            return InkWell(
              onTap: () {
                showViewDialog(context: context, title: entry.title, img: entry.image);
              },
              child: SizedBox(
                width: 300,
                child: StatsCard(
                  title: entry.title,
                  image: entry.image,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void showViewDialog({required BuildContext context, required String title, required String img}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                Text(
                  "وثيقة القضية",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headlineMedium!.color,
                  ),
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
              width: 500,
              child: Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextWidget(text: title, maxLine: 10),
                  WidgetZoom(
                    heroAnimationTag: 'بطاقة',
                    zoomWidget: Image.network(img),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String image;

  StatsCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).textTheme.headlineMedium!.color!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.network(
                    image,
                    height: 60,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [CustomTextWidget(text: title, maxLine: 3, fontSize: 14)],
            ),
          ),
        ],
      ),
    );
  }
}
