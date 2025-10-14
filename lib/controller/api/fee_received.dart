import 'dart:developer';

import 'package:advocateoffice/data/Payment_list.dart';

import 'package:advocateoffice/model/payment_list.dart';

class PaymentListService {
  static Future<List<PaymentListModel>> service() async {
    try {
      Future.delayed(Duration(seconds: 1));
      List<PaymentListModel> myList = [];
      for (var i in PaymentListData.data) {
        PaymentListModel paymentListModel = PaymentListModel.fromJson(i);
        myList.add(paymentListModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
