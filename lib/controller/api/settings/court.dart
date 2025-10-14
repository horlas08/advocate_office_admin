import 'dart:developer';

import 'package:advocateoffice/data/setting.dart';

class CourtService {
  static Future<List<String>> service() async {
    try {
      List<String> counterList = [];
      for (var i in SettingData().courtName) {
        counterList.add(i);
      }
      return counterList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
