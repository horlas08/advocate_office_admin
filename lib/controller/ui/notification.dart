import 'package:advocateoffice/controller/api/notification.dart';
import 'package:advocateoffice/model/notification.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;

  getNotificationData() async {
    notificationList.value = await NotificationService.service();
  }

  @override
  void onInit() {
    getNotificationData();
    super.onInit();
  }
}
