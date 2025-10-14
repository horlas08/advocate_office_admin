import 'dart:developer';

import 'package:advocateoffice/data/setting.dart';

class PaymentTypeService {
  static Future<List<String>> service() async {
    try {
      List<String> paymentTypeList = [];
      for (var i in SettingData().paymentType) {
        paymentTypeList.add(i);
      }
      return paymentTypeList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
