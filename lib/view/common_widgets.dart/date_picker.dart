import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SfDatePickerWidget extends StatelessWidget {
  final Rxn<DateTime> selectedDate;
  final String? title;
  final DateTime? maxDate;
  final Function(DateRangePickerSelectionChangedArgs) onSelectionChanged;

  SfDatePickerWidget(
      {super.key,
      required this.selectedDate,
      this.title,
      this.maxDate,
      required this.onSelectionChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 300,
              width: 300,
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.single,
                todayHighlightColor: Theme.of(context).primaryColor,
                selectionColor: Theme.of(context).primaryColor,
                initialSelectedDate: selectedDate.value,
                initialDisplayDate: selectedDate.value,
                maxDate: maxDate ?? DateTime.now(),
                showNavigationArrow: true,
                toggleDaySelection: true,
                showTodayButton: true,
                onSelectionChanged: onSelectionChanged,
              ),
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: title ?? '',
            fontColor: Theme.of(context).textTheme.headlineMedium!.color,
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .color!
                    .withOpacity(.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 20,
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .color!
                        .withOpacity(.5),
                  ),
                  const SizedBox(width: 8),
                  Obx(() {
                    return selectedDate.value != null
                        ? CustomTextWidget(
                            text: DateFormat("d MMM yyyy")
                                .format(selectedDate.value!),
                            fontColor: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .color,
                          )
                        : CustomTextWidget(
                            text: "Select Date",
                          );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
