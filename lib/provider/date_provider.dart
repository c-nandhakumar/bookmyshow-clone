import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatesProvider with ChangeNotifier {
  List<Map<String, Object>> dateList = List.generate(7, (index) {
    final weekDay = DateTime.now().add(Duration(days: index));
    return ({
      'id': index,
      'date': DateFormat.d().format(weekDay),
      'month': DateFormat('MMM').format(weekDay),
      'day': DateFormat.E().format(weekDay).substring(0, 3),
      'isDateSelected': index == 0 ? true : false
    });
  });

  void changeDate() {}
}
