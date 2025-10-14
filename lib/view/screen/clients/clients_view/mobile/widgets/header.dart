import 'package:advocateoffice/controller/ui/clients/clients_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsViewHeaderMobile extends StatelessWidget {
  ClientsViewHeaderMobile({super.key});
  final ClientViewController controller = Get.put(ClientViewController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  "Md Abdullah Al Siddik",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SelectableText(
                  "Flutter Developer",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                SelectableText(
                  "Father Name : Md. Khaled Ali",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                Row(
                  children: [
                    SelectableText(
                      "01737374083",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    SelectableText(
                      " , ",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    SelectableText(
                      "01737374083",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SelectableText(
                  "mabdullahalsiddik@gmail.com",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                SelectableText(
                  "Lalbug, Sadar, Dinajpur, Bangladesh",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText("Total Case: ${controller.caseList.length}"),
                const SelectableText("Total Fees: 50000 TK"),
                const SelectableText("Due Fees: 40000 TK"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
