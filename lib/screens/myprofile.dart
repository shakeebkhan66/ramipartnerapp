import 'package:flutter/material.dart';
import 'constants/colors.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: singInWithFacebookButtonColor,
      appBar: AppBar(
        backgroundColor: backgroundColorLoginScreen,
        automaticallyImplyLeading: false,
        title: const Text(
          "My Profile",
          style: TextStyle(
              color: singInWithGoogleButtonColor,
              fontWeight: FontWeight.w600,
              fontSize: 20.0),
        ),
      ),

      body: SafeArea(child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 25),
            child: const Text(
              "My Name",
              style: TextStyle(
                  color: singInWithGoogleButtonColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 7.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Rami",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: backgroundColorLoginScreen),
                    borderRadius: BorderRadius.circular(8.0),
                  )
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 25),
            child: const Text(
              "Phone",
              style: TextStyle(
                  color: singInWithGoogleButtonColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 7.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "+972 4-6282082",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: backgroundColorLoginScreen),
                    borderRadius: BorderRadius.circular(8.0),
                  )
              ),
            ),
          ),
          const SizedBox(height: 450),
          MaterialButton(
            onPressed: () {
            },
            height: 60,
            minWidth: 400,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: backgroundColorLoginScreen,
            child: const Text(
              "Submit",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
