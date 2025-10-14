import 'dart:developer';

import 'package:advocateoffice/data/notification.dart';
import 'package:advocateoffice/model/notification.dart';

class NotificationService {
  static Future<List<NotificationModel>> service() async {
    try {
      List<NotificationModel> dataList = [];
      for (var i in NotificationData.notifications) {
        NotificationModel notificationModel = NotificationModel.fromJson(i);
        dataList.add(notificationModel);
      }
      return dataList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
