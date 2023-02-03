import 'dart:io';

import 'package:cocreator/models/mensaje.dart';
import 'package:cocreator/models/usuario.dart';
import 'package:cocreator/services/auth_service.dart';
import 'package:cocreator/services/chat_service.dart';
import 'package:cocreator/services/socket_service.dart';
import 'package:cocreator/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  bool _estaEscribiendo = false;
  late ChatService chatService;
  late SocketService socketService;
  late AuthService authService;

  late List<ChatMessage> _messages = [];

  @override
  void initState() {
    chatService = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketService>(context, listen: false);
    authService = Provider.of<AuthService>(context, listen: false);

    // Escuchar mensajes
    socketService.socket.on('mensaje-persona', _escucharMensaje);

    // Cargar Mensajes

    _cargarHistorial(chatService.usuarioPara);

    super.initState();
  }

  void _cargarHistorial(Usuario usuarioID) async {
    List<Mensaje> chat = await chatService.getChat(usuarioID.uid);

    final history = chat.map((m) => ChatMessage(
          texto: m.mensaje,
          uid: m.de,
          animationController: AnimationController(
              vsync: this, duration: const Duration(milliseconds: 300))
            ..forward(),
        ));

    setState(() {
      _messages.insertAll(0, history);
    });
  }

  void _escucharMensaje(dynamic payload) {
    ChatMessage message = ChatMessage(
      uid: payload['de'],
      texto: payload['mensaje'],
      animationController: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 300)),
    );
    setState(() {
      _messages.insert(0, message);
      // Actualizar el controlador para que se vean los cambios
      message.animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final usuarioPara = chatService.usuarioPara;
    final String nombreUsuario =
        // ignore: unnecessary_null_comparison
        (usuarioPara == null ? "" : usuarioPara.nombre);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Column(
            children: [
              CircleAvatar(
                child: Text(nombreUsuario.substring(0, 2),
                    style: TextStyle(fontSize: 12)),
                backgroundColor: Colors.blue[100],
                maxRadius: 14,
              ),
              SizedBox(height: 3),
              Text(nombreUsuario,
                  style: TextStyle(color: Colors.black87, fontSize: 12))
            ],
          ),
        ),
        centerTitle: true,
        elevation: 1,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              ),
            ),
            Divider(height: 1),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto) {
                  setState(() {
                    if (texto.trim().length > 0) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration:
                    InputDecoration.collapsed(hintText: 'Enviar Mensaje'),
                focusNode: _focusNode,
              ),
            ),
            // Botón de Enviar
            Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: Platform.isIOS
                    ? CupertinoButton(
                        child: Text('Enviar'),
                        onPressed: () => _estaEscribiendo
                            ? _handleSubmit(_textController.text.trim())
                            : null)
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        // El IconTheme es para que se deshabilite el botón cuando quieras enviar algo vacío
                        child: IconTheme(
                          data: IconThemeData(color: Colors.blue[400]),
                          child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(Icons.send),
                              onPressed: () => _estaEscribiendo
                                  ? _handleSubmit(_textController.text.trim())
                                  : null),
                        ),
                      ))
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto) {
    // if(_textController.text.trim() != '') print(texto);
    _textController.clear();
    _focusNode.requestFocus();

    if (texto.trim() != '') {
      ChatMessage newMessage = ChatMessage(
        uid: authService.usuario.uid.toString(),
        texto: texto.trim(),
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 400)),
      );
      _messages.insert(0, newMessage);
      newMessage.animationController.forward();

      // Envío mensaje al socket service
      socketService.emit('mensaje-personal', {
        'de': authService.usuario.uid,
        'para': chatService.usuarioPara.uid,
        'mensaje': texto.trim()
      });
    }

    setState(() => _estaEscribiendo = false);
  }

  @override
  void dispose() {
    // TODO: cerrar los sockets
    for (ChatMessage message in _messages) {
      // Cierro todas las animaciones
      message.animationController.dispose();
    }
    // Desconectar socket de mensajes
    socketService.socket.off('mensaje-personal');
    super.dispose();
  }
}
