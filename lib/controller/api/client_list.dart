import 'dart:developer';

import 'package:advocateoffice/data/clients.dart';
import 'package:advocateoffice/model/client_list.dart';


class ClientListService {
  static Future<List<ClientListModel>> service() async {
    try {
      Future.delayed(Duration(seconds: 1));
      List<ClientListModel> myList = [];
      for (var i in ClientData().clientDta) {
        ClientListModel clientListModel = ClientListModel.fromJson(i);
        myList.add(clientListModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
