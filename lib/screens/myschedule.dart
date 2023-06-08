import 'dart:async';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:ramipartnerapp/screens/drawer.dart';
import 'package:ramipartnerapp/screens/providers/converttoaddress_provider.dart';
import 'package:ramipartnerapp/screens/providers/getschedule_provider.dart';
import 'package:ramipartnerapp/screens/providers/timerprovider.dart';
import 'package:ramipartnerapp/screens/shareedpreference/share_preference.dart';
import 'api/api_screen.dart';
import 'constants/colors.dart';
import 'constants/spinkit.dart';
import 'model/schedule_model.dart';

class MyScheduleScreen extends StatefulWidget {
  static const routeName = '/myScheduleScreen';
  const MyScheduleScreen({Key? key}) : super(key: key);

  @override
  State<MyScheduleScreen> createState() => _MyScheduleScreenState();
}

class _MyScheduleScreenState extends State<MyScheduleScreen> {
  // String? latestStatusText;
  // String? latestStatusColor;
  //
  // List<String> latestStatusList1 = [];
  List latestColorList = [];
  Color? containerColor;
  var schedule;

  // TODO INSTANCE OF API SCREEN
  ApiScreen apiScreen = ApiScreen();

  // TODO GETTING PARTNER ID
  String? partnerID = MySharedPrefClass.preferences?.getString("partnerID");


  // TODO
  callApi(){
    Provider.of<TimerProvider>(context, listen: false).startTimer();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetScheduleProvider>(context, listen: false)
          .getAllSchedules();
    });
  }

  // TODO GET LATEST LOG TIME
  String? getLatestLogTime(List<ReservationEvents> reservationEvents) {
    String? latestLogTime;
    DateTime? latestDateTime;

    for (final event in reservationEvents) {
      final logTime = DateTime.tryParse(event.logTime ?? '');
      if (logTime != null) {
        if (latestDateTime == null || logTime.isAfter(latestDateTime)) {
          latestDateTime = logTime;
          latestLogTime = event.logTime;
        }
      }
    }

    print("AzixBin $latestLogTime");
    return latestLogTime;
  }


  // TODO REFRESH INDICATOR
  Future<void> _handleRefresh() async{
    setState(() {
      callApi();
    });
    return await Future.delayed(const Duration(seconds: 2));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callApi();
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<TimerProvider>(context, listen: false).cancelTimer();
  }

  @override
  Widget build(BuildContext context) {
    print("PartnerID $partnerID");
    final convertToAddressProvider =
        Provider.of<ConvertLatLongToAddressProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: singInWithFacebookButtonColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Consumer<GetScheduleProvider>(
              builder: (context, value, child) {
                schedule = value.scheduleProvider;
                if (value.isLoading) {
                  return  Expanded(
                    child: Center(
                      child: Loading(),
                    ),
                  );
                }
                return Expanded(
                  child: LiquidPullToRefresh(
                    onRefresh: _handleRefresh,
                    height: 200,
                    color: backgroundColorLoginScreen,
                    backgroundColor: singInWithFacebookButtonColor,
                    animSpeedFactor: 2,
                    showChildOpacityTransition: true,
                    child: ListView.builder(
                        itemCount: schedule.length,
                        itemBuilder: (context, index) {
                          // TODO SAVE RESERVATION ID
                          String reservationID = schedule[index].reservationId.toString();

                          print("reservationID $reservationID");

                          // TODO Convert Lat Long Into Addrees
                          convertToAddressProvider.converToAddress(
                              schedule[index].latitude,
                              schedule[index].longitude);

                          // TODO Convert DateTime
                          convertToAddressProvider.formatDateRange(
                            schedule[index].arrivalTimeFrom.toString(),
                            schedule[index].arrivalTimeTo.toString(),
                          );


                          // TODO GET LATEST RESERVATION STATUS ON THE BASIS OF LOGTIME
                          List<String?> latestStatusList1 = [];
                          List<Color> latestStatusColorList = [];

                          for (int i = 0; i < schedule.length; i++) {
                            String? latestLogTime = getLatestLogTime(schedule[i].reservationEvents);
                            String? latestStatusText;
                            String? latestStatusColor;

                            if (latestLogTime != null) {
                              final latestEvent = schedule[i].reservationEvents
                                  .firstWhere((event) => event.logTime == latestLogTime);

                              latestStatusText = latestEvent.reservationStatus;
                              latestStatusColor = latestEvent.statusColor;
                              latestStatusList1.add("$latestStatusText");
                              latestStatusColorList.add(Color(int.parse('0xFF${latestStatusColor?.substring(1)}')));
                            }
                            print("Status List $latestStatusList1");
                            print("Color List $latestStatusColorList");
                          }



                          // print("Neha $latestStatusText");
                          // print("Neha1 $latestStatusColor");



                          // String cleanedHexColor =
                          // latestStatusColor1!.replaceFirst("#", "");
                          // String fullHexColor = "FF$cleanedHexColor";
                          // int colorValue = int.parse(fullHexColor, radix: 16);
                          // containerColor = Color(colorValue);
                          // print("Neha3 $containerColor");

                          return Column(
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
                                    border:
                                        Border.all(color: Colors.grey.shade400),
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
                                    Text(
                                      schedule[index].customer!.name.toString(),
                                      style: const TextStyle(
                                          color: singInWithGoogleButtonColor,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20.0),
                                    ),
                                    Divider(
                                      color: Colors.grey.withOpacity(0.2),
                                      thickness: 2.0,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Consumer<ConvertLatLongToAddressProvider>(
                                        builder:
                                            (context, addressProvider, child) {
                                      return Text(
                                        'Location: ${addressProvider.address}',
                                        style: const TextStyle(
                                            color: backgroundColorLoginScreen,
                                            fontSize: 20.0),
                                      );
                                    }),
                                    Divider(
                                      color: Colors.grey.withOpacity(0.2),
                                      thickness: 2.0,
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      convertToAddressProvider.formattedDate
                                          .toString(),
                                      style: const TextStyle(
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        latestStatusList1[index] ==
                                                "WAITING_FOR_PARTNER_CONFIRMATION"
                                            ? Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 20,
                                                        width: 20,
                                                        decoration: BoxDecoration(
                                                          color: latestStatusColorList[index],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 4.0,
                                                      ),
                                                      Text(
                                                        "Status:" +
                                                            "  " +
                                                            latestStatusList1[index]
                                                                .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                backgroundColorLoginScreen,
                                                            fontSize: 16.0),
                                                      )
                                                    ],
                                                  ),
                                                  Divider(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    thickness: 2.0,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      MaterialButton(
                                                        onPressed: () {
                                                          apiScreen
                                                              .reservationResponse(
                                                                  reservationID
                                                                      .toString(),
                                                                  partnerID
                                                                      .toString(),
                                                                  "0",
                                                                  "Confirm");
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MyDrawer()));
                                                        },
                                                        minWidth: 150,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                        color:
                                                            backgroundColorLoginScreen,
                                                        child: const Text(
                                                          "Confirm",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      MaterialButton(
                                                        onPressed: () {
                                                          apiScreen
                                                              .reservationResponse(
                                                                  reservationID
                                                                      .toString(),
                                                                  partnerID
                                                                      .toString(),
                                                                  "1",
                                                                  "Can't take it");
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MyDrawer()));
                                                        },
                                                        minWidth: 150,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                        color: Colors.redAccent,
                                                        child: const Text(
                                                          "Can't Take It",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      color: latestStatusColorList[index],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 4.0,
                                                  ),
                                                  Text(
                                                    "Status:" +
                                                        "  " +
                                                        latestStatusList1[index]
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color:
                                                            backgroundColorLoginScreen,
                                                        fontSize: 16.0),
                                                  )
                                                ],
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
