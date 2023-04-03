import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/colors.dart';

class MyScheduleScreen extends StatefulWidget {
  const MyScheduleScreen({Key? key}) : super(key: key);

  @override
  State<MyScheduleScreen> createState() => _MyScheduleScreenState();
}

class _MyScheduleScreenState extends State<MyScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: singInWithFacebookButtonColor,
      // appBar: AppBar(
      //   backgroundColor: backgroundColorLoginScreen,
      //   automaticallyImplyLeading: false,
      //   title: const Text(
      //     "My Schedule",
      //     style: TextStyle(
      //         color: singInWithGoogleButtonColor,
      //         fontWeight: FontWeight.w600,
      //         fontSize: 20.0),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
        Column(
          children: [
            Container(
              height: 240,
              width: MediaQuery.of(context).size.width,
              // padding: const EdgeInsets.symmetric(horizontal: 15.0),
              margin: const EdgeInsets.symmetric(
                  vertical: 3.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey.shade400),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(0.1, 0.1),
                      blurRadius: 5,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Alex James",
                    style: TextStyle(
                        color: singInWithGoogleButtonColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    thickness: 2.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Location: Hanasi 129 st.,Haifa",
                    style: TextStyle(
                        color: backgroundColorLoginScreen,
                        fontSize: 20.0),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    thickness: 2.0,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  const Text(
                    "29 Mar, 8:00 - 9:00 PM",
                    style: TextStyle(
                        color: backgroundColorLoginScreen,
                        fontSize: 20.0),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    thickness: 2.0,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.circle,color: Colors.yellow,),
                       Text(
                        "Status: Waiting for My Confirmation",
                        style: TextStyle(
                            color: backgroundColorLoginScreen,
                            fontSize: 20.0),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    thickness: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        minWidth: 150,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: backgroundColorLoginScreen,
                        child: const Text(
                          "Confirm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        minWidth: 150,
                        shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(10)),
                        color: Colors.redAccent,
                        child: const Text(
                          "Can't Take It",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        // padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.grey.shade400),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                offset: const Offset(0.1, 0.1),
                                blurRadius: 5,
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Alex James",
                              style: TextStyle(
                                  color: singInWithGoogleButtonColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0),
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.2),
                              thickness: 2.0,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Location: Hanasi 129 st.,Haifa",
                              style: TextStyle(
                                  color: backgroundColorLoginScreen,
                                  fontSize: 20.0),
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.2),
                              thickness: 2.0,
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            const Text(
                              "29 Mar, 8:00 - 9:00 PM",
                              style: TextStyle(
                                  color: backgroundColorLoginScreen,
                                  fontSize: 20.0),
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.2),
                              thickness: 2.0,
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.circle,color: Colors.blue,),
                                Text(
                                  "Status: Waiting for My Confirmation",
                                  style: TextStyle(
                                      color: backgroundColorLoginScreen,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
