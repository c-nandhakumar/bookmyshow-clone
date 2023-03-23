import 'package:flutter/material.dart';
import 'package:book_my_seat/book_my_seat.dart';
import 'package:provider/provider.dart';

import '../provider/orders_provider.dart';
import '../provider/tickets_provider.dart';

class SeatsScreenFlutter extends StatefulWidget {
  const SeatsScreenFlutter({Key? key}) : super(key: key);

  @override
  State<SeatsScreenFlutter> createState() => _SeatsScreenFlutterState();
}

class _SeatsScreenFlutterState extends State<SeatsScreenFlutter> {
  @override
  Widget build(BuildContext context) {
    final ticket = Provider.of<TicketList>(context);
    final orders = Provider.of<OrdersList>(context);
    return Scaffold(
      appBar: AppBar(),
      body: InteractiveViewer(
        maxScale: 5,
        minScale: 0.8,
        boundaryMargin: const EdgeInsets.all(8),
        constrained: true,
        //child: Flexible(
        child: Column(
          //shrinkWrap: true,
          //scrollDirection: Axis.vertical,
          children: [
            ...List.generate(
              20,
              (index) => Flexible(
                child: Row(
                  //   shrinkWrap: true,
                  // physics: ScrollPhysics(),
                  //scrollDirection: Axis.horizontal,
                  // physics: const ClampingScrollPhysics(),
                  children: List.generate(
                    20,
                    (i) => index == 5 || index == 8
                        ? Container(
                            height: 100,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 25,
                                ),
                                seatsGenerator(ticket, index, i),
                              ].toList(),
                            ),
                          )
                        : seatsGenerator(ticket, index, i),
                  ),
                ),
              ),
            ),
          ].toList(),
          // ),
        ),
      ),
    );
  }

  Widget seatsGenerator(TicketList ticket, int index, int i) {
    return i == 0
        ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 20,
              width: 20,
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              String seatID = "${String.fromCharCode(65 + index)}$i";
              if (ticket.selectedSeats[index][i][seatID] == false &&
                  ticket.numberOfSeats > ticket.seatsFilled) {
                //adding seat id
                ticket.addSeats(seatID);
                //for changing color
                ticket.selectedSeats[index][i][seatID] = true;
                //adding seat count
                ticket.fillSeat();
              } else if (ticket.numberOfSeats > ticket.seatsFilled) {
                print(ticket.selectedSeats[index][i][seatID]);
                //for removing the color
                ticket.selectedSeats[index][i][seatID] = false;
                //for removing the seats in the list
                ticket.removeSeats(seatID);
                //subtracting the seat count
                ticket.removeSeat();
              } else if (ticket.numberOfSeats == ticket.seatsFilled) {
                //changing the  seats once it is filled
                ticket.refreshSeats();
                ticket.addSeats(seatID);
                ticket.fillSeat();
                ticket.selectedSeats[index][i][seatID] = true;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Seats filled !"),
                ));
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: ticket.selectedSeats[index][i]
                              ["${String.fromCharCode(65 + index)}$i"] ==
                          true
                      ? Colors.green[500]
                      : Colors.grey[400],
                ),
                height: 20,
                width: 20,
                child: Center(
                  child: Text(
                    i.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
          );
  }
}
