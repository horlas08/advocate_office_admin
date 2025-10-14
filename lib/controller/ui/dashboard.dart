import 'package:advocateoffice/controller/api/case_list.dart';
import 'package:advocateoffice/controller/api/visitor_list.dart';
import 'package:advocateoffice/model/case_list.dart';
import 'package:advocateoffice/model/visitor.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxBool isLoading = true.obs;

  Map<String, dynamic> statsData = {
    'total_visitor': '125',
    'today_visitor': '5',
    'total_clients': '76',
    'today_clients': '8',
    'total_cases': '80',
    'achieved_cases': '20',
    'failed_cases': '10',
  };
  String formatTitle(String key) {
    return key.replaceAll("_", " ").split(' ').map((word) {
      return "${word[0].toUpperCase()}${word.substring(1)}";
    }).join(' ');
  }

  IconData getCardIcon(String key) {
    switch (key) {
      case 'visitor':
        return Icons.layers_outlined;

      default:
        return Icons.layers_outlined;
    }
  }

  final Map<DateTime, double> caseData = {
    DateTime(2025, 01, 1): 12,
    DateTime(2025, 01, 2): 18,
    DateTime(2025, 01, 3): 25,
    DateTime(2025, 01, 4): 32,
    DateTime(2025, 01, 5): 28,
    DateTime(2025, 01, 6): 15,
    DateTime(2025, 01, 7): 20,
    DateTime(2025, 01, 8): 27,
    DateTime(2025, 01, 9): 0,
    DateTime(2025, 01, 10): 0,
    DateTime(2025, 01, 11): 0,
    DateTime(2025, 01, 12): 0,
    DateTime(2025, 01, 13): 0,
    DateTime(2025, 01, 14): 0,
    DateTime(2025, 01, 15): 0,
    DateTime(2025, 01, 16): 0,
    DateTime(2025, 01, 17): 0,
    DateTime(2025, 01, 18): 0,
    DateTime(2025, 01, 19): 0,
    DateTime(2025, 01, 20): 0,
    DateTime(2025, 01, 21): 0,
    DateTime(2025, 01, 22): 0,
    DateTime(2025, 01, 23): 0,
    DateTime(2025, 01, 24): 0,
    DateTime(2025, 01, 25): 0,
    DateTime(2025, 01, 26): 0,
    DateTime(2025, 01, 27): 0,
    DateTime(2025, 01, 28): 0,
    DateTime(2025, 01, 29): 0,
    DateTime(2025, 01, 30): 0,
    DateTime(2025, 01, 31): 0,
  };

  final Map<DateTime, double> visitorData = {
    DateTime(2025, 01, 1):  18,
    DateTime(2025, 01, 2):  24,
    DateTime(2025, 01, 3):  6,
    DateTime(2025, 01, 4):  19,
    DateTime(2025, 01, 5):  1,
    DateTime(2025, 01, 6):  27,
    DateTime(2025, 01, 7):  7,
    DateTime(2025, 01, 8):  31,
    DateTime(2025, 01, 9):  0,
    DateTime(2025, 01, 10): 0,
    DateTime(2025, 01, 11): 0,
    DateTime(2025, 01, 12): 0,
    DateTime(2025, 01, 13): 0,
    DateTime(2025, 01, 14): 0,
    DateTime(2025, 01, 15): 0,
    DateTime(2025, 01, 16): 0,
    DateTime(2025, 01, 17): 0,
    DateTime(2025, 01, 18): 0,
    DateTime(2025, 01, 19): 0,
    DateTime(2025, 01, 20): 0,
    DateTime(2025, 01, 21): 0,
    DateTime(2025, 01, 22): 0,
    DateTime(2025, 01, 23): 0,
    DateTime(2025, 01, 24): 0,
    DateTime(2025, 01, 25): 0,
    DateTime(2025, 01, 26): 0,
    DateTime(2025, 01, 27): 0,
    DateTime(2025, 01, 28): 0,
    DateTime(2025, 01, 29): 0,
    DateTime(2025, 01, 30): 0,
    DateTime(2025, 01, 31): 0,
  };

  /// Income Line Chart
  final Map<DateTime, double> incomeData = {
    DateTime(2024, 12, 05): 10,
    DateTime(2024, 12, 15): 5,
    DateTime(2024, 12, 21): 8,
    DateTime(2024, 12, 22): 15,
    DateTime(2024, 12, 23): 15,
    DateTime(2024, 12, 24): 15,
    DateTime(2024, 12, 25): 15,
    DateTime(2024, 12, 26): 10,
    DateTime(2024, 12, 27): 0,
    DateTime(2024, 12, 28): 0,
    DateTime(2024, 12, 29): 15,
    DateTime(2024, 12, 30): 15,
    DateTime(2024, 12, 31): 0,
  };

  /// Generate all dates for a specific month and fill missing dates
  Map<DateTime, double> fillMissingDates(Map<DateTime, double> data, int year, int month) {
    /// Get total days in the specified month
    final totalDays = DateTime(year, month + 1, 0).day;

    /// Fill missing dates
    final completeData = <DateTime, double>{};
    for (int day = 1; day <= totalDays; day++) {
      final date = DateTime(year, month, day);
      completeData[date] = data[date] ?? 0.0;
    }

    return completeData;
  }

  /// Convert data to FlSpot
  List<FlSpot> getDataPoints(Map<DateTime, double> data) {
    return data.entries.map((entry) {
      final day = entry.key.day;
      final value = entry.value;

      return FlSpot(day.toDouble() - 1, value);
    }).toList();
  }

  /// Recent Cases
  var resentCaseList = <CaseListModel>[].obs;

  var filteredResentCaseList = <CaseListModel>[].obs;

  void filterCase(String query) {
    if (query.isEmpty) {
      filteredResentCaseList.value = resentCaseList;
    } else {
      filteredResentCaseList.value = resentCaseList
          .where((cases) =>
              cases.caseID.toString().toLowerCase().contains(query.toLowerCase()) ||
              cases.caseType.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  getLoading() async {
    isLoading.value = true;
    resentCaseList.value = await CaseService.service();
    if (resentCaseList.length > 10) {
      resentCaseList.removeRange(0, 9);
    }
    resentVisitorList.value = await VisitorListService.service();
    if (resentVisitorList.length > 15) {
      resentVisitorList.removeRange(0, 14);
    }
    isLoading.value = false;
  }

  void fetchCaseData() {
    filteredResentCaseList.value = resentCaseList;
  }

  /// Recent Visitors
  var resentVisitorList = <VisitorModel>[].obs;

  var filteredResentVisitorList = <VisitorModel>[].obs;

  void filterVisitor(String query) {
    if (query.isEmpty) {
      filteredResentVisitorList.value = resentVisitorList;
    } else {
      filteredResentVisitorList.value = resentVisitorList
          .where((visitor) =>
              visitor.id.toString().toLowerCase().contains(query.toLowerCase()) ||
              visitor.name.toString().toLowerCase().contains(query.toLowerCase()) ||
              visitor.phone.toString().toLowerCase().contains(query.toLowerCase()) ||
              visitor.priority.toString().toLowerCase().contains(query.toLowerCase()) ||
              visitor.fee.toString().toLowerCase().contains(query.toLowerCase()) ||
              visitor.createdBy.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getLoading();
    fetchCaseData();
  }
}
