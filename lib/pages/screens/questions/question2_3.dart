// import 'package:cocreator/pages/screens/questions/widgets/big_text_black.dart';
// import 'package:cocreator/pages/screens/questions/widgets/picker_roles.dart';
// import 'package:cocreator/pages/screens/questions/widgets/small_text.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:alan_voice/alan_voice.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import '../hakim/controllers/tts.dart';
// import 'widgets/button_grey.dart';
// import 'widgets/button_gradient.dart';

// class Question2_3Screen extends StatefulWidget {
//   //static const String routeName = '/question2_3';
//   const Question2_3Screen({Key? key}) : super(key: key);

//   @override
//   State<Question2_3Screen> createState() => _Question2_3ScreenState();
// }

// class _Question2_3ScreenState extends State<Question2_3Screen> {
//   bool _greetingIsPlayed = false;

//   final _businessQuestion2FormKey = GlobalKey<FormState>();

//   final TextEditingController _nameCompanyController = TextEditingController();
//   final TextEditingController _selectorController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();

//   void _storeOnboardInfo() async {
//     print("Shared pref called");
//     int isViewed = 0;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('onBoard', isViewed);
//     print(prefs.getInt('onBoard'));
//   }

//   _Question2_3ScreenState() {
//     AlanVoice.addButton(
//         "0079af61506bf21083d402240619a0a82e956eca572e1d8b807a3e2338fdd0dc/stage",
//         buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

//     AlanVoice.onButtonState.add((state) {
//       if (state.name == "ONLINE" && !_greetingIsPlayed) {
//         _greetingIsPlayed = true;
//         AlanVoice.activate();
//         AlanVoice.playText("What type of profile do you have in your company?");
//       }
//     });
//     //@override
//     //void initState() {
//     //super.initState();
//     //talk();
//   }

//   String msg = "What type of profile do you have in your company?";

//   final List<PickerItem> rolesModes = [
//     PickerItem("Owner", "assets/English.jpg"),
//     PickerItem("Manager", "assets/English.jpg"),
//     PickerItem("Administrator", "assets/English.jpg"),
//     PickerItem("Other", "assets/English.jpg"),
//   ];

//   void talk() {
//     Future.delayed(const Duration(milliseconds: 500), () {
//       TextToSpeech.speak(msg);
//     });
//   }

//   // Widget _businessQuestion1() {
//   //   return Container(
//   //     margin: EdgeInsets.symmetric(vertical: 0),
//   //     // padding: const EdgeInsets.all(8),
//   //     child: Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       key: _businessQuestion2FormKey,
//   //       children: <Widget>[
//   //         Text("What's Your role in the company",
//   //             style: GoogleFonts.poppins(color: Colors.white, fontSize: 18)),
//   //         const SizedBox(
//   //           height: 25,
//   //         ),
//   //         ButtonGray(
//   //           decoration: BoxDecoration(
//   //             gradient: const LinearGradient(
//   //                 begin: AlignmentDirectional.topCenter,
//   //                 end: Alignment.bottomCenter,
//   //                 stops: [
//   //                   0.2,
//   //                   0.5,
//   //                   10
//   //                 ],
//   //                 colors: [
//   //                   (Color.fromARGB(255, 255, 255, 255)),
//   //                   Color.fromARGB(255, 255, 255, 255),
//   //                   Color.fromARGB(255, 255, 255, 255)
//   //                 ]),
//   //             borderRadius: BorderRadius.circular(15),
//   //           ),
//   //           onTap: () {
//   //             /*
//   //             _storeOnboardInfo();
//   //             Navigator.pushNamed(
//   //               context,
//   //               '/question-2',
//   //             );
//   //             */
//   //           },
//   //           text: 'Owner',
//   //         ),
//   //         const SizedBox(
//   //           height: 15,
//   //         ),
//   //         ButtonGray(
//   //           decoration: BoxDecoration(
//   //             gradient: const LinearGradient(
//   //                 begin: AlignmentDirectional.topCenter,
//   //                 end: Alignment.bottomCenter,
//   //                 stops: [
//   //                   0.2,
//   //                   0.5,
//   //                   10
//   //                 ],
//   //                 colors: [
//   //                   (Color.fromARGB(255, 255, 255, 255)),
//   //                   Color.fromARGB(255, 255, 255, 255),
//   //                   Color.fromARGB(255, 255, 255, 255)
//   //                 ]),
//   //             borderRadius: BorderRadius.circular(15),
//   //           ),
//   //           onTap: () {
//   //             /*
//   //             _storeOnboardInfo();
//   //             Navigator.pushNamed(
//   //               context,
//   //               '/question-2',
//   //             );
//   //             */
//   //           },
//   //           text: 'Manager',
//   //         ),
//   //         const SizedBox(
//   //           height: 15,
//   //         ),
//   //         ButtonGray(
//   //           decoration: BoxDecoration(
//   //             gradient: const LinearGradient(
//   //                 begin: AlignmentDirectional.topCenter,
//   //                 end: Alignment.bottomCenter,
//   //                 stops: [
//   //                   0.2,
//   //                   0.5,
//   //                   10
//   //                 ],
//   //                 colors: [
//   //                   (Color.fromARGB(255, 255, 255, 255)),
//   //                   Color.fromARGB(255, 255, 255, 255),
//   //                   Color.fromARGB(255, 255, 255, 255)
//   //                 ]),
//   //             borderRadius: BorderRadius.circular(15),
//   //           ),
//   //           onTap: () {
//   //             /*
//   //             _storeOnboardInfo();
//   //             Navigator.pushNamed(
//   //               context,
//   //               '/question-2',
//   //             );
//   //             */
//   //           },
//   //           text: 'Administrator',
//   //         ),
//   //         const SizedBox(
//   //           height: 15,
//   //         ),
//   //         ButtonGray(
//   //           decoration: BoxDecoration(
//   //             gradient: const LinearGradient(
//   //                 begin: AlignmentDirectional.topCenter,
//   //                 end: Alignment.bottomCenter,
//   //                 stops: [
//   //                   0.2,
//   //                   0.5,
//   //                   10
//   //                 ],
//   //                 colors: [
//   //                   (Color.fromARGB(255, 255, 255, 255)),
//   //                   Color.fromARGB(255, 255, 255, 255),
//   //                   Color.fromARGB(255, 255, 255, 255)
//   //                 ]),
//   //             borderRadius: BorderRadius.circular(15),
//   //           ),
//   //           onTap: () {
//   //             /*
//   //             _storeOnboardInfo();
//   //             Navigator.pushNamed(
//   //               context,
//   //               '/question-2',
//   //             );
//   //             */
//   //           },
//   //           text: 'Other',
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 0),
//           // child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               //child: Column(
//               //children: [
//               // const SizedBox(
//               //   height: 40,
//               // ),
//               // SizedBox(
//               //   height: 330,
//               //   width: 350,
//               //   child: Image.asset(
//               //     'assets/question1.gif',
//               //     fit: BoxFit.contain,
//               //   ),
//               // ),

//               const SizedBox(
//                 height: 100,
//                 width: 350,
//                 //child: Text('Welcome to'),
//               ),
//               const SizedBox(
//                   child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: /*BigTextBlack(
                  
//                   text: '  Welcome to',
//                   size: 42,
//                   color: Colors.black,
//                 ),*/
//                           Text(
//                         'Welcome to',
//                         style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: '.SF UI Text',
//                             color: Colors.black),
//                       ))),

//               Container(
//                   margin: EdgeInsets.only(left: 15, right: 40),
//                   height: 120,
//                   width: 550,
//                   child: IconButton(
//                     icon: Image.asset('assets/logo.png'),
//                     iconSize: 300,
//                     onPressed: () {},
//                   )),

//               const SizedBox(
//                 height: 30,
//                 width: 350,
//               ),
//               SizedBox(
//                   child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         '    Set up your lenguague',
//                         style: GoogleFonts.poppins(
//                             fontSize: 16, color: Colors.black),
//                       )
//                       /*SmallText(
                  
//                   text: ,
//                 ),*/
//                       )),
//               const SizedBox(
//                 height: 5,
//               ),
//               // SizedBox(
//               //   height: 250,
//               //   child: Expanded(
//               //     child: PickerWidget(pickerItems: paymentModes),
//               //   ),
//               // ),

//               Expanded(
//                 child: PickerWidget(pickerItems: rolesModes),
//               ),

//               // LenguagueButton(
//               //   imagen: Image.asset(
//               //     'assets/English.jpg',
//               //     fit: BoxFit.cover,
//               //     width: 75,
//               //   ),
//               //   text: 'English',
//               //   onPressed: (() {
//               //     // Navigator.pushNamed(
//               //     //   context,
//               //     //   'question-2',
//               //     // );
//               //   }),
//               // ),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // LenguagueButton(
//               //   imagen: Image.asset(
//               //     'assets/Spanish.png',
//               //     fit: BoxFit.cover,
//               //     width: 76,
//               //   ),
//               //   text: 'Spanish',
//               //   onPressed: (() {
//               //     // Navigator.pushNamed(
//               //     //   context,
//               //     //   '/question1',
//               //     // );
//               //   }),
//               // ),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // LenguagueButton(
//               //   imagen: Image.asset(
//               //     'assets/French.png',
//               //     fit: BoxFit.cover,
//               //     width: 75,
//               //   ),
//               //   text: 'French',
//               //   onPressed: (() {
//               //     // Navigator.pushNamed(
//               //     //   context,
//               //     //   '/question1',
//               //     // );
//               //   }),
//               // ),
//               // const SizedBox(
//               //   height: 50,
//               // ),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // indicatorQuestion(),
//               const SizedBox(
//                 height: 40,
//               ),
//               ButtonGradient(
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                       begin: AlignmentDirectional.topCenter,
//                       end: Alignment.bottomCenter,
//                       stops: [
//                         0.2,
//                         0.5,
//                         10
//                       ],
//                       colors: [
//                         (Color.fromARGB(255, 0, 0, 0)),
//                         Color.fromARGB(255, 0, 0, 0),
//                         Color.fromARGB(255, 0, 0, 0)
//                       ]),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 onTap: () {
//                   // _storeOnboardInfo();
//                   Navigator.pushNamed(
//                     context,
//                     'onboardingIa',
//                   );
//                   // context.go('/OnboardingIa');
//                 },
//                 text: 'Continue',
//               ),
//               // TextButton(
//               //   onPressed: () {
//               //     //_storeOnboardInfo();
//               //     Navigator.pushReplacement(context,
//               //         MaterialPageRoute(builder: (context) => BottomBar()));
//               //   },
//               //   child: Text(
//               //     "Skip",
//               //     style: TextStyle(
//               //       color: kwhite,
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//           //),
//         ),
//       ],
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
