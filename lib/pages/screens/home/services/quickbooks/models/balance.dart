import 'dart:convert';

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
  late String title;
  late int totalIncome;
  late int totalExpense;

  Balance(
    this.title,
    this.totalIncome,
    this.totalExpense,
  );
  factory Balance.fromJson(String str) => Balance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Balance.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    totalIncome = map['totalIncome'];
    totalExpense = map['totalExpense'];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "totalIncome": totalIncome,
        "totalExpense": totalExpense,
      };

  Balance copy() => Balance(
        title,
        totalIncome,
        totalExpense,
      );

  then(Null Function(dynamic value) param0) {}
}
