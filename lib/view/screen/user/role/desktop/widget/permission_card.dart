import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';

class PermissionCard extends StatelessWidget {
  const PermissionCard({
    super.key,
    required this.cardTitle,
    required this.permissions,
    required this.permissionsList,
    required this.onChanged,
  });

  final String cardTitle;
  final Map<String, bool> permissions;
  final Map<String, Map<String, bool>> permissionsList;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 10,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                          text: cardTitle,
                          fontColor:
                              Theme.of(context).textTheme.headlineMedium!.color,
                          fontSize: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextWidget(
                            text: "تحديد الكل",
                            fontSize: 15,
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                              height: 30,
                              child: FittedBox(
                                  child: Checkbox(
                                      activeColor: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .color,
                                      checkColor: Theme.of(context).cardColor,
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .color!),
                                      value: true,
                                      onChanged: onChanged))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.sizeOf(context).width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: permissions.keys.map((stage) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 30,
                          child: FittedBox(
                            child: Checkbox(
                              activeColor: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .color,
                              checkColor: Theme.of(context).cardColor,
                              side: BorderSide(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .color!),
                              value: permissions[stage],
                              onChanged: onChanged,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: CustomTextWidget(
                            text: stage,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
