class NotificationModel {
  final String senderImg;
  final String senderName;
  final String dateTime;
  final String message;

  NotificationModel({
    required this.senderImg,
    required this.senderName,
    required this.dateTime,
    required this.message,
  });

  // Factory method to create an instance from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      senderImg: json['sender_img'],
      senderName: json['sender_name'],
      dateTime: json['date_time'],
      message: json['message'],
    );
  }
}
