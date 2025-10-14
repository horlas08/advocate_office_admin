import 'dart:developer';

import 'package:advocateoffice/data/case_list.dart';
import 'package:advocateoffice/model/case_list.dart';

class CaseService {
  static Future<List<CaseListModel>> service() async {
    try {
      Future.delayed(Duration(seconds: 1));
      List<CaseListModel> myList = [];
      for (var i in CaseDataList().caseList) {
        CaseListModel caseTaskModel = CaseListModel.fromJson(i);
        myList.add(caseTaskModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
