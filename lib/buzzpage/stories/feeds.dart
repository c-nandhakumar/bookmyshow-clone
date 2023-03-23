import 'package:flutter/material.dart';

class FeedList {
  String? feedTitle;
  String? imageURL;
  String? profileURL;
  final time = DateTime.now();
  FeedList({this.feedTitle, this.imageURL, this.profileURL});
}

final feeds = [
  FeedList(
    feedTitle: 'Tamil Thriller \'Naane Varuven\' Is Deliciously Chilling',
    imageURL: 'assets/images/image.jpeg',
    profileURL: 'assets/icons/BookMyShowLogo.png',
  ),
  FeedList(
      feedTitle: 'Tamil Thriller \'Naane Varuven\' Is Deliciously Chilling',
      imageURL: 'assets/images/image.jpeg',
      profileURL: 'assets/icons/BookMyShowLogo.png'),
  FeedList(
      feedTitle: 'Tamil Thriller \'Naane Varuven\' Is Deliciously Chilling',
      imageURL: 'assets/images/image.jpeg',
      profileURL: 'assets/icons/BookMyShowLogo.png'),
  FeedList(
      feedTitle: 'Tamil Thriller \'Naane Varuven\' Is Deliciously Chilling',
      imageURL: 'assets/images/image.jpeg',
      profileURL: 'assets/icons/BookMyShowLogo.png'),
  FeedList(
      feedTitle: 'Tamil Thriller \'Naane Varuven\' Is Deliciously Chilling',
      imageURL: 'assets/images/image.jpeg',
      profileURL: 'assets/icons/BookMyShowLogo.png'),
  FeedList(
      feedTitle: 'Tamil Thriller \'Naane Varuven\' Is Deliciously Chilling',
      imageURL: 'assets/images/image.jpeg',
      profileURL: 'assets/icons/BookMyShowLogo.png'),
];

// ignore: must_be_immutable
class FeedGenerator extends StatefulWidget {
  FeedList? feed;
  FeedGenerator({Key? key, this.feed}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FeedGeneratorState(feed: feed);
  }
}

class FeedGeneratorState extends State<FeedGenerator> {
  bool tap = true;
  FeedList? feed;
  FeedGeneratorState({this.feed});
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height / 6,
        width: 200,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(height / 60),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    '${feed?.imageURL}',
                    height: height / 10,
                    width: width / 5,
                  ),
                ),
                SizedBox(
                  width: width / 15,
                ),
                SizedBox(
                  height: 100,
                  width: 250,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                        child: Row(
                          children: [
                            SizedBox(
                                width: width / 2,
                                child: Text(
                                  '${feed?.feedTitle}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            const Spacer(),
                            const Icon(Icons.bookmark_border_rounded)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    '${feed?.profileURL}',
                                    height: 22.5,
                                    width: 22.5,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    '2 mins ago',
                                    style: const TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        tap = !tap;
                                      });
                                    },
                                    child: tap
                                        ? const Icon(
                                            Icons.favorite_border_outlined)
                                        : const Icon(Icons.favorite,
                                            color: Colors.red),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(Icons.share_outlined),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
