import 'package:advocateoffice/controller/ui/expense.dart';
import 'package:advocateoffice/model/exp_model.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';

class ExpenseViewMobile extends StatelessWidget {
  ExpenseViewMobile({super.key, required this.controller, required this.data});
  final ExpenseController controller;
  final ExpenseDataModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(text: "عرض النفقة", fontColor: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).focusColor,
          padding: const EdgeInsets.all(12),
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                      text: "الغرض أو معرف القضية",
                      fontColor:
                          Theme.of(context).textTheme.headlineMedium!.color!),
                  CustomTextWidget(
                    text: data.purpose.toString(),
                    fontWeight: FontWeight.bold,
                    fontColor: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .color!
                        .withAlpha(120),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "المبلغ",
                    fontColor:
                        Theme.of(context).textTheme.headlineMedium!.color!,
                  ),
                  CustomTextWidget(
                    text: data.amount.toString(),
                    fontWeight: FontWeight.bold,
                    fontColor: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .color!
                        .withAlpha(120),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "Created At",
                    fontColor:
                        Theme.of(context).textTheme.headlineMedium!.color!,
                  ),
                  CustomTextWidget(
                    text: data.createdAt.toString(),
                    fontWeight: FontWeight.bold,
                    fontColor: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .color!
                        .withAlpha(120),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "Created BY",
                    fontColor:
                        Theme.of(context).textTheme.headlineMedium!.color!,
                  ),
                  CustomTextWidget(
                    text: data.createdBy.toString(),
                    fontWeight: FontWeight.bold,
                    fontColor: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .color!
                        .withAlpha(120),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "Status",
                    fontColor:
                        Theme.of(context).textTheme.headlineMedium!.color!,
                  ),
                  CustomTextWidget(
                    text: data.status.toString(),
                    fontWeight: FontWeight.bold,
                    fontColor: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .color!
                        .withAlpha(120),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "ملاحظات",
                      fontColor:
                          Theme.of(context).textTheme.headlineMedium!.color!,
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .color!
                              .withAlpha(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomTextWidget(
                          maxLine: 20,
                          text: data.remark.toString(),
                          fontWeight: FontWeight.bold,
                          fontColor: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .color!
                              .withAlpha(120),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              data.voucherImg == null
                  ? SizedBox()
                  : Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: "الإيصال",
                            fontColor: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .color!,
                          ),
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.network(
                              data.voucherImg.toString(),
                            ),
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
