import 'package:flutter/cupertino.dart';
import '../api/api_screen.dart';
import '../model/workingmodel_class.dart';


class MyWorkingHoursProvider with ChangeNotifier{

  bool isLoading = false;
  ApiScreen apiScreen = ApiScreen();

  List<WorkingHourModelClass> _workingHoursProvider = [];
  List<WorkingHourModelClass> get workingHoursProvider => _workingHoursProvider;


  Future<void> getAllWorkingHours() async{
    isLoading = true;
    notifyListeners();

    try{
      final response = await apiScreen.getWorkingHours();
      debugPrint(response.toString());
      _workingHoursProvider = response;
    }catch(error){
      print('Error occurred while fetching data: $error');
    }

    isLoading = false;
    notifyListeners();
  }


}