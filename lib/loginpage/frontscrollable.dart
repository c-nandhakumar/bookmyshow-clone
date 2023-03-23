import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FrontList {
  FrontList({this.text, this.poster});
  final String? text;
  final String? poster;
}

class FrontScrollables extends StatefulWidget {
  const FrontScrollables({Key? key}) : super(key: key);

  @override
  State<FrontScrollables> createState() => _FrontScrollablesState();
}

class _FrontScrollablesState extends State<FrontScrollables> {
  List frontScrollList = [
    FrontList(
        poster: 'assets/icons/Movie-Ticket-clipart.png',
        text:
            'Enjoy faster show booking through our recommendations tailored for you'),
    FrontList(
        poster: 'assets/icons/popcorn.jpg',
        text:
            'Forgot to grab your movie snacks? No worries! you can still order them even after booking your tickets'),
    FrontList(
        poster: 'assets/icons/discountedTicket.png',
        text:
            'Now save money on your movie tickets with free discount Coupons from Restaurants and Cafes')
  ];

  // List<Widget> movieListBuilder() {
  //   return frontScrollList.map((e) => cardCreator(e, 100, 100)).toList();
  // }

  int _activeIndex = 0;
  void state(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Stack(fit: StackFit.expand, children: [
      CarouselSlider.builder(
        itemCount: frontScrollList.length,
        itemBuilder: (context, index, realIndex) =>
            cardCreator(frontScrollList[index], h, w),
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          onPageChanged: (index, reason) => state(index),
        ),
      ),
      Container(
          padding: const EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          child: buildIndicator(h, w)),
    ]);
  }

  Widget cardCreator(value, h, w) {
    return Container(
      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: SizedBox(
        width: w * 0.9,
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: Image(
                image: AssetImage(value.poster),
                height: 75,
                width: 75,
                // fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              // padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: Text(
                value.text,
                style: const TextStyle(
                    fontSize: 10,
                    color: const Color.fromRGBO(158, 158, 158, 1)),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildIndicator(double h, double w) {
    return AnimatedSmoothIndicator(
        effect: ColorTransitionEffect(
            dotHeight: h * 0.005,
            dotWidth: h * 0.005,
            spacing: 2.75,
            dotColor: Colors.grey,
            activeDotColor: Colors.black),
        activeIndex: _activeIndex,
        count: frontScrollList.length);
  }
}
