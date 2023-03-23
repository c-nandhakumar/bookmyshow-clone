import 'package:bookmyshow/landingpage/models/theatreseat_model.dart';
import 'package:bookmyshow/landingpage/services/theatreseat_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  TheatreSeats obj;
  TestPage(this.obj);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: Text("TIME : ${widget.obj.time}")

        //   itemCount: data.length,
        //   itemBuilder: (context, index) {
        //     Text(data[index].toString());
        //   },
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        // );

        );
  }
}
