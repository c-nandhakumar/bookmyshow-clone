import 'package:flutter/material.dart';

class Tickets {
  final String? theatreName;
  final String? movieName;

  String? time = " ";
  List<String> seat;

  Tickets({this.theatreName, this.movieName, this.time, required this.seat});
}

class TicketList with ChangeNotifier {
  List<String> vehicleImages = [
    "assets/seats/cycle.png",
    "assets/seats/scooter.png",
    "assets/seats/auto.png",
    "assets/seats/minicar.png",
    "assets/seats/car1.png",
    "assets/seats/car1.png",
    "assets/seats/car2.png",
    "assets/seats/caravan.png",
    "assets/seats/bus.png",
    "assets/seats/bus.png"
  ];

  int numberOfSeats = 1;
  int tempSeats = 1;
  int seatsFilled = 0;
  List<String> seats = [];

  late Image img = Image(image: AssetImage(vehicleImages[0]));
  List<List<Map<String, bool>>> selectedSeats = List.generate(
      22,
      (index) => List.generate(
            22,
            (i) => {"${String.fromCharCode(65 + index)}$i": false},
          ));

  void seatCounter(int n) {
    tempSeats = n;
    // print(tempSeats);
    notifyListeners();
  }

  void selectSeats() {
    numberOfSeats = tempSeats;
    img = Image(
      image: AssetImage(vehicleImages[numberOfSeats - 1]),
    );
    print("final : $numberOfSeats");
    notifyListeners();
  }

  void defaultImg() {
    img = Image(
      image: AssetImage(vehicleImages[numberOfSeats - 1]),
    );
    notifyListeners();
  }

  void reset() {
    numberOfSeats = 1;
    tempSeats = 1;
    img = Image(image: AssetImage(vehicleImages[0]));
    notifyListeners();
  }

  void changeSeatImage() {
    img = Image(
      image: AssetImage(vehicleImages[tempSeats - 1]),
    );
    print(tempSeats);
    print("number : ${numberOfSeats}");
    notifyListeners();
  }

  void fillSeat() {
    if (seatsFilled < 10 && seatsFilled <= numberOfSeats) {
      seatsFilled++;
    }
    print("seatsFilled : $seatsFilled");
    notifyListeners();
  }

  void removeSeat() {
    if (seatsFilled != 0 && seatsFilled <= numberOfSeats) {
      seatsFilled--;
    }
    print("seatsRemoved : $seatsFilled");
    notifyListeners();
  }

  void emptySeat() {
    seatsFilled = 0;
    selectedSeats = List.generate(
        22,
        (index) => List.generate(
              22,
              (i) => {"${String.fromCharCode(65 + index)}$i": false},
            ));
    seats = [];
    notifyListeners();
  }

  void refreshSeats() {
    seatsFilled = 0;
    selectedSeats = List.generate(
        22,
        (index) => List.generate(
              22,
              (i) => {"${String.fromCharCode(65 + index)}$i": false},
            ));
    seats = [];
    notifyListeners();
  }

  void addSeats(String seat) {
    //print(selectedSeats);
    seats.add(seat);
    print("add seats ${seats}");
    notifyListeners();
  }

  void removeSeats(String seat) {
    //print(selectedSeats);
    seats.removeWhere((element) => element == seat);
    print("rmv seats ${seats}");
    notifyListeners();

    void confirmSeats() {}
  }
}
