import 'dart:io';
import 'package:cocreator/models/usuarios.dart';
import 'package:cocreator/models/mensajes_response.dart';
import 'package:cocreator/pages/chat_page.dart';
import 'package:cocreator/pages/screens/socialmedia/widgets/card_channel.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:cocreator/services/socket_service.dart';
import 'package:cocreator/services/usuarios_service.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import '/../services/chat_service.dart';
import '/../widgets/chat_message.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserCard extends StatefulWidget {
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final usarioServices = UsuarioService();
  List<Usuario> usuarios = [];

  @override
  void initState() {
    _cargarUsuarioCard();
    super.initState();
  }

  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context);
    final socketServices = Provider.of<SocketService>(context);
    final usuario = authServices.usuario;
    // final ChatService = chatService.usuarioPara;
    return Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 20),
        width: 280,
        height: 93,
        //margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.topLeft,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  _usuariosListTitle(usuario),

                  // Text(usuario.name, style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  /*
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              
               const [
                Text('Startup BOSTON', style: TextStyle(fontSize: 20)),
              ],
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: TextButton(
                    onPressed: (() {}), child: const Text('View All')))
          ],
        ));
        */

  ListTile _usuariosListTitle(Usuario usuario) {
    return ListTile(
      title: Text(usuario.name),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        child: Text(usuario.name.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
      onTap: () {
        final chatService = Provider.of<ChatService>(context, listen: false);
        chatService.usuarioPara = usuario;
        // Navigator.pushNamed(context, 'chat');
        PersistentNavBarNavigator.pushNewScreen(context,
            withNavBar: false,
            screen: ChatPage(),
            pageTransitionAnimation: PageTransitionAnimation.slideUp);
      },
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuariosListTitle(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }

  _cargarUsuarioCard() async {
    usuarios = await usarioServices.getUsuarios();
    setState(() {});
    // monitor network fetch
    //await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
