import 'package:flutter/material.dart';
import 'constants/colors.dart';

class MyWorkingHours extends StatefulWidget {
  const MyWorkingHours({Key? key}) : super(key: key);

  @override
  State<MyWorkingHours> createState() => _MyWorkingHoursState();
}

class _MyWorkingHoursState extends State<MyWorkingHours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: singInWithFacebookButtonColor,
        appBar: AppBar(
          backgroundColor: backgroundColorLoginScreen,
          automaticallyImplyLeading: false,
          title: const Text(
            "My Working Hours",
            style: TextStyle(
                color: singInWithGoogleButtonColor,
                fontWeight: FontWeight.w600,
                fontSize: 20.0),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                minWidth: 90,
                color: singInWithFacebookButtonColor,
                child: const Text(
                  "Done",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: singInWithGoogleButtonColor),
                ),
              ),
            )
          ],
        ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
            const SizedBox(
            height: 10.0,
          ),
          Column(
            children: [
              Container(
                height: 50,
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
                  children:  [
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                         Text(
                          "Sunday",
                          style: TextStyle(
                              color: singInWithGoogleButtonColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0),
                        ),
                        Icon(Icons.check_box_outline_blank),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 170,
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
                      "Monday",
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
                      height: 4.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Start Work From",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('8:30 am',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                        const Text(
                          "Unitil",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('9:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),

                      ],
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
                      children: [
                        const Text(
                          "Break From",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('1:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                        const Text(
                          "Until",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('2:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 170,
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
                      "Tuseday",
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
                      height: 4.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Start Work From",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('8:30 am',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                        const Text(
                          "Unitil",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('9:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),

                      ],
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
                      children: [
                        const Text(
                          "Break From",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('1:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                        const Text(
                          "Until",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('2:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 170,
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
                      "Wednsday",
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
                      height: 4.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Start Work From",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('8:30 am',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                        const Text(
                          "Unitil",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('9:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),

                      ],
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
                      children: [
                        const Text(
                          "Break From",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('1:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                        const Text(
                          "Until",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('2:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 170,
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
                      "Thursday",
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
                      height: 4.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Start Work From",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('8:30 am',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                        const Text(
                          "Unitil",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('9:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),

                      ],
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
                      children: [
                        const Text(
                          "Break From",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('1:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                        const Text(
                          "Until",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('2:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 170,
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
                      "Friday",
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
                      height: 4.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Start Work From",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('8:30 am',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                        const Text(
                          "Unitil",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('9:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),

                      ],
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
                      children: [
                        const Text(
                          "Break From",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('1:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                        const Text(
                          "Until",
                          style: TextStyle(
                              color: singInWithFacebookButtonColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          // margin: const EdgeInsets.symmetric(
                          //     vertical: 3.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: singInWithFacebookButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(child: Text('2:30 pm',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        ),
        ),
      ),
    );
  }
}
