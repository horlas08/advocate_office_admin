import 'dart:developer';

import 'package:advocateoffice/data/portfolio/team.dart';
import 'package:advocateoffice/model/portfile/team.dart';

class PortfolioTeamService {
  static Future<List<TeamModel>> service() async {
    try {
      Future.delayed(Duration(seconds: 1));
      List<TeamModel> myList = [];
      for (var i in TeamDataList().data) {
        TeamModel  teamModel = TeamModel.fromJson(i);
        myList.add(teamModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
