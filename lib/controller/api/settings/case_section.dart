import 'dart:developer';

import 'package:advocateoffice/data/case_section.dart';
import 'package:advocateoffice/model/case_section.dart';

class CaseSectionService {
  static Future<List<CaseSectionModel>> caseSection() async {
    try {
      List<CaseSectionModel> caseSectionList = [];
       for (var i in CaseSectionData().caseSectionData) {
        CaseSectionModel caseSectionModel = CaseSectionModel.fromJson(i);
        caseSectionList.add(caseSectionModel);
      }
      return caseSectionList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
