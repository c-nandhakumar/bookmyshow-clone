import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ExpandedText extends StatefulWidget {
  final description;
  ExpandedText(this.description);

  @override
  State<ExpandedText> createState() => _ExpandedTextState(description);
}

class _ExpandedTextState extends State<ExpandedText> {
  final description;
  _ExpandedTextState(this.description);

  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: h * 0.015),
      child: buildText(description, h, w),
    );
  }

  buildText(description, double h, double w) {
    final style = TextStyle(
      color: Colors.red,
    );

    return ReadMoreText(
      description,
      style: TextStyle(fontSize: h * 0.015),
      trimLength: 150,
      trimMode: TrimMode.Length,
      trimCollapsedText: "...more",
      trimExpandedText: "...less",
      moreStyle: style,
      lessStyle: style,
    );
  }
}
