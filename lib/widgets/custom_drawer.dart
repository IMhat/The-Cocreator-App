import 'package:cocreator/helpers/navegar_pagina.dart';
import 'package:cocreator/pages/login_page.dart';
import 'package:cocreator/services/auth_service.dart';

import 'package:cocreator/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

// import 'package:provider/provider.dart';

// import '../screens/login/service/auth_service2.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context, listen: false);
    //final AuthService authService = AuthService();

    //final user = context.watch<UserProvider>().user;
    final socketService = Provider.of<SocketService>(context);
    final authService = Provider.of<AuthServices>(context);
    final usuario = authService.usuario;
    final String nombreUsuario = (usuario == null ? "" : usuario.name);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: ListView(
        children: [
          Container(
              width: 30,
              height: 40,
              margin: const EdgeInsets.only(left: 200),
              child: IconButton(
                icon: Image.asset('assets/close.png'),
                iconSize: 8,
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
              )),
          Container(
            width: 50,
            height: 100,
            margin: const EdgeInsets.only(right: 200),
            child: IconButton(
              icon: Image.asset('assets/userlogo.png'),
              iconSize: 100,
              onPressed: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            width: 90,
            height: 100,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Container(
              margin: const EdgeInsets.only(right: 60),
              child: ListView(
                children: [
                  Text(
                    nombreUsuario,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 152, 237)),
                  ),
                  const SizedBox(
                    width: 40,
                    height: 30,
                  ),
                  const Text(
                    'My Company',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            indent: 5,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(
              Icons.settings,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   'actual-home',
              // );
            },
          ),
          ListTile(
            title: const Text(
              'Support',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(
              Icons.help,
              color: Colors.black,
            ),
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   '',
              // );
            },
          ),
          ListTile(
            title: const Text(
              'English',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(
              Icons.language,
              color: Colors.black,
            ),
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   '',
              // );
            },
          ),
          Container(
            margin: const EdgeInsets.only(right: 100),
            height: 50,
            width: 50,
            child: IconButton(
              icon: Image.asset('assets/coursera.png'),
              iconSize: 10,
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Divider(
            indent: 5,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
          // const SizedBox(
          //   height: 100,
          // ),
          TextButton.icon(
              onPressed: (() {
                // Desconectamos los sockets
                socketService.disconnect();
                PersistentNavBarNavigator.pushNewScreen(context,
                    withNavBar: false,
                    screen: LoginPage(),
                    pageTransitionAnimation:
                        PageTransitionAnimation.slideRight);
                AuthServices.deleteToken();
              }),
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              label: const Text(
                'Log out',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
//     return ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       separatorBuilder: (context, i) => Divider(
//         color: appTheme.primaryColorLight,
//       ),
//       itemCount: pageRoutes.length,
//       itemBuilder: (context, i) => ListTile(
//         leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
//         title: Text(pageRoutes[i].titulo),
//         trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => pageRoutes[i].page));
//         },
//       ),
//     );
//   }
// }
