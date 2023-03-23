import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class InternetChecker extends StatefulWidget {
  const InternetChecker({Key? key}) : super(key: key);

  @override
  State<InternetChecker> createState() => _InternetCheckerState();
}

class _InternetCheckerState extends State<InternetChecker> {
  bool hasInternet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Testing")),
      body: Container(
        child: ElevatedButton(
          child: Text("Check Internet"),
          onPressed: () async {
            hasInternet = await InternetConnectionChecker().hasConnection;
            final text = hasInternet ? "Internet" : "No Internet";
            final color = hasInternet ? Colors.green : Colors.red;
            showSimpleNotification(
              background: color,
              Text('$text',
                  style:
                      TextStyle(color: Colors.white, backgroundColor: color)),
            );
          },
        ),
      ),
    );
  }
}
