import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ramipartnerapp/screens/api/api_screen.dart';

class UpdateWorkingHoursProvider with ChangeNotifier{


  // TODO INSTANCE OF API SCREEN
  ApiScreen apiScreen = ApiScreen();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }



   postUpdateWorkingHours(String? partnerID, List hours, context) async{
    setLoading(true);
     final response = await apiScreen.updateWorkingHours(partnerID.toString(), hours, context);
     print(response.toString());
     setLoading(false);
  }
}