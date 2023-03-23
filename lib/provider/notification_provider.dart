import 'package:flutter/material.dart';

class Notification {
  String id;
  String title;
  String body;
  String imgurl;
  Notification(
      {required this.id,
      required this.title,
      required this.body,
      required this.imgurl});
}

class NotificationList with ChangeNotifier {
  List<Notification> notificationsList = [];
  void addNotificationDetails(
      {required String id,
      required String title,
      required String body,
      required String imgurl}) {
    notificationsList
        .add(Notification(id: id, title: title, body: body, imgurl: imgurl));
    notifyListeners();
  }

  void deleteNotification(String id) {
    notificationsList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
