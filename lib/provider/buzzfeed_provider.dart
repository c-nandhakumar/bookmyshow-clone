import 'package:flutter/material.dart';

class BuzzFeed {
  String? buzzTitle;
  String? coverImg;
  String? mainImg;
  String? authorProfile;
  String? authorName;
  DateTime? day;
  DateTime? time;
  int? likeCount;
  String? description;
}

class BuzzFeedProvider with ChangeNotifier {}
