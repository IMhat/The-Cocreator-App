import 'package:cocreator/pages/bottom_bar.dart';
import 'package:cocreator/pages/check_onboarding.dart';
import 'package:cocreator/pages/screens/hakim/ia_screen.dart';
import 'package:cocreator/pages/screens/hakim/screens/speech_screen.dart';
import 'package:cocreator/pages/screens/home/home_screen.dart';
import 'package:cocreator/pages/screens/profile/profile_screen.dart';

import 'package:cocreator/pages/screens/questions/ia.dart';
import 'package:cocreator/pages/screens/questions/lenguaje.dart';
import 'package:cocreator/pages/screens/questions/question1.dart';
import 'package:cocreator/pages/screens/questions/question2.dart';
import 'package:cocreator/pages/screens/questions/question2_2.dart';
import 'package:cocreator/pages/screens/questions/question2_3.dart';
import 'package:flutter/material.dart';

import 'package:cocreator/pages/chat_page.dart';
import 'package:cocreator/pages/loading_page.dart';
import 'package:cocreator/pages/login_page.dart';
import 'package:cocreator/pages/register_page.dart';
import 'package:cocreator/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'usuarios': (_) => UsuariosPage(),
  'loading': (_) => LoadingPage(),
  'check': (_) => Check(),
  'onboardingIa': (_) => OnboardingIaScreen(),
  'homeScreen': (_) => HomeScreen(),
  'bottomBar': (_) => BottomBar(),
  'lenguague': (_) => LenguajeScreen(),
  'question1': (_) => Question1Screen(),
  'question2': (_) => Question2Screen(),
  'question2_2': (_) => Question2_2Screen(),
  'question2_3': (_) => Question2_3Screen(),
  //hakim
  'hakim': (_) => SpeechScreen(),
  'iaScreen': (_) => IaScreen(),

  //profile
  'profile': (_) => ProfileScreen(),

  //social
};
