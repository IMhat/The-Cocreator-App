import 'dart:convert';

class Question {
  late String title;
  late String description;
  late String item;

  Question(
    this.title,
    this.description,
    this.item,
  );
  factory Question.fromJson(String str) => Question.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Question.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    description = map['description'];
    item = map['item'];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "item": item,
      };

  Question copy() => Question(
        title,
        description,
        item,
      );

  then(Null Function(dynamic value) param0) {}
}
