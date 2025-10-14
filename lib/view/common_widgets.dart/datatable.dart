import 'dart:ui';

import 'package:advocateoffice/view/common_widgets.dart/custom_selectable_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CommonTableWidget extends StatelessWidget {
  const CommonTableWidget({
    super.key,
    required this.dataRow,
    required this.dataColumn,
    required this.listLength,
    required this.width,
  });

  final int listLength;
  final List<DataRow> dataRow;
  final List<DataColumn> dataColumn;
  final double width;

  @override
  Widget build(BuildContext context) {
    final double tableHeight = (listLength * 60) + 70.0;
    return SizedBox(
      height: listLength != 0 ? tableHeight : MediaQuery.sizeOf(context).height/1.3,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        }),
        child: SingleChildScrollView(
           scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: width,
            child: DataTable2(
              empty: Center(child: CustomSelectableTextWidget(text: "No Data Found...!!!",fontSize: 16,)),
                showBottomBorder: true,
                headingRowColor: WidgetStateProperty.all(
                  Theme.of(context).primaryColor.withOpacity(0.3),
                ),
                headingTextStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyMedium!.color),
                dataRowHeight: 60,
                columnSpacing: 12,
                horizontalMargin: 12,
                columns: dataColumn,
                rows: dataRow),
          ),
        ),
      ),
    );
  }
}
