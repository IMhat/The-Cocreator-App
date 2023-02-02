// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:keycloakflutter/screens/login(keycloak)/constant.dart';
// import 'package:keycloakflutter/screens/questions/widgets/answer_button.dart';
// import 'package:keycloakflutter/screens/questions/widgets/big_text.dart';
// import 'package:keycloakflutter/screens/questions/widgets/big_text_black.dart';
// import 'package:keycloakflutter/screens/questions/widgets/lenguague_button.dart';
// import 'package:keycloakflutter/screens/questions/widgets/small_text.dart';

// import 'package:keycloakflutter/widgets/bottom_bar.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'widgets/button_gradient.dart';

// class Question3Screen extends StatelessWidget {
//   static const String routeName = '/question-3';
//   const Question3Screen({Key? key}) : super(key: key);

//   void _storeOnboardInfo() async {
//     print("Shared pref called");
//     int isViewed = 0;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('onBoard', isViewed);
//     print(prefs.getInt('onBoard'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffFFFFFF),
//       body: SingleChildScrollView(
//         child: Container(
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.centerRight,
//                     end: Alignment.centerLeft,
//                     stops: [
//                   0.2,
//                   9,
//                 ],
//                     colors: [
//                   Color.fromARGB(255, 104, 191, 250),
//                   Color.fromARGB(255, 0, 102, 255)
//                 ])),
//             // alignment: Alignment.centerLeft,
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 SizedBox(
//                     child: Align(
//                   alignment: Alignment.topCenter,
//                   child: BigText(
//                     text: '  TheCocreator',
//                     color: Colors.white,
//                     size: 30,
//                   ),
//                 )),
//                 const SizedBox(
//                   height: 100,
//                 ),
//                 SizedBox(
//                     child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: SmallText(
//                     text:
//                         '  Here select the phrase with which you feel best identified.',
//                     size: 20,
//                     color: Colors.white,
//                   ),
//                 )),

//                 const SizedBox(
//                   height: 50,
//                   width: 350,
//                 ),
//                 SizedBox(
//                     child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: BigTextBlack(
//                     text: '  Personality setup',
//                     size: 30,
//                     color: Colors.white,
//                   ),
//                 )),
//                 // ACA HAY QUE CARGAR LAS PREGUNTAS BAJADAS DE LA API REST--------------------------------------

//                 //----------------------------------------------------------------------
//                 const SizedBox(
//                   height: 425,
//                   width: 350,
//                 ),
//                 ButtonGradient(
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                         begin: AlignmentDirectional.topCenter,
//                         end: Alignment.bottomCenter,
//                         stops: [
//                           0.2,
//                           0.5,
//                           10
//                         ],
//                         colors: [
//                           (Color.fromARGB(255, 0, 0, 0)),
//                           Color.fromARGB(255, 0, 0, 0),
//                           Color.fromARGB(255, 0, 0, 0)
//                         ]),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   onTap: () {
//                     _storeOnboardInfo();
//                     Navigator.pushNamed(
//                       context,
//                       '/actual-home',
//                     );
//                     //context.go('/actual-home');
//                   },
//                   text: 'Confirm',
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),

//                 ButtonGradient(
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                         begin: AlignmentDirectional.topCenter,
//                         end: Alignment.bottomCenter,
//                         stops: [
//                           0,
//                           1,
//                           0
//                         ],
//                         colors: [
//                           (Color.fromARGB(255, 255, 255, 255)),
//                           Color.fromARGB(0, 255, 255, 255),
//                           Color.fromARGB(255, 255, 255, 255)
//                         ]),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   onTap: () {
//                     _storeOnboardInfo();
//                     Navigator.pushNamed(
//                       context,
//                       '/actual-home',
//                     );
//                     //context.go('/actual-home');
//                   },
//                   text: '  Later >|',
//                 ),
//                 // TextButton(
//                 //   onPressed: () {
//                 //     _storeOnboardInfo();
//                 //     Navigator.pushReplacement(context,
//                 //         MaterialPageRoute(builder: (context) => BottomBar()));
//                 //   },
//                 //   child: Text(
//                 //     "Skip",
//                 //     style: TextStyle(
//                 //       color: kwhite,
//                 //     ),
//                 //   ),
//                 // ),
//                 const SizedBox(
//                   height: 200,
//                 ),
//               ],
//             )),
//       ),
//     );
//   }

//   Row indicatorQuestion() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 0, 0, 0),
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         const SizedBox(
//           width: 6,
//         ),
//         Container(
//           width: 15,
//           height: 15,
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 204, 204, 204),
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         const SizedBox(
//           width: 6,
//         ),
//         Container(
//           width: 15,
//           height: 15,
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 204, 204, 204),
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//       ],
//     );
//   }
// }
