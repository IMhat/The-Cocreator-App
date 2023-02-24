import 'package:cocreator/models/usuarios.dart';
import 'package:cocreator/pages/chat_page.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:cocreator/services/chat_service.dart';
import 'package:cocreator/services/socket_service.dart';
import 'package:cocreator/services/usuarios_service.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/custom_drawer.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int counter = 16;
  final usarioServices = UsuarioService();
  List<Usuario> usuarios = [];

  @override
  void initState() {
    _cargarUsurios();
    super.initState();
  }

  // final usuarios = [
  //   Usuario(uid: '1', name: 'Eduardo', email: 'katiro@gamil.com', online: true),
  //   Usuario(uid: '2', name: 'Caixto', email: 'Ulloa@gamil.com', online: true),
  //   Usuario(uid: '3', name: 'Dayern', email: 'gomez@gamil.com', online: true),
  //   Usuario(uid: '4', name: 'Necio', email: 'neio@gamil.com', online: false),
  // ];
  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context);
    final socketServices = Provider.of<SocketService>(context);
    final usuario = authServices.usuario;
    return Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.black,
          child: CustomDrawer(),
        ),

        // appBar: AppBar(actions: [
        //   TextButton.icon(
        //     icon: const Icon(
        //       Icons.add,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       // Navigator.pushNamed(
        //       //   context,
        //       //   '/crear-empresas',
        //       // );
        //       context.go('/crear-empresas');
        //     },
        //     label: const Text(
        //       'Create Company',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   )
        // ], title: Text('Hi User')

        //     //actions: const [IaIcon()],
        //     ),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SizedBox(width: 120, child: (Image.asset('assets/logo3.png'))),
          // title: Row(
          //   children: [
          //     SizedBox(
          //       width: 80,
          //     ),
          //     SizedBox(
          //       child: Container(
          //         child: Text(
          //           "Cocreator",
          //           style: TextStyle(
          //               fontSize: 30,
          //               fontWeight: FontWeight.w600,
          //               color: Colors.black),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 100,
          //     ),
          //     SizedBox(
          //       child: Container(
          //         alignment: Alignment.centerLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Icon(
          //             Icons.notifications,
          //             color: Colors.black,
          //             size: 30,
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          flexibleSpace: Container(
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
          ),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(top: 1, bottom: 0, right: 5),
                  child: IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        setState(() {
                          counter = 1;
                        });
                      }),
                ),
                counter != 0
                    ? Positioned(
                        right: 11,
                        top: 11,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            '$counter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ],
        ),
        /* appBar: AppBar(
          title: Text(
            usuario.name,
            style: TextStyle(color: Colors.black),
          ),
          elevation: 1,
          backgroundColor: Color.fromARGB(156, 74, 102, 206),
          leading: IconButton(
            icon: Image.asset('assets/tag-logo.png'),
            onPressed: () {},
            // onPressed: () {
            //   socketServices.disconnect();
            //   Navigator.pushReplacementNamed(context, 'login');
            //   AuthServices.deleteToken();
            // },
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: (socketServices.serverStatus == ServerStatus.Online)
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    )
                  : Icon(
                      Icons.offline_bolt,
                      color: Colors.red,
                    ),
            )
          ],
        ),
        */
        body: /*SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsurios,
        header: WaterDropHeader(
          complete: Icon(
            Icons.check,
            color: Colors.blue[400],
          ),
          waterDropColor: Colors.blue[400]!,
        ),
        */
            SingleChildScrollView(
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
                    Color.fromRGBO(143, 200, 241, 1),
                    // Color.fromARGB(255, 94, 129, 253),
                    Color.fromARGB(255, 70, 106, 234)
                  ])),
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                _title(),
                const SizedBox(
                  width: 45,
                ),
                ChipsChoise(),
                SizedBox(
                  height: 700,
                  child: _listViewUsuarios(),
                )
              ])), //_listViewUsuarios()),
        ));
  }

  int tag = 1;
  List<String> options = [
    'All',
    'New Chats',
    'Open Chats',
  ];
  Widget ChipsChoise() {
    return ChipsChoice<int>.single(
      value: tag,
      onChanged: (val) => setState(() => tag = val),
      choiceStyle: C2ChipStyle.filled(),
      wrapped: true,
      choiceItems: C2Choice.listFrom<int, String>(
        source: options,
        value: (i, v) => i,
        label: (i, v) => v,
      ),
    );
  }

  Widget _title() {
    return Container(
        alignment: Alignment.topCenter,
        child: const SizedBox(
          child: Text('Chats',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ));
  }

  ListView _listViewUsuarios() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuariosListTitle(usuarios[i]),
        itemCount: usuarios.length);
  }

  Card _usuariosListTitle(Usuario usuario) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Color.fromARGB(255, 241, 241, 241),
          ),
        ),
        elevation: 10,
        shadowColor: Color.fromARGB(255, 26, 25, 25),
        child: ListTile(
          title: Text(
            usuario.name,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(usuario.email),
          leading: CircleAvatar(
            child: Text(usuario.name.substring(0, 2)),
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: usuario.online ? Colors.green[300] : Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onTap: () {
            final chatService =
                Provider.of<ChatService>(context, listen: false);
            chatService.usuarioPara = usuario;
            // Navigator.pushNamed(context, 'chat');
            PersistentNavBarNavigator.pushNewScreen(context,
                withNavBar: false,
                screen: ChatPage(),
                pageTransitionAnimation: PageTransitionAnimation.slideUp);
          },
        ));
  }

  _cargarUsurios() async {
    usuarios = await usarioServices.getUsuarios();
    setState(() {});
    // monitor network fetch
    //await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
