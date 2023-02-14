import 'package:cocreator/routes/routes.dart';
import 'package:cocreator/services/auth_service.dart';

import 'package:cocreator/services/chat_service.dart';
import 'package:cocreator/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServices()),
        ChangeNotifierProvider(create: (_) => SocketService()),
        ChangeNotifierProvider(create: (_) => ChatService())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        initialRoute: 'loading',
        // initialRoute: 'loading',
        // onGenerateRoute: (settings) => generateRoute(settings),
        routes: appRoutes,
      ),
    );
  }
}
