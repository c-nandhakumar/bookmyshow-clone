// To parse this JSON data, do
//
//     final theatreSeats = theatreSeatsFromJson(jsonString);

import 'dart:convert';

// TheatreSeats theatreSeatsFromJson(String str) =>
//     TheatreSeats.fromJson(json.decode(str));

String theatreSeatsToJson(TheatreSeats data) => json.encode(data.toJson());

class TheatreSeats {
  TheatreSeats({
    this.docid = '',
    this.time = '',
    this.date = '',
    required this.theatre,
  });

  String docid;
  String time;
  String date;
  Theatre theatre;

  static TheatreSeats fromJson(Map<String, dynamic> json) => TheatreSeats(
        docid: json["docid"],
        time: json["time"],
        date: json["date"],
        theatre: Theatre.fromJson(json["theatre"]),
      );

  Map<String, dynamic> toJson() => {
        "docid": docid,
        "time": time,
        "date": date,
        "theatre": theatre.toJson(),
      };
}

class Theatre {
  Theatre({
    required this.theatreId,
    required this.seatList,
  });

  String theatreId;
  List<SeatList> seatList;

  static Theatre fromJson(Map<String, dynamic> json) => Theatre(
        theatreId: json["theatreId"],
        seatList: List<SeatList>.from(
            json["seatList"].map((x) => SeatList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "theatreId": theatreId,
        "seatList": List<dynamic>.from(seatList.map((x) => x.toJson())),
      };
}

class SeatList {
  SeatList({
    required this.seat,
  });

  List<Seat> seat;

  static SeatList fromJson(Map<String, dynamic> json) => SeatList(
        seat: List<Seat>.from(json["seat"].map((x) => Seat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "seat": List<dynamic>.from(seat.map((x) => x.toJson())),
      };
}

class Seat {
  Seat({
    this.seatId = '-1',
    this.seatNo = '-1',
    this.isOccupied = false,
    this.isSelected = false,
    this.seatPrice = 0.0,
  });

  String seatId;
  String seatNo;
  bool isOccupied;
  bool isSelected;
  double seatPrice;

  static Seat fromJson(Map<String, dynamic> json) => Seat(
        seatId: json["seatId"],
        seatNo: json["seatNo"],
        isOccupied: json["isOccupied"],
        isSelected: json["isSelected"],
        seatPrice: json["seatPrice"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "seatId": seatId,
        "seatNo": seatNo,
        "isOccupied": isOccupied,
        "isSelected": isSelected,
        "seatPrice": seatPrice,
      };
}
