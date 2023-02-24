import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.online,
    required this.name,
    required this.email,
    required this.businessName,
    required this.business,
    required this.employees,
    required this.roles,
    this.uid,
  });

  bool online;
  String name;
  String email;
  String businessName;
  String business;
  String employees;
  String roles;
  String? uid;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        online: json["online"],
        name: json["name"],
        email: json["email"],
        businessName: json["businessName"],
        business: json["business"],
        employees: json["employees"],
        roles: json["roles"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "online": online,
        "name": name,
        "email": email,
        "businessName": businessName,
        "business": business,
        "employees": employees,
        "roles": roles,
        "uid": uid,
      };
}
