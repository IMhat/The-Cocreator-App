import 'dart:convert';

Transanction transactionFromJson(String str) =>
    Transanction.fromJson(json.decode(str));

String transactionToJson(Transanction data) => json.encode(data.toJson());

class Transanction {
  late String title;
  late int value;
  late String date;

  Transanction(
    this.title,
    this.value,
    this.date,
  );
  factory Transanction.fromJson(String str) =>
      Transanction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Transanction.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    value = map['value'];
    date = map['date'];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "value": value,
        "date": date,
      };

  Transanction copy() => Transanction(
        title,
        value,
        date,
      );

  then(Null Function(dynamic value) param0) {}
}
