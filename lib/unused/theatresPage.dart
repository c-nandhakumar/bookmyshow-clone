import 'package:bookmyshow/landingpage/cardgeneration/carouselbuilder.dart';
import 'package:bookmyshow/unused/theatreList.dart';
import 'package:bookmyshow/provider/date_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TheatresPage extends StatefulWidget {
  static const routeName = "/theatre-list-page";
  final String? movieName;
  int? index;
  String? imgUrl;
  final Animation<double>? transitionAnimation;
  // ignore: use_key_in_widget_constructors
  TheatresPage(
      {this.transitionAnimation, this.imgUrl, this.index, this.movieName});

  @override
  State<TheatresPage> createState() => _TheatresPageState();
}

class _TheatresPageState extends State<TheatresPage> {
  int? isDateSelected = 0;
  String? date;

  int? dateindex = 0;
  @override
  void initState() {
    super.initState();
    isDateSelected = widget.index;
    dateindex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    //final animation2 = Provider.of<Animation<double>>(context, listen: false);
    final dateAndMonthList = Provider.of<DatesProvider>(context);

    Map<String, Object> dateAndDay = dateAndMonthList.dateList[dateindex!];
    date =
        "${dateAndDay['day']}, ${dateAndDay['date']}  ${dateAndDay['month']}";
    List dateWidgets = dateAndMonthList.dateList.map(
      (data) {
        int index = dateAndMonthList.dateList.indexOf(data);

        return dateAndTimeCardGenerator(
            data, h, w, data['isDateSelected'] as bool, index);
      },
    ).toList();
    print(date);

    return AnimatedBuilder(
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1, 0),
            end: Offset(0, 0),
          ).animate(
            CurvedAnimation(
                parent: widget.transitionAnimation!, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      animation: widget.transitionAnimation!,
      child: Scaffold(
        appBar: AppBar(
            //actions: [],
            leading: IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            backgroundColor: const Color.fromARGB(255, 10, 21, 46),
            title: Text(
              widget.movieName.toString(),
              style: TextStyle(fontSize: w * 0.04),
            )),
        body: Column(children: [
          Container(
            color: Colors.white,
            child: SizedBox(
              height: h * 0.01,
            ),
          ),
          Container(
            color: Colors.white,
            height: h * 0.10,
            child: ListView.builder(
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dateWidgets.length,
              itemBuilder: (context, index) => (Container(
                  color: isDateSelected != null && isDateSelected == index
                      ? Colors.red[700]
                      : Colors.white,
                  height: h * 0.1,
                  width: w * 0.14,
                  child: InkWell(
                      onTap: () {
                        print(index);

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => TheatresPage(
                            transitionAnimation: widget.transitionAnimation,
                            imgUrl: widget.imgUrl,
                            index: index,
                            movieName: widget.movieName,
                          ),
                        ));
                        //return onSelected(index);
                      },
                      child: dateWidgets[index]))),
            ),
          ),
          SizedBox(
            height: h * 0.003,
          ),
          Container(
            height: h * 0.057,
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(left: w * 0.03),
            child: Row(
              children: [
                Text(
                  "English",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: w * 0.03),
                ),
                SizedBox(width: w * 0.02),
                Icon(
                  Icons.circle,
                  size: w * 0.01,
                ),
                const Divider(),
                Text(
                  "2D",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: w * 0.03),
                ),
              ],
            ),
          ),
          Flexible(
              child: TheatreLists(
            imgUrl: widget.imgUrl,
            date: date,
            movieName: widget.movieName,
          )),
        ]),
        backgroundColor: Colors.grey[350],
      ),
    );
  }

  dateAndTimeCardGenerator(
      Map<String, Object> e, double h, double w, bool isSelected, int index) {
    return Padding(
      padding: EdgeInsets.all(w * 0.02),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(e['day'].toString().toUpperCase()),
        Text(
          e['date'].toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(e['month'].toString().toUpperCase())
      ]),
    );
  }
}
