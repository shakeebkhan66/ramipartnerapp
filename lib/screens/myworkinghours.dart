// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ramipartnerapp/screens/providers/dayslist_provider.dart';
// import 'package:ramipartnerapp/screens/providers/updateworkinghours_provider.dart';
// import 'package:ramipartnerapp/screens/providers/workinghours_provider.dart';
// import 'package:ramipartnerapp/screens/shareedpreference/share_preference.dart';
// import 'api/api_screen.dart';
// import 'constants/colors.dart';
// import 'package:http/http.dart' as http;
//
// import 'model/workingmodel_class.dart';
//
// class MyWorkingHours extends StatefulWidget {
//   static const routeName = '/myWorkingHoursScreen';
//   const MyWorkingHours({Key? key}) : super(key: key);
//
//   @override
//   State<MyWorkingHours> createState() => _MyWorkingHoursState();
// }
//
// class _MyWorkingHoursState extends State<MyWorkingHours> {
//
//   // TODO INSTANCE OF API SCREEN
//   ApiScreen apiScreen = ApiScreen();
//
//
//   List<WorkingHourModelClass> selectedWorkingHours = [];
//   // List<Map<String, String>> daysList = [];
//
//
//
//   void updateDaysList(WorkingHourModelClass workingHour) {
//     if (workingHour.isChecked ?? false) {
//       final data = {
//         'day': workingHour.day.toString(),
//         'start': workingHour.start.toString(),
//         'end': workingHour.end.toString(),
//         'breakStart': workingHour.breakStart.toString(),
//         'breakEnd': workingHour.breakEnd.toString(),
//       };
//       Provider.of<DaysListProvider>(context, listen: false)
//           .addToDaysList(data);
//     } else {
//       Provider.of<DaysListProvider>(context, listen: false)
//           .removeFromDaysList(workingHour.day.toString());
//     }
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<MyWorkingHoursProvider>(context, listen: false)
//           .getAllWorkingHours();
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     // apiScreen.workingHourList.clear();
//     // print("Abak ${apiScreen.workingHourList.length}");
//     print("DataList ${apiScreen.daysList}");
//
//     return Scaffold(
//       backgroundColor: singInWithFacebookButtonColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Consumer<MyWorkingHoursProvider>(builder: (context, value, child) {
//               final workingScheduleHours = value.workingHoursProvider;
//               return Expanded(
//                 child: ListView.builder(
//                   itemCount: workingScheduleHours.length,
//                   itemBuilder: (context, index) {
//                     print("Fazeel ${workingScheduleHours[index].day}");
//                     final workingHour = workingScheduleHours[index];
//                     print("Working $workingHour");
//                     return Container(
//                       height: 170,
//                       width: MediaQuery.of(context).size.width,
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 3.0, horizontal: 20.0),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10.0),
//                           border: Border.all(color: Colors.grey.shade400),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.4),
//                               offset: const Offset(0.1, 0.1),
//                               blurRadius: 5,
//                             )
//                           ]),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ListTile(
//                               title: Center(
//                                 child: Text(
//                                   workingScheduleHours[index].day.toString(),
//                                   style: const TextStyle(
//                                       color: singInWithGoogleButtonColor,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20.0),
//                                 ),
//                               ),
//                               trailing: Checkbox(
//                                   activeColor: Colors.green, // Set the fill color
//                                   checkColor: Colors.white,
//                                   value: workingHour.isChecked ?? false,
//                                   onChanged: (value){
//                                     setState(() {
//                                       workingHour.isChecked = value ?? false;
//                                       updateDaysList(workingHour);
//                                     });
//                                   })
//                           ),
//                           Divider(
//                             color: Colors.grey.withOpacity(0.2),
//                             thickness: 2.0,
//                           ),
//                           const SizedBox(
//                             height: 4.0,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               const Text(
//                                 "Start Work From",
//                                 style: TextStyle(
//                                     color: Colors.black87,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 17.0),
//                               ),
//                               Container(
//                                 height: 35,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   color: singInWithFacebookButtonColor,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                                 child: Center(
//                                     child: Text(
//                                   workingScheduleHours[index].start.toString(),
//                                   style: const TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w500),
//                                 )),
//                               ),
//                               const Text(
//                                 "Until",
//                                 style: TextStyle(
//                                     color: Colors.black87,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 17.0),
//                               ),
//                               Container(
//                                 height: 35,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   color: singInWithFacebookButtonColor,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                                 child: Center(
//                                     child: Text(
//                                   workingScheduleHours[index].end.toString(),
//                                   style: const TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w500),
//                                 )),
//                               ),
//                             ],
//                           ),
//                           Divider(
//                             color: Colors.grey.withOpacity(0.2),
//                             thickness: 2.0,
//                           ),
//                           const SizedBox(
//                             height: 4.0,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               const Text(
//                                 "Break From",
//                                 style: TextStyle(
//                                     color: Colors.black87,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 17.0),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 35),
//                                 child: Container(
//                                   height: 35,
//                                   width: 80,
//                                   decoration: BoxDecoration(
//                                     color: singInWithFacebookButtonColor,
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   ),
//                                   child: Center(
//                                       child: Text(
//                                     workingScheduleHours[index]
//                                         .breakStart
//                                         .toString(),
//                                     style: const TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.w500),
//                                   )),
//                                 ),
//                               ),
//                               const Text(
//                                 "Until",
//                                 style: TextStyle(
//                                     color: Colors.black87,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 17.0),
//                               ),
//                               Container(
//                                 height: 35,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   color: singInWithFacebookButtonColor,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                                 child: Center(
//                                     child: Text(
//                                   workingScheduleHours[index]
//                                       .breakEnd
//                                       .toString(),
//                                   style: const TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w500),
//                                 )),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               );
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramipartnerapp/screens/providers/dayslist_provider.dart';
import 'package:ramipartnerapp/screens/providers/updateworkinghours_provider.dart';
import 'package:ramipartnerapp/screens/providers/workinghours_provider.dart';
import 'package:ramipartnerapp/screens/shareedpreference/share_preference.dart';
import 'api/api_screen.dart';
import 'constants/colors.dart';
import 'package:http/http.dart' as http;
import 'constants/spinkit.dart';
import 'model/workingmodel_class.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWorkingHours extends StatefulWidget {
  static const routeName = '/myWorkingHoursScreen';

  const MyWorkingHours({Key? key}) : super(key: key);

  @override
  State<MyWorkingHours> createState() => _MyWorkingHoursState();
}

class _MyWorkingHoursState extends State<MyWorkingHours> {
  List<WorkingHourModelClass> selectedWorkingHours = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<MyWorkingHoursProvider>(context, listen: false)
          .getAllWorkingHours();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: singInWithFacebookButtonColor,
      body: SafeArea(
        child: Column(
          children: [
            Consumer<MyWorkingHoursProvider>(
              builder: (context, value, child) {
                final workingScheduleHours = value.workingHoursProvider;

                if (value.isLoading) {
                  return Expanded(
                    child: Center(
                      child: Loading(),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: workingScheduleHours.length,
                    itemBuilder: (context, index) {
                      final workingHour = workingScheduleHours[index];

                      return Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
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
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              title: Center(
                                child: Text(
                                  workingScheduleHours[index].day.toString(),
                                  style: const TextStyle(
                                    color: singInWithGoogleButtonColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              trailing: Checkbox(
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                value: workingHour.isChecked ?? false,
                                onChanged: (value) {
                                  setState(() {
                                    workingHour.isChecked = value ?? false;
                                    updateDaysList(workingHour);
                                  });
                                },
                              ),
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
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: singInWithFacebookButtonColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: TextField(
                                    controller: TextEditingController(
                                        text: workingHour.start.toString()),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    onChanged: (value) {
                                      workingHour.start = value;
                                    },
                                  ),
                                ),
                                const Text(
                                  "Until",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: singInWithFacebookButtonColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: TextField(
                                    controller: TextEditingController(
                                        text: workingHour.end.toString()),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    onChanged: (value) {
                                      workingHour.end = value;
                                    },
                                  ),
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
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Container(
                                    height: 35,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: singInWithFacebookButtonColor,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: TextField(
                                      controller: TextEditingController(
                                          text: workingHour.breakStart
                                              .toString()),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      onChanged: (value) {
                                        workingHour.breakStart = value;
                                      },
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Until",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: singInWithFacebookButtonColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: TextField(
                                    controller: TextEditingController(
                                        text: workingHour.breakEnd.toString()),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    onChanged: (value) {
                                      workingHour.breakEnd = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateDaysList(WorkingHourModelClass workingHour) {
    if (workingHour.isChecked ?? false) {
      final data = {
        'day': workingHour.day.toString(),
        'start': workingHour.start.toString(),
        'end': workingHour.end.toString(),
        'breakStart': workingHour.breakStart.toString(),
        'breakEnd': workingHour.breakEnd.toString(),
      };
      Provider.of<DaysListProvider>(context, listen: false).addToDaysList(data);
    } else {
      Provider.of<DaysListProvider>(context, listen: false)
          .removeFromDaysList(workingHour.day.toString());
    }
  }
}
