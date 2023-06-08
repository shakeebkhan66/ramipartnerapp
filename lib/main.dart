import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramipartnerapp/screens/authentication/login_partner_screen.dart';
import 'package:ramipartnerapp/screens/authentication/login_screen.dart';
import 'package:ramipartnerapp/screens/drawer.dart';
import 'package:ramipartnerapp/screens/model/extradetailspartnermodel_class.dart';
import 'package:ramipartnerapp/screens/myprofile.dart';
import 'package:ramipartnerapp/screens/myschedule.dart';
import 'package:ramipartnerapp/screens/myworkinghours.dart';
import 'package:ramipartnerapp/screens/providers/converttoaddress_provider.dart';
import 'package:ramipartnerapp/screens/providers/dayslist_provider.dart';
import 'package:ramipartnerapp/screens/providers/facebooksigninprovider..dart';
import 'package:ramipartnerapp/screens/providers/fcmtoken_provider.dart';
import 'package:ramipartnerapp/screens/providers/getpartner_provider.dart';
import 'package:ramipartnerapp/screens/providers/getschedule_provider.dart';
import 'package:ramipartnerapp/screens/providers/googlesigninprovider.dart';
import 'package:ramipartnerapp/screens/providers/timerprovider.dart';
import 'package:ramipartnerapp/screens/providers/updateworkinghours_provider.dart';
import 'package:ramipartnerapp/screens/providers/workinghours_provider.dart';
import 'package:ramipartnerapp/screens/shareedpreference/share_preference.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';



@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  MySharedPrefClass.preferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    bool previouslyLoggedIn = MySharedPrefClass.preferences?.getBool("previouslyLoggedIn") ?? false;
    bool isLoggedIn = MySharedPrefClass.preferences?.getBool("loggedIn") ?? false;

    Widget homeWidget = isLoggedIn
        ? MyDrawer()
        : const LoginScreen();

    homeWidget = previouslyLoggedIn && !isLoggedIn
        ? const LoginScreen()
        : homeWidget;


    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleSignInProvider>(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider<FacebookSignInProvider>(create: (context) => FacebookSignInProvider()),
        ChangeNotifierProvider<ConvertLatLongToAddressProvider>(create: (context) => ConvertLatLongToAddressProvider()),
        ChangeNotifierProvider<GetScheduleProvider>(create: (context) => GetScheduleProvider()),
        ChangeNotifierProvider<MyWorkingHoursProvider>(create: (context) => MyWorkingHoursProvider()),
        ChangeNotifierProvider<UpdateWorkingHoursProvider>(create: (context) => UpdateWorkingHoursProvider()),
        ChangeNotifierProvider<DaysListProvider>(create: (context) => DaysListProvider()),
        ChangeNotifierProvider<FcmTokenProvider>(create: (context) => FcmTokenProvider()),
        ChangeNotifierProvider<TimerProvider>(create: (context) => TimerProvider()),
        // ChangeNotifierProvider<GetExtraDetailsProvider>(create: (context) => GetExtraDetailsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homeWidget,
        builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,

            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
        initialRoute: "/",
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          MyScheduleScreen.routeName: (context) =>  const MyScheduleScreen(),
          MyWorkingHours.routeName: (context) => const MyWorkingHours(),
          MyDrawer.routeName: (context) => MyDrawer(),
        },
      ),
    );
  }
}



