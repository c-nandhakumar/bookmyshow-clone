import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  final String name;
  final String email;
  final String mobile;
  User(
      {this.id = '',
      required this.name,
      required this.email,
      required this.mobile});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'mobile': mobile,
      };
}

class EditProfileService {
  Future createUser(
      {required String name,
      required String email,
      required String mobile}) async {
    final docUser = FirebaseFirestore.instance.collection("userprofile").doc();
    final user = User(
      id: docUser.id,
      name: name,
      email: email,
      mobile: mobile,
    );

    final json = user.toJson();
    await docUser.set(json);
  }
}
