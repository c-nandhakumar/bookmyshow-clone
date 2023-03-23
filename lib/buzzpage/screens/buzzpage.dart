import 'package:bookmyshow/buzzpage/models/feedlayout.dart';
import 'package:bookmyshow/buzzpage/screens/addbuzz.dart';
import 'package:bookmyshow/buzzpage/services/addbuzz_service.dart';
import 'package:bookmyshow/buzzpage/stories/stories.dart';
import 'package:flutter/material.dart';
import '../stories/feeds.dart';

class BuzzPage extends StatelessWidget {
  const BuzzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 10, 21, 46),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return AddBuzzPage(
                      transitionAnimation: animation,
                    );
                  },
                ));
              },
              icon: const Icon(Icons.add),
            )
          ],
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "BUZZ",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 175,
              ),
              Text(
                "Discover what's trending in entertainment",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 75),
              ),
            ],
          )),
      body: ListView(
        key: const PageStorageKey('page8'),
        physics: const ScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 105,
            child: const Stories(),
          ),
          StreamBuilder<List<Buzz>>(
            key: const PageStorageKey("page 9"),
            stream: AddBuzzService().readBuzz(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong : ${snapshot.error}");
              } else if (snapshot.hasData) {
                final buzz = snapshot.data!;
                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: buzz.map(buildBuzz).toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          // ListView.builder(
          //   key: const PageStorageKey('page9'),
          //   shrinkWrap: true,
          //   physics: const ScrollPhysics(),
          //   itemCount: feeds.length,
          //   scrollDirection: Axis.vertical,
          //   itemBuilder: ((context, index) => FeedGenerator(
          //         feed: feeds[index],
          //       )),
          // ),
        ],
      ),
    );
  }

  Widget buildBuzz(Buzz buzz) {
    return FeedLayout(buzz: buzz);
    // return ListTile(
    //   leading: CircleAvatar(
    //       backgroundImage: NetworkImage(
    //     buzz.coverImgUrl,
    //     //fit: BoxFit.cover,
    //   )),
    //   title: Text(buzz.title),
    //   subtitle: Text(buzz.description),
    // );
  }
}
