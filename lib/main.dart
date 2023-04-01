import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramipartnerapp/screens/authentication/login_screen.dart';
import 'package:ramipartnerapp/screens/drawer.dart';
import 'package:ramipartnerapp/screens/myprofile.dart';
import 'package:ramipartnerapp/screens/myschedule.dart';
import 'package:ramipartnerapp/screens/myworkinghours.dart';
import 'package:ramipartnerapp/screens/providers/facebooksigninprovider..dart';
import 'package:ramipartnerapp/screens/providers/googlesigninprovider.dart';
import 'package:responsive_framework/responsive_framework.dart';



void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleSignInProvider>(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider<FacebookSignInProvider>(create: (context) => FacebookSignInProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  MyWorkingHours(),
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
      ),
    );
  }
}
