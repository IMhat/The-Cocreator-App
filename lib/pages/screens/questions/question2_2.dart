import 'package:cocreator/pages/screens/questions/question1.dart';
import 'package:cocreator/pages/screens/questions/widgets/big_text_black.dart';
import 'package:cocreator/pages/screens/questions/widgets/small_text.dart';
import 'package:cocreator/widgets/boton_black.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:alan_voice/alan_voice.dart';
import '../hakim/controllers/tts.dart';
import 'widgets/button_gradient.dart';

import 'package:cocreator/helpers/mostrar_alerta.dart';
import 'package:cocreator/helpers/navegar_pagina.dart';
import 'package:cocreator/pages/check_onboarding.dart';
import 'package:cocreator/pages/login_page.dart';
import 'package:cocreator/pages/usuarios_page.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:cocreator/services/socket_service.dart';
import 'package:cocreator/widgets/boton_azul.dart';
import 'package:flutter/material.dart';

import 'package:cocreator/widgets/custom_input2.dart';
import 'package:cocreator/widgets/labels.dart';
import 'package:cocreator/widgets/logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class Question2_2Screen extends StatefulWidget {
  //static const String routeName = '/question2_2';
  const Question2_2Screen({Key? key}) : super(key: key);

  @override
  State<Question2_2Screen> createState() => _Question2_2ScreenState();
}

class _Question2_2ScreenState extends State<Question2_2Screen> {
  bool _greetingIsPlayed = false;

  final _businessQuestion1FormKey = GlobalKey<FormState>();

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

  _Question2_2ScreenState() {
    AlanVoice.addButton(
        "0079af61506bf21083d402240619a0a82e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    AlanVoice.onButtonState.add((state) {
      if (state.name == "ONLINE" && !_greetingIsPlayed) {
        _greetingIsPlayed = true;
        AlanVoice.activate();
        AlanVoice.playText("Answer questions about your business");
      }
    });
    //@override
    //void initState() {
    //super.initState();
    //talk();
  }

  String msg = "Answer questions about your business";

  void talk() {
    Future.delayed(const Duration(milliseconds: 500), () {
      TextToSpeech.speak(msg);
    });
  }

  Widget _businessQuestion1() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: _businessQuestion1FormKey,
        children: <Widget>[
          Text('Name Company',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              )),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _selectorController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter name',
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            // validator: (val) {
            //   if (val == null || val.isEmpty) {
            //     return 'Please enter $hintText';
            //   }
            //   return null;
            // },
            // maxLines: maxLines,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Selector',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          // CustomTextField(

          //   controller: _passwordController,
          //   hintText: 'Enter Password',
          // ),

          TextFormField(
            controller: _selectorController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Select',
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            // validator: (val) {
            //   if (val == null || val.isEmpty) {
            //     return 'Please enter $hintText';
            //   }
            //   return null;
            // },
            // maxLines: maxLines,
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Number of employees',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              )),

          TextFormField(
            controller: _nameCompanyController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Select',
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            // validator: (val) {
            //   if (val == null || val.isEmpty) {
            //     return 'Please enter $hintText';
            //   }
            //   return null;
            // },
            // maxLines: maxLines,
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
                  height: 40,
                ),
                Text('Cocreator',
                    style: GoogleFonts.redRose(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                // Image.asset('assets/logo2.png'),

                IconButton(
                  icon: Image.asset('assets/image.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),

                const SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //     child: Container(
                //   padding: EdgeInsets.symmetric(horizontal: 40),
                //   alignment: Alignment.center,
                //   child: SmallText(
                //     text:
                //         ' en esta pantalla, deberás responder el test de personalidad, esto nos ayuda a conocerte un poco más',
                //     size: 20,
                //     color: Colors.white,
                //   ),
                // )),

                // const SizedBox(
                //   height: 40,
                //   width: 350,
                // ),
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
                const SizedBox(
                  height: 20,
                  width: 350,
                ),
                // _businessQuestion1(),
                _Form(),

                //----------------------------------------------------------------------
                const SizedBox(
                  height: 20,
                  width: 350,
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
                //       'question1',
                //     );
                //     //context.go('/question-3');
                //   },
                //   text: 'Next',
                // ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       SizedBox(
                //         width: 150,
                //         child: ButtonGradient(
                //           decoration: BoxDecoration(
                //             gradient: const LinearGradient(
                //                 begin: AlignmentDirectional.topCenter,
                //                 end: Alignment.bottomCenter,
                //                 stops: [
                //                   0.2,
                //                   0.5,
                //                   10
                //                 ],
                //                 colors: [
                //                   (Color.fromARGB(255, 0, 0, 0)),
                //                   Color.fromARGB(255, 0, 0, 0),
                //                   Color.fromARGB(255, 0, 0, 0)
                //                 ]),
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //           onTap: () {
                //             // _storeOnboardInfo();
                //             Navigator.pushNamed(
                //               context,
                //               'question1',
                //             );
                //             //context.go('/OnboardingIa');
                //           },
                //           text: 'Next',
                //         ),
                //       ),
                //       // const SizedBox(
                //       //   width: 20,
                //       // ),
                //       // SizedBox(
                //       //   width: 150,
                //       //   child: ButtonGradient(
                //       //     decoration: BoxDecoration(
                //       //       gradient: const LinearGradient(
                //       //           begin: AlignmentDirectional.topCenter,
                //       //           end: Alignment.bottomCenter,
                //       //           stops: [
                //       //             0,
                //       //             1,
                //       //             0
                //       //           ],
                //       //           colors: [
                //       //             (Color.fromARGB(255, 255, 255, 255)),
                //       //             Color.fromARGB(0, 255, 255, 255),
                //       //             Color.fromARGB(255, 255, 255, 255)
                //       //           ]),
                //       //       borderRadius: BorderRadius.circular(15),
                //       //     ),
                //       //     onTap: () {
                //       //       //_storeOnboardInfo();
                //       //       Navigator.pushNamed(
                //       //         context,
                //       //         'question1',
                //       //       );
                //       //       //context.go('/question-1');
                //       //     },
                //       //     text: '  Later >|',
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),

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
                //     _storeOnboardInfo();
                //     Navigator.pushNamed(
                //       context,
                //       '/actual-home',
                //     );
                //     //context.go('/question-3');
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

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final employeesCtrl = TextEditingController();
  final selectorCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  String business = 'Energy';
  var itemsBusiness = [
    'Energy',
    'Production of metals',
    'Mineral industries',
    'Chemical industry',
  ];
  String employees = '1-10';
  var itemsEmployees = [
    '1-10',
    '10-20',
    '20-30',
    '40-50',
    '50-60',
    '60-70',
    '70-80',
    '80-90',
    '90-100'
  ];
  String roles = 'Owner';
  var itemsRoles = [
    'Owner',
    'Manager',
    'Administrator',
    'Others',
  ];

  Widget _termsOfService() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'By signing up you agree to our ',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w200,
              color: Color.fromARGB(255, 0, 0, 0)),
          children: [
            TextSpan(
              text: 'Terms of Service ',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
            ),
            TextSpan(
              text: 'and ',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
            ),
            TextSpan(
              text: ', and confirm that you are at least 18 years old.',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    final socketService = Provider.of<SocketService>(context);

    bool verificarCamposNoNulos() {
      bool camposLlenos = false;
      if (business.toString() != '' &&
          employees.toString() != '' &&
          roles.toString() != '' &&
          nameCtrl.text.toString() != '') {
        camposLlenos = true;
      }
      return camposLlenos;
      // if (employeesCtrl.text.toString() != '' &&
      //     selectorCtrl.text.toString() != '' &&
      //     nameCtrl.text.toString() != '') {
      //   camposLlenos = true;
      // }
      // return camposLlenos;
    }

    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Name Company',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),

          CustomInput2(
              icon: Icons.perm_identity,
              placeholder: 'Enter name',
              textController: nameCtrl),

          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Selector',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          // Row(
          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //Text("Selector", style: TextStyle(color: Colors.white)),
          Container(
              width: 315,
              //height: 55,
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
              //height: 40,
              //padding: EdgeInsets.all(20.0),s
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                    color: Colors.white,
                    // color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 0.80),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Row(
                    children: [
                      //Icon(Icons.select_all, color: Colors.black),
                      Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          // color: Theme.of(context).hintColor,
                        ),
                      )
                    ],
                  ),
                  items: itemsBusiness
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 45),
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 102, 102, 102)),
                              ),
                            ),
                          ))
                      .toList(),
                  value: business,
                  onChanged: (String? newValue) {
                    setState(() {
                      business = newValue!;
                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 40,
                ),
              )),
          //   ],
          // ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Roles',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          Container(
              width: 315,
              //height: 55,
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
              //height: 40,
              //padding: EdgeInsets.all(20.0),s
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                    color: Colors.white,
                    // color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 0.80),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Row(
                    children: [
                      //Icon(Icons.select_all, color: Colors.black),
                      Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          // color: Theme.of(context).hintColor,
                        ),
                      )
                    ],
                  ),
                  items: itemsRoles
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 45),
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 102, 102, 102)),
                              ),
                            ),
                          ))
                      .toList(),
                  value: roles,
                  onChanged: (String? newValue) {
                    setState(() {
                      roles = newValue!;
                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 40,
                ),
              )),
          //   ],
          // ),

          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Number of employees',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),

          Container(
              width: 315,
              //height: 55,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
              //height: 40,
              //padding: EdgeInsets.all(20.0),s
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                    color: Colors.white,
                    // color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 0.80),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Row(
                    children: [
                      //Icon(Icons.select_all, color: Colors.black),
                      Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          // color: Theme.of(context).hintColor,
                        ),
                      )
                    ],
                  ),
                  items: itemsEmployees
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 45),
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 102, 102, 102)),
                              ),
                            ),
                          ))
                      .toList(),
                  value: employees,
                  onChanged: (String? newValue) {
                    setState(() {
                      employees = newValue!;
                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 40,
                ),
              )),

          BotonBlack(
              text: 'Next',
              onPressed: authService.autenticando && verificarCamposNoNulos()
                  ? null
                  : () async {
                      print(nameCtrl.text);
                      print(business);
                      print(roles);
                      print(employees);

                      final updateOk = await authService.updateUser(
                          business.trim(),
                          nameCtrl.text.trim(),
                          employees.trim(),
                          roles.trim());

                      if (updateOk == true) {
                        // Conectamos el servidor de sockets
                        //socketService.connect();
                        navegarPagina(context, Question1Screen());
                      } else {
                        mostrarAlerta(
                            context, 'Wrong form', updateOk.toString());
                      }
                    })
        ],
      ),

      // BotonAzul(
      //     text: 'Sign up',
      //     onPressed: authService.autenticando && verificarCamposNoNulos()
      //         ? null
      //         : () async {
      //             print(nameCtrl.text);
      //             print(employeesCtrl.text);
      //             print(selectorCtrl.text);
      //             final registroOk = await authService.register(
      //                 nameCtrl.text.trim(),
      //                 employeesCtrl.text.trim(),
      //                 selectorCtrl.text.trim());
      //             if (registroOk == true) {
      //               // Conectamos el servidor de sockets
      //               socketService.connect();
      //               navegarPagina(context, Check());
      //             } else {
      //               mostrarAlerta(
      //                   context, 'Wrong registration', registroOk.toString());
      //             }
      //           })

      // ? null
      // : () async {
      //     print(nameCtrl.text);
      //     print(employeesCtrl.text);
      //     print(selectorCtrl.text);
      //     final registroOk = await authService.register(
      //         nameCtrl.text.trim(),
      //         employeesCtrl.text.trim(),
      //         selectorCtrl.text.trim());
      //     if (registroOk == true) {
      //       // Conectamos el servidor de sockets
      //       socketService.connect();
      //       navegarPagina(context, Check());
      //     } else {
      //       mostrarAlerta(
      //           context, 'Wrong registration', registroOk.toString());
      //     }
      //   }
    );
  }
}
