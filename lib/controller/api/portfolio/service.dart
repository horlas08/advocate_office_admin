import 'dart:developer';

import 'package:advocateoffice/data/portfolio/service.dart';
import 'package:advocateoffice/model/portfile/service.dart';

class PortfolioServiceService {
  static Future<List<ServiceModel>> service() async {
    try {
      Future.delayed(Duration(seconds: 1));
      List<ServiceModel> myList = [];
      for (var i in ServiceDataList().data) {
        ServiceModel  serviceModel = ServiceModel.fromJson(i);
        myList.add(serviceModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
