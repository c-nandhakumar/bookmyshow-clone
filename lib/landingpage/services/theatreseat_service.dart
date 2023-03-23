import 'package:bookmyshow/provider/theatreseat_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/theatreseat_model.dart';

class TheatreSeatService extends ChangeNotifier {
  TheatreSeats obj = TheatreSeats(
      date: "No date", theatre: Theatre(theatreId: "-1", seatList: []));
  Future<void> createTheatreInstance(
      String date, String time, String theatreId) async {
    Theatre theatre =
        TheatreSeatsList().theatreSeatsList[int.parse(theatreId) - 1];
    final docUser = FirebaseFirestore.instance.collection("theatrelist").doc();

    obj = TheatreSeats(
        docid: docUser.id, time: time, date: date, theatre: theatre);
    print("THEATRE ID : ${obj.docid}");
    TheatreSeats objx = obj;
    final json = objx.toJson();
    //print("Json part +${json}");
    await docUser.set(json);
    notifyListeners();
    return;
  }

  Stream<List<TheatreSeats>> readTheatreInstance() {
    //String str = obj.docid;

    return FirebaseFirestore.instance.collection("theatrelist").snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => TheatreSeats.fromJson(doc.data()))
            .toList());
  }

  Future<bool> readTheatreInstances(
      String date, String time, String theatreId) async {
    final results = readTheatreInstance();
    bool x = false;
    //print("operation 1");

    Future<List<TheatreSeats>> categoryList() async {
      return await results.first;
    }

    List<TheatreSeats> seatList = await categoryList();

    //print("operation 2");
    for (int i = 0; i < seatList.length; i++) {
      for (int j = 0; j < seatList.length; j++) {
        if (seatList[j].date == date &&
            seatList[j].time == time &&
            seatList[j].theatre.theatreId == theatreId) {
          obj = seatList[j];

          x = true;
          notifyListeners();
        }
      }
    }

    return x;
  }
}
