import 'package:advocateoffice/utils/global_value.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';

class CaseDetailsDesktop extends StatelessWidget {
  CaseDetailsDesktop({super.key});

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
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(text: "مانيش سينغ", fontSize: 28),
              CustomTextWidget(text: "مطور فلاتر", fontSize: 16),
              CustomTextWidget(text: "محمد خالد علي", fontSize: 14),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.email, size: 16),
                  SizedBox(width: 4),
                  CustomTextWidget(text: "siddik@gmail.com"),
                  SizedBox(width: 12),
                  Icon(Icons.phone, size: 16),
                  SizedBox(width: 4),
                  CustomTextWidget(text: "9874563210"),
                  SizedBox(width: 12),
                  Icon(Icons.location_on, size: 16),
                  SizedBox(width: 4),
                  CustomTextWidget(text: "أوتارا، دكا"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextWidget(text: "إجمالي الاتعاب: 50,000 ${currencySymbol}"),
                CustomTextWidget(text: "الاتعاب المستحقة: 40,000 ${currencySymbol}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Case Details Card
  Widget _buildCaseCard(context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
                text: "تفاصيل الدعوى",
                fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCaseDetailRow("معرّف الدعوى : ", "2323"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("نوع الدعوى : ", "مدني"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("قسم الدعوى : ", "302"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("حالة الدعوى : ", "جارية"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("مرحلة الدعوى : ", "مقدمة"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("تاريخ الجلسة القادمة : ", "10 يونيو 2025"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("مكان الجلسة القادمة : ", "دكا"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 200,
                    child: VerticalDivider(
                      thickness: 2.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCaseDetailRow("نوع العميل : ", "المدعي"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("المحكمة : ", "دكا"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("اسم الخصم : ", "مامون إسلام ميم جون دو"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("هاتف الخصم : ", "15656552"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("اسم الشاهد : ", "سيديك"),
                      const SizedBox(height: 8),
                      _buildCaseDetailRow("هاتف الشاهد : ", "125452965"),
                    ],
                  ),
                ),
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
            )),
      ],
    );
  }
}
