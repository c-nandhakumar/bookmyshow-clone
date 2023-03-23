import 'package:cloud_firestore/cloud_firestore.dart';

class Buzz {
  String id;
  final String title;
  final String description;
  final String authorname;
  final DateTime datetime;
  final String mainImgUrl;
  final String coverImgUrl;

  Buzz({
    this.id = '',
    required this.title,
    required this.description,
    required this.authorname,
    required this.datetime,
    required this.mainImgUrl,
    required this.coverImgUrl,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'datetime': datetime.toIso8601String(),
        'authorname': authorname,
        'mainImgUrl': mainImgUrl,
        'coverImgUrl': coverImgUrl,
      };

  static Buzz fromJson(Map<String, dynamic> json) => Buzz(
        id: json['id'],
        title: json['title'],
        authorname: json['authorname'],
        description: json['description'],
        coverImgUrl: json['coverImgUrl'],
        mainImgUrl: json['mainImgUrl'],
        datetime: DateTime.parse(json['datetime']),
      );
}

class AddBuzzService {
  Future createUser({
    required String authorname,
    required String title,
    required String description,
    required String mainImgUrl,
    required String coverImgUrl,
    required DateTime datetime,
  }) async {
    final docUser = FirebaseFirestore.instance.collection("buzzdetails").doc();
    final buzz = Buzz(
        id: docUser.id,
        authorname: authorname,
        title: title,
        description: description,
        datetime: datetime,
        mainImgUrl: mainImgUrl,
        coverImgUrl: coverImgUrl);

    final json = buzz.toJson();
    await docUser.set(json);
  }

  Stream<List<Buzz>> readBuzz() => FirebaseFirestore.instance
      .collection('buzzdetails')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Buzz.fromJson(doc.data())).toList());
}
