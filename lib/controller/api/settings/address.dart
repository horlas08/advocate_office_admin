import 'dart:developer';
import 'package:advocateoffice/data/address.dart';
import 'package:advocateoffice/model/address/district.dart';
import 'package:advocateoffice/model/address/division.dart';
import 'package:advocateoffice/model/address/thana.dart';

class AddressService {
  static Future<List<DivisionModel>> divService() async {
    try {
      List<DivisionModel> myList = [];
      for (var i in AddressData.divList) {
        DivisionModel caseTaskModel = DivisionModel.fromJson(i);
        myList.add(caseTaskModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }

  static Future<List<DistrictModel>> disService() async {
    try {
      List<DistrictModel> myList = [];
      for (var i in AddressData.disList) {
        DistrictModel caseTaskModel = DistrictModel.fromJson(i);
        myList.add(caseTaskModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }

  static Future<List<ThanaModel>> thanaService() async {
    try {
      List<ThanaModel> myList = [];
      for (var i in AddressData.divList) {
        ThanaModel caseTaskModel = ThanaModel.fromJson(i);
        myList.add(caseTaskModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
