import 'package:cocreator/pages/screens/questions/widgets/accounts.dart';
import 'package:cocreator/pages/screens/questions/widgets/big_text_black.dart';
import 'package:cocreator/pages/screens/questions/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:alan_voice/alan_voice.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../hakim/controllers/tts.dart';
import 'widgets/button_gradient.dart';

class Question1Screen extends StatefulWidget {
  //static const String routeName = '/question1';

  const Question1Screen({Key? key}) : super(key: key);

  @override
  State<Question1Screen> createState() => _Question1ScreenState();
}

class _Question1ScreenState extends State<Question1Screen> {
  bool _greetingIsPlayed = false;

  void _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  _Question1ScreenState() {
    AlanVoice.addButton("0079af61506bf21083d402240619a0a82e956eca572e1d8b807a3e2338fdd0dc/stage", buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    AlanVoice.onButtonState.add((state) {
      if (state.name == "ONLINE" && !_greetingIsPlayed) {
        _greetingIsPlayed = true;
        AlanVoice.activate();
        AlanVoice.playText("Next, select a financial services account, this will help you better manage your income and expenses, as well as keep in touch with your financial service. We do not use any information you have provided");
      }
      
       });
  //@override
  //void initState() {
    //super.initState();
    //talk();
  }

  String msg =
      " Next, select a financial services account, this will help you better manage your income and expenses, as well as keep in touch with your financial service. We do not use any information you have provided";

  void talk() {
    Future.delayed(const Duration(milliseconds: 500), () {
      TextToSpeech.speak(msg);
    });
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
                // Container(
                //     height: 40,
                //     width: 550,
                //     child: IconButton(
                //       icon: Image.asset('assets/logo2.png'),
                //       iconSize: 600,
                //       onPressed: () {},
                //     )),

                //aca va la pelota que habla

                IconButton(
                  icon: Image.asset('assets/image.png'),
                  iconSize: 80,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.centerLeft,
                  child: SmallText(
                    text:
                        '  Next, select a financial services account, this will help you better manage your income and expenses, as well as keep in touch with your financial service. We do not use any information you have provided',
                    size: 18,
                    color: Colors.white,
                  ),
                )),

                const SizedBox(
                  height: 30,
                  width: 350,
                ),
                SizedBox(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: BigTextBlack(
                    text: '  Connect your accounts',
                    size: 30,
                    color: Colors.white,
                  ),
                )),
                // ACA HAY QUE CARGAR LAS PREGUNTAS BAJADAS DE LA API REST--------------------------------------
                const SizedBox(
                  child: Accounts(),
                ),
                // Expanded(
                //   child: PickerAccount(),
                // ),

                //----------------------------------------------------------------------
                const SizedBox(
                  height: 20,
                  width: 350,
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  //alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                            //_storeOnboardInfo();
                            Navigator.pushNamed(
                              context,
                              'question2',
                            );
                            //context.go('/question-2');
                          },
                          text: 'Confirm',
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),

                // ButtonGradient(
                //   decoration: BoxDecoration(
                //     gradient: const LinearGradient(
                //         begin: AlignmentDirectional.topCenter,
                //         end: Alignment.bottomCenter,
                //         stops: [
                //           0,
                //           1,
                //           0
                //         ],
                //         colors: [
                //           (Color.fromARGB(255, 255, 255, 255)),
                //           Color.fromARGB(0, 255, 255, 255),
                //           Color.fromARGB(255, 255, 255, 255)
                //         ]),
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   onTap: () {
                //     //_storeOnboardInfo();
                //     Navigator.pushNamed(
                //       context,
                //       'question2',
                //     );
                //     //context.go('/question-2');
                //   },
                //   text: '  Later >|',
                // ),
                // TextButton(
                //   onPressed: () {
                //     _storeOnboardInfo();
                //     Navigator.pushReplacement(context,
                //         MaterialPageRoute(builder: (context) => BottomBar()));
                //   },
                //   child: Text(
                //     "Skip",
                //     style: TextStyle(
                //       color: kwhite,
                //     ),
                //   ),
                // ),
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
