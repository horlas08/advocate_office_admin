import 'package:advocateoffice/controller/ui/dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VisitorLineChartDesktop extends StatelessWidget {
  VisitorLineChartDesktop({super.key, required this.controller});
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentYear = now.year;
    final currentMonth = now.month;

    final completeData = controller.fillMissingDates(
        controller.visitorData, currentYear, currentMonth);
    final dataPoints = controller.getDataPoints(completeData);

    final currentMonthDays = List<DateTime>.generate(
      DateTime(currentYear, currentMonth + 1, 0).day,
      (index) => DateTime(currentYear, currentMonth, index + 1),
    );

    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 5, right: 15, bottom: 50, top: 5),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (currentMonthDays.length - 1).toDouble(),
          minY: 0,
          maxY: 40,
          gridData: const FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 10,
            verticalInterval: 3,
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              axisNameSize: 60,
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1, // Adjust for readability
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index >= 0 && index < currentMonthDays.length) {
                    final date = currentMonthDays[index];
                    return Transform.rotate(
                      alignment: Alignment.bottomRight,
                      angle: -0.8,
                      child: Text(
                        DateFormat('MMM d').format(date), // Example: "Dec 1"
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            leftTitles: AxisTitles(
              axisNameSize: 40,
              axisNameWidget: Text(
                'الجلسات',
                style: TextStyle(
                  color: Theme.of(context).textTheme.headlineMedium!.color,
                  fontSize: 20,
                ),
              ),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 10,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${value.toInt()}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
            rightTitles: const AxisTitles(
              axisNameSize: 10,
            ),
            topTitles: AxisTitles(
              axisNameSize: 40,
              axisNameWidget: Text(
                'بيانات اجمالي الجلسات ${DateFormat('MMMM').format(now)}',
                style: TextStyle(
                  color: Theme.of(context).textTheme.headlineMedium!.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              preventCurveOverShooting: true,
              spots: dataPoints,
              isCurved: true,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).textTheme.headlineMedium!.color!,
                  Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .color!
                      .withOpacity(.2)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              barWidth: 4,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .color!
                        .withOpacity(.1),
                    Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .color!
                        .withOpacity(.3),
                    Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .color!
                        .withOpacity(.5)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 6,
                    color: Theme.of(context).textTheme.headlineMedium!.color!,
                    strokeWidth: 2,
                    strokeColor:
                        Theme.of(context).textTheme.headlineMedium!.color!,
                  );
                },
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipRoundedRadius: 8,
              getTooltipColor: (float) {
                return Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .color!
                    .withOpacity(.3);
              },
              getTooltipItems: (spots) {
                return spots.map((spot) {
                  final date = currentMonthDays[spot.x.toInt()];
                  return LineTooltipItem(
                    "${DateFormat('MMM d').format(date)}\n${spot.y.toInt()}",
                    const TextStyle(
                      fontSize: 12,
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }
}
