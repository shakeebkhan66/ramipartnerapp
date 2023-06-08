//
// import 'package:flutter/cupertino.dart';
// import 'package:ramipartnerapp/screens/api/api_screen.dart';
//
// import '../model/extradetailspartnermodel_class.dart';
//
// class GetExtraDetailsProvider with ChangeNotifier {
//   ApiScreen apiScreen = ApiScreen();
//   bool isLoading = false;
//   List<GetExtraDetailsModel> _extraDetailsProvider = [];
//
//   List<GetExtraDetailsModel> get extraDetailsProvider => _extraDetailsProvider;
//
//   Future<void> getExtraDetails(context) async {
//     isLoading = true;
//     notifyListeners();
//
//     try {
//       final response = await apiScreen.getPartnerExtraDetails(context);
//       if (response != null) {
//
//         print("Response $response");
//
//         _extraDetailsProvider = response;
//       } else {
//         _extraDetailsProvider = []; // Handle the case when response is null
//       }
//     } catch (error) {
//       print('Error occurred while fetching data: $error');
//       _extraDetailsProvider = []; // Handle the error case
//     }
//
//     isLoading = false;
//     notifyListeners();
//   }
// }
//
