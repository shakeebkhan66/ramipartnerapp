import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ramipartnerapp/screens/model/extradetailspartnermodel_class.dart';
import 'package:ramipartnerapp/screens/shareedpreference/share_preference.dart';
import 'api/api_screen.dart';
import 'constants/colors.dart';
import 'constants/customtextfield_screen.dart';
import 'constants/spinkit.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  // TODO Form Key
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var details;

  // TODO TextEditingControllers
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  // TODO Instance of ApiScreen
  ApiScreen apiScreen = ApiScreen();
  var data;

  // Create an empty list
  List<GetExtraDetailsModel> detailsList = [];


  // Calling Profile Data
  Future<void> getPartnerExtraDetails(context) async {
    print("Id is ${MySharedPrefClass.preferences?.getString("partnerID")}");

    Map<String, dynamic> getExtraDetails = {
      "id": MySharedPrefClass.preferences?.getString("partnerID"),
    };

    try {
      final response = await http.post(
        Uri.parse('https://wosh-dev.herokuapp.com/api/partner/getPartnerExtraDetails'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(getExtraDetails),
      );

      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        print("Data $data");
        print("Get Extra Details");


        var getExtraDetailsModel = GetExtraDetailsModel.fromJson(data);

         // Add the instance to the list
        detailsList.add(getExtraDetailsModel);

        print("DetailList $detailsList");


        Fluttertoast.showToast(
          msg: "Get Extra Details",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 18,
        );
      } else {
        print("Failed");
        Fluttertoast.showToast(
          msg: response.body,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18,
        );
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 18,
      );
    }
    return data;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getPartnerExtraDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    detailsList.clear();
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: singInWithFacebookButtonColor,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: FutureBuilder(
              future: getPartnerExtraDetails(context),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Text("Loading");
                }else{
                  return ListView.builder(
                    itemCount: detailsList.length,
                    itemBuilder: (context, index) {
                      print("List ${data.length}");
                      print("List1 ${detailsList[index].nickName.toString()}");
                      nameController.text =
                          detailsList[index].nickName.toString();
                      numberController.text = detailsList[index].preferredPhoneNumber
                          .toString();
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 130.0,
                          ),
                          CustomTextFieldScreen(
                            myController: nameController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            text: "Enter your nickname",
                            labelText: "Nickname",
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          CustomTextFieldScreen(
                            myController: numberController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            text: "Enter your phone number",
                            labelText: "Phone Number",
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          detailsList[index].nickName.toString().isNotEmpty ? Container()
                              : MaterialButton(
                            splashColor: backgroundColorLoginScreen1,
                            hoverColor: backgroundColorLoginScreen,
                            minWidth: 180.0,
                            height: 40.0,
                            color: singInWithGoogleButtonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                apiScreen.partnerExtraDetails(
                                    nameController.text.toString(),
                                    numberController.text.toString(),
                                    context);
                                print("Validate");
                              } else {
                                print("Not Validate");
                              }
                            },
                            child: const Text("Submit",
                                style: TextStyle(
                                    color: singInWithFacebookButtonColor,
                                    fontSize: 20.0)),
                          ),
                          const SizedBox(
                            height: 70.0,
                          ),
                          // ExpansionTile(
                          //   title: Container(
                          //     alignment: Alignment.topLeft,
                          //     padding: const EdgeInsets.only(left: 15.0),
                          //     child: const Text(
                          //       "Profile Details",
                          //       style: TextStyle(
                          //           color: Colors.black87,
                          //           fontSize: 25,
                          //           letterSpacing: 1.4,
                          //           fontWeight: FontWeight.w700),
                          //     ),
                          //   ),
                          //   children: [
                          //     SizedBox(
                          //       height: 300.0,
                          //       child: Consumer<GetExtraDetailsProvider>(
                          //         builder: (context, value, child) {
                          //           // Access the provider properties and methods here
                          //           final details = value.extraDetailsProvider;
                          //
                          //           print("Details ${details}");
                          //
                          //           if (value.isLoading) {
                          //             return Expanded(
                          //               child: Center(
                          //                 child: Loading(),
                          //               ),
                          //             );
                          //           }
                          //           return ListView.builder(
                          //             itemCount: details.length,
                          //             itemBuilder: (context, index) {
                          //               final detail = details[index];
                          //               print("Detail $detail");
                          //               print("Nickname ${details[index].nickName.toString()}");
                          //               return ListTile(
                          //                 title: Text(
                          //                     details[index].nickName.toString() ?? ''),
                          //                 subtitle: Text(details[index]
                          //                         .preferredPhoneNumber
                          //                         .toString() ??
                          //                     ''),
                          //               );
                          //             },
                          //           );
                          //         },
                          //       ),
                          //     )
                          //   ],
                          // )
                        ],
                      );
                    },
                  );
                }
              },
            ),
          )
        ));
  }
}
