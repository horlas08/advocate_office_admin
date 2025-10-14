import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';

class ClientsViewHeaderDesktop extends StatelessWidget {
  ClientsViewHeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomTextWidget(
                        text: "Md Abdullah Al Siddik",
                        fontSize: 16,
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                      ),
                      CustomTextWidget(
                        text: "(Flutter Developer)",
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                      ),
                    ],
                  ),
                  CustomTextWidget(
                    text: "Father Name : Md. Khaled Ali",
                    fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                  ),
                  Row(
                    children: [
                      CustomTextWidget(
                        text: "01737374083",
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                      ),
                      CustomTextWidget(
                        text: " , ",
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                      ),
                      CustomTextWidget(
                        text: "01737374083",
                        fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                      ),
                    ],
                  ),
                  CustomTextWidget(
                    text: "mabdullahalsiddik@gmail.com",
                    fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                  ),
                  CustomTextWidget(
                    text: "Lalbug, Sadar, Dinajpur, Bangladesh",
                    fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: "Total Case: 10",
                    fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                  ),
                  CustomTextWidget(
                    text: "Total Fees: 50000 $currencySymbol",
                    fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                  ),
                  CustomTextWidget(
                    text: "Due Fees: 40000 $currencySymbol",
                    fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
