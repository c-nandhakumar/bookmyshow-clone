import 'package:bookmyshow/provider/tickets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatCount extends StatefulWidget {
  const SeatCount({Key? key}) : super(key: key);

  @override
  State<SeatCount> createState() => _SeatCountState();
}

class _SeatCountState extends State<SeatCount> {
  List<int> seatCount = List.generate(10, (index) => index);
  int selectedIndex = 0;
  int x = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final seatCount = Provider.of<TicketList>(context, listen: false);
    selectedIndex = seatCount.numberOfSeats - 1;
  }

  @override
  Widget build(BuildContext context) {
    final seatCountProvider = Provider.of<TicketList>(context);

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: seatCount.length,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                seatCountProvider.seatCounter(index + 1);
                seatCountProvider.changeSeatImage();
                // seatCountProvider.emptySeat();
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(20),
                    color: selectedIndex == index
                        ? Colors.red[500]
                        : Colors.transparent),
                child: Center(
                  child: Text(
                    "${seatCount[index] + 1}",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ));
  }
}
