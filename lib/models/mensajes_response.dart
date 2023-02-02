import 'dart:convert';

import 'package:cocreator/models/mensaje.dart';

MensajesResponse mensajesResponseFromJson(String str) => MensajesResponse.fromJson(json.decode(str));

String mensajesResponseToJson(MensajesResponse data) => json.encode(data.toJson());

class MensajesResponse {

  bool ok;
  List<Mensaje> mensajes;

  MensajesResponse({
    required this.ok,
    required this.mensajes,
  });

  factory MensajesResponse.fromJson(Map<String, dynamic> json) => MensajesResponse(
    ok: json["ok"],
    mensajes: List<Mensaje>.from(json["mensajes"].map((x) => Mensaje.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "mensajes": List<dynamic>.from(mensajes.map((x) => x.toJson())),
  };
}


