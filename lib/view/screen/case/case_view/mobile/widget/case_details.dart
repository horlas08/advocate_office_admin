import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';

class CaseDetailsMobile extends StatelessWidget {
  CaseDetailsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 16),
        _buildCaseCard(context),
      ],
    );
  }

  // Reusable Header Widget
  Widget _buildHeader() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(text: "Manish Singh", fontSize: 28),
            CustomTextWidget(text: "Flutter Developer", fontSize: 16),
            CustomTextWidget(text: "Md. Khaled Ali", fontSize: 14),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.email, size: 16),
                SizedBox(width: 4),
                CustomTextWidget(text: "siddik@gmail.com"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.phone, size: 16),
                SizedBox(width: 4),
                CustomTextWidget(text: "9874563210"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 4),
                CustomTextWidget(text: "Uttara, Dhaka"),
              ],
            ),
            const SizedBox(height: 8),
            CustomTextWidget(text: "Total Fees: 50,000 ${currencySymbol}"),
            CustomTextWidget(text: "Due Fees: 40,000   ${currencySymbol}"),
          ],
        ),
      ),
    );
  }

  // Case Details Card
  Widget _buildCaseCard(context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(text: "Case Details", fontColor: Theme.of(context).textTheme.headlineMedium!.color, fontWeight: FontWeight.w600),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCaseDetailRow("Case ID : ", "2323"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Case Type : ", "Civil"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Case Status : ", "Ongoing"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Case Stage : ", "Applied"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Next Hearing Date : ", "10 Jun 2025"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Next Hearing Place : ", "Dhaka"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Case Section : ", "302"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Client Type : ", "Petitioner"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Court : ", "Dhaka"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Opposition Name : ", "John Doe"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Opposition Phone : ", "15656552"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Witness Name : ", "Siddik"),
                const SizedBox(height: 8),
                _buildCaseDetailRow("Witness Phone : ", "125452965"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Row for Case Details
  Widget _buildCaseDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(text: label),
        Expanded(
          child: CustomTextWidget(
            text: value,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
