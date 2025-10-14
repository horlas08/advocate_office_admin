
import 'dart:developer';
import 'package:advocateoffice/data/visitor.dart';
import 'package:advocateoffice/model/visitor.dart';

class VisitorListService {
  static Future<List<VisitorModel>> service() async {
    try {
      Future.delayed(Duration(seconds: 1));
      List<VisitorModel> myList = [];
      for (var i in VisitorData.visitorData) {
        VisitorModel caseTaskModel = VisitorModel.fromJson(i);
        myList.add(caseTaskModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
