import 'package:bookmyshow/buzzpage/screens/buzzpage.dart';
import 'package:bookmyshow/landingpage/landingpage.dart';
import 'package:bookmyshow/profilepage/profilepage.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  final Animation<double>? transitionAnimation;
  const BottomNavigation({this.transitionAnimation, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final screens = [
    LandingPage(),
    const BuzzPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    // final animation = Provider.of<Animation<double>>(context, listen: false);
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/BookMyShowLogo-modified.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker),
            label: 'Buzz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
