import 'package:bookmyshow/profilepage/screens/editprofilepage_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './cardgenerator/profilecardgenerator.dart';
import '../provider/googlesignin_provider.dart';
import 'cardgenerator/profilecarddetails.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 10, 21, 46),
        title: Container(
          // height: 10,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hey!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 4,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            UserProfileScreen(transitionAnimation: animation),
                        transitionDuration: const Duration(milliseconds: 500)),
                  );
                },
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return signedInScreen(context);
            } else if (snapshot.hasError) {
              return const Center(child: Text("Oops ! Something went wrong"));
            } else {
              return const ProfileCard();
            }
          }),
    );
  }

  ListView signedInScreen(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView(
      key: const PageStorageKey('page11'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello :${FirebaseAuth.instance.currentUser!.displayName}"),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInCubit>(context, listen: false);
                  provider.signOutWithGoogle();
                  FirebaseAuth.instance.signOut();
                },
                child: const Text("Log out"),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            key: const PageStorageKey('page12'),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: card2.length,
            itemBuilder: (BuildContext context, int index) {
              return CardGenerator(card2[index]);
            }),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: cards.length,
            itemBuilder: (BuildContext context, int index) {
              return CardGenerator(cards[index]);
            }),
        Container(
          height: height * 0.20,
        )
      ],
    );
  }
}
