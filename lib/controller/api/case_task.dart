import 'dart:developer';

import 'package:advocateoffice/data/case_task.dart';
import 'package:advocateoffice/model/case_task_model.dart';

class CaseTaskService {
  static Future<List<CaseTaskModel>> service() async {
    try {
      List<CaseTaskModel> dataList = [];
      for (var i in CaseTaskData.caseTask) {
        CaseTaskModel caseTaskModel = CaseTaskModel.fromJson(i);
        dataList.add(caseTaskModel);
      }
      return dataList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
