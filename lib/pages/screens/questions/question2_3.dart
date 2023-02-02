import 'package:cocreator/pages/screens/questions/widgets/big_text_black.dart';
import 'package:cocreator/pages/screens/questions/widgets/picker_roles.dart';
import 'package:cocreator/pages/screens/questions/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../hakim/controllers/tts.dart';
import 'widgets/button_grey.dart';
import 'widgets/button_gradient.dart';

class Question2_3Screen extends StatefulWidget {
  //static const String routeName = '/question2_3';
  const Question2_3Screen({Key? key}) : super(key: key);

  @override
  State<Question2_3Screen> createState() => _Question2_3ScreenState();
}

class _Question2_3ScreenState extends State<Question2_3Screen> {
  final _businessQuestion2FormKey = GlobalKey<FormState>();

  final TextEditingController _nameCompanyController = TextEditingController();
  final TextEditingController _selectorController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  void _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  void initState() {
    super.initState();
    talk();
  }

  String msg = "What type of profile do you have in your company?";

  final List<PickerItem> rolesModes = [
    PickerItem("Owner", "assets/English.jpg"),
    PickerItem("Manager", "assets/English.jpg"),
    PickerItem("Administrator", "assets/English.jpg"),
    PickerItem("Other", "assets/English.jpg"),
  ];

  void talk() {
    Future.delayed(const Duration(milliseconds: 500), () {
      TextToSpeech.speak(msg);
    });
  }

  Widget _businessQuestion1() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      // padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: _businessQuestion2FormKey,
        children: <Widget>[
          Text("What's Your role in the company",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
          const SizedBox(
            height: 25,
          ),
          ButtonGray(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.2,
                    0.5,
                    10
                  ],
                  colors: [
                    (Color.fromARGB(255, 255, 255, 255)),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ]),
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: () {
              /*
              _storeOnboardInfo();
              Navigator.pushNamed(
                context,
                '/question-2',
              );
              */
            },
            text: 'Owner',
          ),
          const SizedBox(
            height: 15,
          ),
          ButtonGray(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.2,
                    0.5,
                    10
                  ],
                  colors: [
                    (Color.fromARGB(255, 255, 255, 255)),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ]),
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: () {
              /*
              _storeOnboardInfo();
              Navigator.pushNamed(
                context,
                '/question-2',
              );
              */
            },
            text: 'Manager',
          ),
          const SizedBox(
            height: 15,
          ),
          ButtonGray(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.2,
                    0.5,
                    10
                  ],
                  colors: [
                    (Color.fromARGB(255, 255, 255, 255)),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ]),
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: () {
              /*
              _storeOnboardInfo();
              Navigator.pushNamed(
                context,
                '/question-2',
              );
              */
            },
            text: 'Administrator',
          ),
          const SizedBox(
            height: 15,
          ),
          ButtonGray(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.2,
                    0.5,
                    10
                  ],
                  colors: [
                    (Color.fromARGB(255, 255, 255, 255)),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ]),
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: () {
              /*
              _storeOnboardInfo();
              Navigator.pushNamed(
                context,
                '/question-2',
              );
              */
            },
            text: 'Other',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    //     stops: [
                    //   0.2,
                    //   9,
                    // ],
                    colors: [
                  Color.fromARGB(255, 143, 200, 241),
                  // Color.fromARGB(255, 94, 129, 253),
                  Color.fromARGB(255, 70, 106, 234)
                ])),
            // alignment: Alignment.centerLeft,
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),

                Image.asset('assets/logo2.png'),

                IconButton(
                  icon: Image.asset('assets/image.png'),
                  iconSize: 80,
                  onPressed: () {},
                ),

                const SizedBox(
                  height: 10,
                  width: 350,
                ),
                SizedBox(
                    child: Align(
                  alignment: Alignment.center,
                  child: SmallText(
                    text: '  Set up about your bussiness',
                    size: 20,
                    color: Colors.white,
                  ),
                )),
                // ACA HAY QUE CARGAR LAS PREGUNTAS BAJADAS DE LA API REST--------------------------------------
                // const SizedBox(
                //   child: Questions(),
                // ),
                const SizedBox(
                  height: 20,
                  width: 350,
                ),
                _businessQuestion1(),

                //----------------------------------------------------------------------
                const SizedBox(
                  height: 40,
                  width: 350,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: ButtonGradient(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: AlignmentDirectional.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [
                                  0.2,
                                  0.5,
                                  10
                                ],
                                colors: [
                                  (Color.fromARGB(255, 0, 0, 0)),
                                  Color.fromARGB(255, 0, 0, 0),
                                  Color.fromARGB(255, 0, 0, 0)
                                ]),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onTap: () {
                            // _storeOnboardInfo();
                            Navigator.pushNamed(
                              context,
                              'question2_2',
                            );
                            //context.go('/OnboardingIa');
                          },
                          text: 'Next',
                        ),
                      ),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      SizedBox(
                        width: 150,
                        child: ButtonGradient(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: AlignmentDirectional.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [
                                  0,
                                  1,
                                  0
                                ],
                                colors: [
                                  (Color.fromARGB(255, 255, 255, 255)),
                                  Color.fromARGB(0, 255, 255, 255),
                                  Color.fromARGB(255, 255, 255, 255)
                                ]),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onTap: () {
                            //_storeOnboardInfo();
                            Navigator.pushNamed(
                              context,
                              'question2_2',
                            );
                            //context.go('/question-1');
                          },
                          text: '  Later >|',
                        ),
                      ),
                    ],
                  ),
                ),
                // ButtonGradient(
                //   decoration: BoxDecoration(
                //     gradient: const LinearGradient(
                //         begin: AlignmentDirectional.topCenter,
                //         end: Alignment.bottomCenter,
                //         stops: [
                //           0.2,
                //           0.5,
                //           10
                //         ],
                //         colors: [
                //           (Color.fromARGB(255, 0, 0, 0)),
                //           Color.fromARGB(255, 0, 0, 0),
                //           Color.fromARGB(255, 0, 0, 0)
                //         ]),
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   onTap: () {
                //     _storeOnboardInfo();
                //     Navigator.pushNamed(
                //       context,
                //       'question2_2',
                //     );
                //     //context.go('/question-3');
                //   },
                //   text: 'Next',
                // ),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 200,
                ),
              ],
            )),
      ),
    );
  }

  Row indicatorQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 204, 204, 204),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 204, 204, 204),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ],
    );
  }
}
