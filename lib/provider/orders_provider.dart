import 'package:flutter/material.dart';

class Orders {
  final String? imgUrl;
  final String? theatreName;
  final String? date;
  final String? movieName;
  final String? timeSlot;
  final List<String>? seats;
  Orders(
      {this.imgUrl,
      this.theatreName,
      this.date,
      this.movieName,
      this.timeSlot,
      this.seats});
}

class OrdersList with ChangeNotifier {
  List<Orders> ordersList = [];
  void addOrder(String? imgUrl, String? theatreName, String? date,
      String? movieName, String timeSlot, List<String> seats) {
    ordersList.add(Orders(
        imgUrl: imgUrl,
        theatreName: theatreName,
        date: date,
        movieName: movieName,
        timeSlot: timeSlot,
        seats: seats));

    ordersList
        .map(
          (e) => print(
              "${e.imgUrl} ,${e.date} , ${e.seats} , ${e.theatreName},${e.timeSlot},${e.movieName}"),
        )
        .toList();
  }

  void removeFromOrdersList(int index) {
    ordersList.removeAt(index);
    notifyListeners();
  }
}
