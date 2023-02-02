class Mensaje {
  
  String de;
  String para;
  String mensaje;
  DateTime createdAt;
  DateTime updatedAt;
  String uid;

  Mensaje({
    required this.de,
    required this.para,
    required this.mensaje,
    required this.createdAt,
    required this.updatedAt,
    required this.uid,
  });

  factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
      de: json["de"],
      para: json["para"],
      mensaje: json["mensaje"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
      "de": de,
      "para": para,
      "mensaje": mensaje,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "uid": uid,
  };
}