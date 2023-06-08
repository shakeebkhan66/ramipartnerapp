import 'package:flutter/material.dart';
import 'package:ramipartnerapp/screens/api/api_screen.dart';
import '../model/schedule_model.dart';

class FcmTokenProvider with ChangeNotifier {

  ApiScreen apiScreen = ApiScreen();


    myFcmToken() async{
    final response = await apiScreen.sendFcmToken();
    print("Response is ${response.toString()}");
    notifyListeners();
  }
}