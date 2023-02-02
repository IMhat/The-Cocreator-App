import 'dart:convert';

class AccountsConnect {
  late String title;
  late String image;
  late String item;

  AccountsConnect(
    this.title,
    this.image,
    this.item,
  );
  factory AccountsConnect.fromJson(String str) =>
      AccountsConnect.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  AccountsConnect.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    image = map['image'];
    item = map['item'];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "image": image,
        "item": item,
      };

  AccountsConnect copy() => AccountsConnect(
        title,
        image,
        item,
      );

  then(Null Function(dynamic value) param0) {}
}
