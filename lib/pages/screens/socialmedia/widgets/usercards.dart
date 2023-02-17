import 'dart:io';
import 'package:cocreator/models/usuarios.dart';
import 'package:cocreator/models/mensajes_response.dart';
import 'package:cocreator/pages/chat_page.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool _isFollowing = false;

  final usarioServices = UsuarioService();
  List<Usuario> usuarios = [];

  @override
  void initState() {
    _cargarUsuarioCard();
    super.initState();
  }

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final ChatService = chatService.usuarioPara;
    return Container(
      child: _listViewUsuarios(),
    );
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
        // final chatService = Provider.of<ChatService>(context, listen: false);
        // chatService.usuarioPara = usuario;
        // // Navigator.pushNamed(context, 'chat');
        // PersistentNavBarNavigator.pushNewScreen(context,
        //     withNavBar: false,
        //     screen: ChatPage(),
        //     pageTransitionAnimation: PageTransitionAnimation.slideUp);
      },
    );
  }

  ListView _listViewUsuarios() {
    return ListView.builder(
        //physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        //itemBuilder: (_, i) => _usuariosListTitle(usuarios[i]),
        //separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            // child: SingleQuestion(
            //   question: questions![index],
            //   isSelected: false,
            // ),
            child: Container(
              height: 90,
              width: 250,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 09),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 6,
                    blurRadius: 9,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Container(
                          //   padding: const EdgeInsets.only(top: 5),
                          //   width: 10,
                          //   height: 10,
                          //   decoration: BoxDecoration(
                          //       color: const Color.fromARGB(166, 239, 41, 27),
                          //       border: Border.all(
                          //           color: const Color.fromARGB(255, 255, 251, 251)),
                          //       borderRadius: BorderRadius.circular(50)),
                          // ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 0),
                            child: CircleAvatar(
                              radius: 25,
                              child: Text(usuarios[index].name.substring(0, 2)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10, top: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                  //width: 235,
                                  height: 30,
                                  child: Text(
                                    usuarios[index].name.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 7, 0, 0),
                                        fontWeight: FontWeight.bold),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  //argin: EdgeInsets.symmetric(horizontal: 10),
                                  child: SizedBox(
                                    //width: 235,
                                    //height: 35,
                                    child: Text(
                                      '@${usuarios[index].name.toString()}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                              255, 151, 151, 151)),
                                      /*const TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 151, 151, 151),
                                          fontWeight: FontWeight.bold),*/
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  //argin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width: 60,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                side: const BorderSide(
                                                    width: 2, // the thickness
                                                    color: Colors
                                                        .blue // the color of the border
                                                    )),
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.blue,
                                            ),
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      SizedBox(
                                          width: 85,
                                          child: ElevatedButton(
                                            onPressed: _toggleFollow,
                                            child: Text(
                                              _isFollowing
                                                  ? 'Followed'
                                                  : 'Follow',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // SizedBox(
                          //     child: Container(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: isItemSelected
                          //       ? const Icon(
                          //           Icons.circle_outlined,
                          //           size: 35,
                          //           color: Colors.blue,
                          //         )
                          //       : const Icon(
                          //           Icons.circle_outlined,
                          //           size: 35,
                          //           color: Color.fromARGB(
                          //               255, 197, 197, 197),
                          //         ),
                          // )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
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
