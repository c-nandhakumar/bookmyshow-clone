import 'package:flutter/material.dart';

class TimeList {
  String? time;
  bool? isFilled;
  String? audioSystem;
  TimeList({this.time, this.isFilled, this.audioSystem});
}

class Theatre {
  String? theatreId;

  String? theatreName;
  List<TimeList>? timeList;
  bool? isCancellationAvailable = false;
  Theatre(
      {this.theatreId,
      this.theatreName,
      this.timeList,
      this.isCancellationAvailable});
}

class TheatreList with ChangeNotifier {
  List<List<Theatre>> theatreList = [
    //list1
    [
      Theatre(
        theatreId: '1',
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: false,
      ),
      Theatre(
        theatreId: '2',
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '3',
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list2
    [
      Theatre(
        theatreId: '2',
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '1',
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '3',
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list3
    [
      Theatre(
        theatreId: '4',
        theatreName: "SDC Cinemas Kalpana Theatre 4K Dolby Atmos",
        timeList: [
          TimeList(
              time: "10:45 AM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "02:30", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "06:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "10:00 PM", isFilled: true),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '5',
        theatreName: "Kovai Shanti Complex 4K 3D: Coimbatore",
        timeList: [
          TimeList(
              time: "04:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '3',
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list4
    [
      Theatre(
        theatreId: '1',
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '2',
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '3',
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list5
    [
      Theatre(
        theatreId: '5',
        theatreName: "Kovai Shanti Complex 4K 3D: Coimbatore",
        timeList: [
          TimeList(
              time: "04:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '2',
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '3',
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list6
    [
      Theatre(
        theatreId: '3',
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '3',
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '2',
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list7
    [
      Theatre(
        theatreId: '1',
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '2',
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreId: '3',
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ]
  ];
}
