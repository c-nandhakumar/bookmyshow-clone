import 'package:flutter/material.dart';
import 'package:bookmyshow/landingpage/models/theatreseat_model.dart';

// class SeatsClass {
//   String seatId;
//   String seatNo;
//   bool isOccupied;
//   bool isSelected;
//   double? seatPrice;
//   SeatsClass(
//       {this.seatId = '-1',
//       this.seatNo = '-1',
//       this.isOccupied = false,
//       this.isSelected = false,
//       this.seatPrice});
// }

// class TheatreSeats {
//   String? theatreId;
//   List<List<SeatsClass>>? seatLayout;
//   TheatreSeats({this.theatreId, this.seatLayout});
// }

class TheatreSeatsList with ChangeNotifier {
  late List<Theatre> theatreSeatsList = createList();

  List<Theatre> createList() {
    return [
      Theatre(
        theatreId: '1',
        seatList: [
          SeatList(seat: [...seatsGenerator(0, [], 37, "A", 190.78)]),
          SeatList(seat: [
            ...seatsGenerator(
                11, [0, 1, 2, 8, 9, 25, 26, 33, 34, 35, 36], 37, "B", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(
                11, [0, 1, 2, 8, 9, 25, 26, 33, 34, 35, 36], 37, "C", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(
                11, [0, 1, 2, 8, 9, 25, 26, 33, 34, 35, 36], 37, "D", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(
                11, [0, 1, 2, 8, 9, 25, 26, 33, 34, 35, 36], 37, "E", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(
                11, [0, 1, 2, 8, 9, 25, 26, 33, 34, 35, 36], 37, "F", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(
                11, [0, 1, 2, 8, 9, 25, 26, 33, 34, 35, 36], 37, "G", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(
                11, [0, 1, 2, 8, 9, 25, 26, 33, 34, 35, 36], 37, "H", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(
                11, [0, 1, 2, 8, 9, 25, 26, 33, 34, 35, 36], 37, "I", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(
                11, [0, 1, 2, 8, 9, 25, 26, 33, 34, 35, 36], 37, "J", 190.78)
          ]),
          SeatList(seat: []),
          SeatList(seat: [
            ...seatsGenerator(11, [8, 9, 26, 35, 36], 37, "K", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(11, [8, 9, 26, 35, 36], 37, "L", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(11, [8, 9, 26, 35, 36], 37, "M", 190.78)
          ]),
          SeatList(seat: [
            ...seatsGenerator(
                11,
                [
                  for (var i = 0; i <= 9; i++) i,
                  for (var i = 26; i <= 36; i++) i
                ],
                37,
                "N",
                190.78)
          ]),
          SeatList(seat: []),
          SeatList(seat: []),
          // [SeatsClass(seatId: '-2', seatPrice: 60.12)],
          SeatList(seat: [
            ...seatsGenerator(
                11, [for (var i = 7; i <= 28; i++) i, 36], 37, "O", 60.12)
          ]),
          SeatList(seat: [
            ...seatsGenerator(11, [0, 1, 7, 27, 28, 34, 35, 36], 37, "P", 60.12)
          ])
        ],
      )
    ];
  }

  seatsGenerator(int gapCount, List<int> gapIndex, int rowCount,
      String seatAlphabet, double seatPrice) {
    int a = 0;
    var seatList = List.generate(rowCount, (index) {
      if (gapIndex.contains(index)) {
        return Seat(seatNo: seatAlphabet);
      }
      a++;
      return Seat(
          seatId: a.toString(),
          seatNo: "$seatAlphabet${a.toString()}",
          seatPrice: seatPrice);
    });
    var reversedSeatList = List.from(seatList.reversed);
    return reversedSeatList;
  }

  List<String> selectedIndex = [];

  void selectSeats(int i, int index, int theatreId, String seatNo) {
    theatreSeatsList[theatreId].seatList[i].seat[index].isSelected = true;
    selectedIndex.add(seatNo);
    notifyListeners();
  }

  void removeSeats(int i, int index, int theatreId, String seatNo) {
    theatreSeatsList[theatreId].seatList[i].seat[index].isSelected = false;
    selectedIndex.removeWhere(
      (element) => element == seatNo,
    );
    notifyListeners();
  }

  void refreshSeats() {
    theatreSeatsList = createList();
    notifyListeners();
  }

  void confirmSeats() {}
}
