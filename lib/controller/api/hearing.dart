import 'dart:developer';

import 'package:advocateoffice/data/hearing_data.dart';
import 'package:advocateoffice/model/hearing.dart';

class HearingService {
  static Future<List<HearingModel>> service() async {
    try {
      List<HearingModel> hearingModelList = [];
      for (var i in HearingData.data) {
        HearingModel hearingModel = HearingModel.fromJson(i);
        hearingModelList.add(hearingModel);
      }
      return hearingModelList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
