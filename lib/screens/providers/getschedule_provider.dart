
import 'package:flutter/material.dart';
import 'package:ramipartnerapp/screens/api/api_screen.dart';

import '../model/schedule_model.dart';

class GetScheduleProvider with ChangeNotifier {
  ApiScreen apiScreen = ApiScreen();
  bool isLoading = false;
  List<GetScheduleModelClass> _scheduleProvider = [];
  List<GetScheduleModelClass> get scheduleProvider => _scheduleProvider;

  Future<void> getAllSchedules() async {
    scheduleProvider.clear();
    isLoading = true;
    notifyListeners();

    try {
      final response = await apiScreen.mySchedule();
      _scheduleProvider = response;
    } catch (error) {
      print('Error occurred while fetching data: $error');
    }

    isLoading = false;
    notifyListeners();
  }
}