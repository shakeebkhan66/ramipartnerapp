import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/spinkit.dart';
import '../notifications/notification_services.dart';
import '../providers/facebooksigninprovider..dart';
import '../providers/fcmtoken_provider.dart';
import '../providers/googlesigninprovider.dart';
import '../shareedpreference/share_preference.dart';
import 'authservice_screen..dart';


class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final fireStore = FirebaseFirestore.instance;
  bool isLoggedIn = false;
  Map userObj = {};

  // TODO INSTANCE OF NOTIFICATION SERVICES SCREEN
  NotificationServices notificationServices = NotificationServices();

  // TODO Get Device Token
  fcmTokenFunc(){
    notificationServices.requestNotificationPermission();

    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);

    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) {
      print("Device Token $value");
      MySharedPrefClass.preferences?.setString("FCM_TOKEN", value);
    });

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fcmTokenFunc();
  }



  @override
  Widget build(BuildContext context) {
    var googleProvider = Provider.of<GoogleSignInProvider>(context, listen: false);
    var facebookProvider = Provider.of<FacebookSignInProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColorLoginScreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 200),
              child: Image.asset("assets/images/woshpartner.png"),
            ),
            const SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () async {
                await AuthService().signInWithFacebook();
                facebookProvider.signInWithFacebook(context);
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
                decoration: BoxDecoration(
                    color: singInWithFacebookButtonColor,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 0.1),
                        blurRadius: 10.0,
                      )
                    ]),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      FontAwesomeIcons.squareFacebook,
                      color: facebookColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Sign in with Facebook",
                      style: TextStyle(color: facebookLogoColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)
                    )
                  ],
                ),
              ),
            ),
            Center(
                child: Consumer<GoogleSignInProvider>(
                  builder: (context, authProvider, child) => authProvider.isLoading
                      ?  Loading()
                      : InkWell(
                    onTap: () {
                      googleProvider.googleLogIn(context);
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      margin:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
                      decoration: BoxDecoration(
                          color: singInWithFacebookButtonColor,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0, 0.1),
                              blurRadius: 10.0,
                            )
                          ]),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            "assets/images/googlelogo.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Sign in with Google",
                            style: TextStyle(
                                color: singInWithGoogleButtonColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
