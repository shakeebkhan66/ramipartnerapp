import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../authentication/login_screen.dart';
import '../drawer.dart';
import '../model/extradetailspartnermodel_class.dart';
import '../model/schedule_model.dart';
import '../model/workingmodel_class.dart';
import '../shareedpreference/share_preference.dart';


class ApiScreen {
  var data;
  bool isLoggedIn = false;

  String baseUrl = "https://wosh-dev.herokuapp.com";

  // TODO LIST OF GET SCHEDULE MODEL CLASS
  List<GetScheduleModelClass> scheduleList = [];

  // // TODO LIST OF GET WORKING HOUR MODEL CLASS
  List<WorkingHourModelClass> workingHours = [];


  List<Map<String, String>> daysList = [];

  // TODO ADD PARTNER
  addPartner(String? loginWith, methodUID, password, email, name, photoUrl,
      offset, context) async {
    print("My loginWith $loginWith");
    print("My methodUID $methodUID");
    print("My password $password");
    print("My email $email");
    print("My name $name");
    print("photoUrl $photoUrl");
    print("of set $offset");

    MySharedPrefClass.preferences?.setString('nickName', name);
    MySharedPrefClass.preferences?.setString('email', email);

    Map<String, dynamic> addPartnerBody = {
      "loginWith": loginWith,
      "methodUID": methodUID,
      "password": password,
      "email": email,
      "name": name,
      "photoUrl": photoUrl,
      "utcTimeZoneOffset": offset,
    };

    try {
      final response = await http.post(
        Uri.parse('https://wosh-dev.herokuapp.com/api/partner/addPartner'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(addPartnerBody),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data $data");
        print("Partner Added Successfully");
        print(data["id"]);
        print(data["result"]);
        MySharedPrefClass.preferences?.setString("partnerID", data["id"]);
        Fluttertoast.showToast(
            msg: "Partner Added Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        partnerLogin(email, password, context);
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.topToBottom,
                duration: const Duration(milliseconds: 1000),
                alignment: Alignment.bottomCenter,
                child: MyDrawer()));
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: response.body,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
    }
  }

  // TODO PARTNER LOGIN API
  partnerLogin(String email, password, context) async {

    print("My Email $email");
    print("My Password $password");

    try {
      print("Hello ${MySharedPrefClass.preferences!.getString("id")}");
      final response = await http.post(
          Uri.parse(
              'https://wosh-dev.herokuapp.com/api/authorization/partner/login'),
          body: {
            "username": email,
            "password": password,
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data $data");
        print("Login Successfully");
        MySharedPrefClass.preferences!.setBool("loggedIn", true);
        MySharedPrefClass.preferences?.setString("Access_Token", data["token"]);
        Fluttertoast.showToast(
            msg: "Login Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        sendFcmToken();
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
            msg: "User with this email is already exist",
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: response.statusCode.toString(),
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

// TODO addPartnerExtraDetails
  partnerExtraDetails(String name, phoneNumber, context) async {
    print("My name $name");
    print("My phoneNumber $phoneNumber");
    print("Id is ${MySharedPrefClass.preferences?.getString("partnerID")}");

    Map<String, dynamic> addExtraDetails = {
      "id": MySharedPrefClass.preferences?.getString("partnerID"),
      "nickName": name,
      "preferredPhoneNumber": phoneNumber,
    };

    try {
      final response = await http.post(
          Uri.parse(
              'https://wosh-dev.herokuapp.com/api/partner/addPartnerExtraDetails'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(addExtraDetails));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data $data");
        print("Extra Details Added");
        Fluttertoast.showToast(
            msg: "Extra Details Added",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyDrawer()));
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: response.body,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
    }
  }


  Future<List<GetScheduleModelClass>> mySchedule() async {
    print("Id is ${MySharedPrefClass.preferences?.getString("partnerID")}");

    Map<String, dynamic> mySchedule = {
      "id": MySharedPrefClass.preferences?.getString("partnerID"),
    };

    try {
      final response = await http.post(
          Uri.parse('https://wosh-dev.herokuapp.com/api/partner/getSchedule'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(mySchedule));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data $data");
        print("MySchedule Details");
        for (var i in data) {
          scheduleList.add(GetScheduleModelClass.fromJson(i));
        }
        Fluttertoast.showToast(
            msg: "MySchedule Details",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        return scheduleList;
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: response.body,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);

        return scheduleList;
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
    }
    return scheduleList;
  }

  reservationResponse(
      String? reservationId, partnerId, response, message) async {
    print("My reservationId $reservationId");
    print("My partnerId $partnerId");
    print("My response $response");
    print("My message $message");

    Map<String, dynamic> reservationResponseBody = {
      "reservationId": reservationId,
      "partnerId": partnerId,
      "response": response,
      "message": message,
    };

    try {
      final response = await http.post(
        Uri.parse(
            'https://wosh-dev.herokuapp.com/api/partner/reservationResponse'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(reservationResponseBody),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data $data");
        Fluttertoast.showToast(
            msg: "Successfully Done",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: response.body,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);
    }
  }

  // TODO GET WORKING HOURS API
  Future<List<WorkingHourModelClass>> getWorkingHours() async {
    print("Id is ${MySharedPrefClass.preferences?.getString("partnerID")}");

    Map<String, dynamic> getWorking = {
      "id": MySharedPrefClass.preferences?.getString("partnerID"),
    };

    try {
      final response = await http.post(
          Uri.parse(
              'https://wosh-dev.herokuapp.com/api/partner/getWorkingHours'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(getWorking));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body.toString());

        List<dynamic> days = json['days'];
        workingHours = days
            .map((dayJson) => WorkingHourModelClass.fromJson(dayJson))
            .toList();

        Fluttertoast.showToast(
            msg: "Get Working Hours",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);

        return workingHours;
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: response.body,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
        return workingHours;
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);

      return workingHours;
    }
  }


  // TODO UPDATE WORKING HOURS API
  updateWorkingHours(String partnerID, List hours, context) async{


    print("Partner $partnerID");
    print("Partner2 ${hours.toString()}");

    Map<String, dynamic> updateHours = {
      "partner" : {
        "id": partnerID.toString(),
      },
      "days" : hours,
    };

    try{
      final response = await http.post(
          Uri.parse(
              'https://wosh-dev.herokuapp.com/api/partner/updateWorkingHours'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(updateHours));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("UpdateData $data");

        Fluttertoast.showToast(
            msg: "Updated Working Hours",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyDrawer()),
        );

      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: response.body,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);
      }
    }catch(e){
      print(e.toString());
    }
  }


  // TODO SEND FCM TOKEN TO SEVER API
  sendFcmToken() async {
    String? fcm = MySharedPrefClass.preferences?.getString("FCM_TOKEN");
    String? pID = MySharedPrefClass.preferences?.getString("partnerID");

    print("FCM TOKEN $fcm");

    final response = await http.post(
        Uri.parse('$baseUrl/api/partner/fcmTokenChange'),
        body: json.encode({
          "id": pID,
          "fcmToken": fcm,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      var data = response.body.toString();
      print(data);
      print("Send FCM Token Successfully");
    } else {
      print("Failed");
    }
  }
}
