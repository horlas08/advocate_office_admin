import 'dart:developer';

import 'package:advocateoffice/data/exp_mmn.dart';
import 'package:advocateoffice/model/exp_model.dart';

class ExpListService {
  static Future<List<ExpenseDataModel>> service() async {
    try {
      Future.delayed(Duration(seconds: 1));
      List<ExpenseDataModel> myList = [];
      for (var i in ExpData.expData) {
        ExpenseDataModel data = ExpenseDataModel.fromJson(i);
        myList.add(data);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
