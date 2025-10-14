import 'dart:developer';

import 'package:advocateoffice/data/extra_income.dart';
import 'package:advocateoffice/model/extra_income.dart';


class ExtraIncomeListService {
  static Future<List<ExtraIncomeModel>> service() async {
    try {
      Future.delayed(Duration(seconds: 1));
      List<ExtraIncomeModel> myList = [];
      for (var i in ExtraIncomeData().data) {
        ExtraIncomeModel extraIncomeModel = ExtraIncomeModel.fromJson(i);
        myList.add(extraIncomeModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
