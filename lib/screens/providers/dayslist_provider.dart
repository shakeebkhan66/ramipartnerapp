

import 'package:flutter/cupertino.dart';

class DaysListProvider with ChangeNotifier {
  List<Map<String, String>> _daysList = [];

  List<Map<String, String>> get daysList => _daysList;

  void addToDaysList(Map<String, String> data) {
    _daysList.add(data);
    notifyListeners();
  }

  void removeFromDaysList(String day) {
    _daysList.removeWhere((item) => item['day'] == day);
    notifyListeners();
  }
}
