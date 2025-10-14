import 'package:advocateoffice/controller/ui/dashboard.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';

class StatsRowMobile extends StatelessWidget {
  StatsRowMobile({super.key, required this.controller});
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2,
      runSpacing: 2,
      children: controller.statsData.entries.map((entry) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.47, // Adjust card width
          child: StatsCard(
            title: controller.formatTitle(entry.key),
            value: entry.value ?? 'N/A',
            icon: controller.getCardIcon(entry.key),
          ),
        );
      }).toList(),
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(5),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 28,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: title,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  textOverflow: TextOverflow.ellipsis,
                  maxLine: 2,
                   fontColor: Colors.white,
                ),
                const SizedBox(height: 8),
                CustomTextWidget(
                  text: value,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
