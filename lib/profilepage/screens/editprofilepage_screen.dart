import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/editprofile_service.dart';

class UserProfileScreen extends StatefulWidget {
  final Animation<double>? transitionAnimation;
  const UserProfileScreen({this.transitionAnimation, super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    mobileNumberController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.transitionAnimation!,
      builder: (context, child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: widget.transitionAnimation!, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Edit Profile")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 10),
                      child: Text(
                        "Mobile Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      child: TextField(
                        controller: mobileNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 17),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter the Mobile Number',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 10),
                      child: Text(
                        "Email address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 17),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter the Email address',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 10),
                      child: Text(
                        "Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 17),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter your Name',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              await EditProfileService()
                  .createUser(
                      name: nameController.text,
                      email: emailController.text,
                      mobile: mobileNumberController.text)
                  .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Updated user details"))));
              nameController.clear();
              emailController.clear();
              mobileNumberController.clear();
            },
            child: Text("Save Changes"),
          ),
        )),
      ),
    );
  }
}
