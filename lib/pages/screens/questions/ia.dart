import 'package:cocreator/pages/screens/hakim/controllers/tts.dart';
import 'package:cocreator/pages/screens/questions/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:alan_voice/alan_voice.dart';
import 'widgets/button_gradient.dart';

class OnboardingIaScreen extends StatefulWidget {
  //static const String routeName = '/onboardingIa';
  const OnboardingIaScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingIaScreen> createState() => _OnboardingIaScreenState();
}

class _OnboardingIaScreenState extends State<OnboardingIaScreen> {
  // class OnboardingIaScreen extends StatelessWidget {
  // static const String routeName = '/iaScreen';
  // const OnboardingIaScreen({Key? key}) : super(key: key);
bool _greetingIsPlayed = false;

  void _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }
_OnboardingIaScreenState() {
    AlanVoice.addButton("0079af61506bf21083d402240619a0a82e956eca572e1d8b807a3e2338fdd0dc/stage", buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    AlanVoice.onButtonState.add((state) {
      if (state.name == "ONLINE" && !_greetingIsPlayed) {
        _greetingIsPlayed = true;
        AlanVoice.activate();
        AlanVoice.playText("hi, my name is hakim, and cocreator is an application that helps you manage your business");
      }
      
       });
  //@override
  //void initState() {
    //super.initState();
    //talk();
  }

  String msg =
      "hi, my name is hakim, and cocreator is an application that helps you manage your business";

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
                    //   0.4,
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
                  height: 80,
                ),
                // IconButton(
                //   icon: Image.asset('assets/logo2.png'),
                //   iconSize: 200,
                //   onPressed: () {},
                // ),
                Container(
                    height: 50,
                    width: 550,
                    child: IconButton(
                      icon: Image.asset('assets/logo2.png'),
                      iconSize: 600,
                      onPressed: () {},
                    )),
                // ACA HAY QUE AÑADIR LA PELOTA BLANCA QUE HABLA Y TIENE EFECTOS--------------------------
                const SizedBox(
                  height: 40,
                  width: 350,
                ),

                IconButton(
                  icon: Image.asset('assets/image.png'),
                  iconSize: 200,
                  onPressed: () {},
                ),

                //---------------------------------------------------------------

                const SizedBox(
                  height: 70,
                  width: 350,
                ),
                SizedBox(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.centerLeft,
                  child: SmallText(
                    text:
                        '  hi , my name is hakim, and cocreator is an application that helps you manage your business',
                    size: 20,
                    color: Colors.white,
                  ),
                )),

                const SizedBox(
                  height: 30,
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
                              'onboardingIa',
                            );
                            //context.go('/OnboardingIa');
                          },
                          text: 'Repeat',
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
                              'question2_3',
                            );
                            //context.go('/question-1');
                          },
                          text: '  Skip >|',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

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



// Color(0xffFD0745),
//                     Color(0xff6D49C2)