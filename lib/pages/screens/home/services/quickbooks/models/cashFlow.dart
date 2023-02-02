// To parse this JSON data, do
//
//     final cashFlow = cashFlowFromJson(jsonString);

import 'dart:convert';

class CashFlow {
  CashFlow({
    required this.header,
    required this.columns,
    required this.rows,
  });

  Header header;
  Columns columns;
  CashFlowRows rows;

  factory CashFlow.fromRawJson(String str) =>
      CashFlow.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CashFlow.fromJson(Map<String, dynamic> json) => CashFlow(
        header: Header.fromJson(json["Header"]),
        columns: Columns.fromJson(json["Columns"]),
        rows: CashFlowRows.fromJson(json["Rows"]),
      );

  Map<String, dynamic> toJson() => {
        "Header": header.toJson(),
        "Columns": columns.toJson(),
        "Rows": rows.toJson(),
      };
}

class Columns {
  Columns({
    required this.column,
  });

  List<Column> column;

  factory Columns.fromRawJson(String str) => Columns.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Columns.fromJson(Map<String, dynamic> json) => Columns(
        column:
            List<Column>.from(json["Column"].map((x) => Column.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Column": List<dynamic>.from(column.map((x) => x.toJson())),
      };
}

class Column {
  Column({
    required this.colTitle,
    required this.colType,
    this.metaData,
  });

  String colTitle;
  String colType;
  List<Option>? metaData;

  factory Column.fromRawJson(String str) => Column.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Column.fromJson(Map<String, dynamic> json) => Column(
        colTitle: json["ColTitle"],
        colType: json["ColType"],
        metaData: json["MetaData"] == null
            ? []
            : List<Option>.from(
                json["MetaData"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ColTitle": colTitle,
        "ColType": colType,
        "MetaData": metaData == null
            ? []
            : List<dynamic>.from(metaData!.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    required this.name,
    required this.value,
  });

  String name;
  String value;

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        name: json["Name"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Value": value,
      };
}

class Header {
  Header({
    required this.time,
    required this.reportName,
    required this.dateMacro,
    required this.startPeriod,
    required this.endPeriod,
    required this.summarizeColumnsBy,
    required this.currency,
    required this.option,
  });

  DateTime time;
  String reportName;
  String dateMacro;
  DateTime startPeriod;
  DateTime endPeriod;
  String summarizeColumnsBy;
  String currency;
  List<Option> option;

  factory Header.fromRawJson(String str) => Header.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        time: DateTime.parse(json["Time"]),
        reportName: json["ReportName"],
        dateMacro: json["DateMacro"],
        startPeriod: DateTime.parse(json["StartPeriod"]),
        endPeriod: DateTime.parse(json["EndPeriod"]),
        summarizeColumnsBy: json["SummarizeColumnsBy"],
        currency: json["Currency"],
        option:
            List<Option>.from(json["Option"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Time": time.toIso8601String(),
        "ReportName": reportName,
        "DateMacro": dateMacro,
        "StartPeriod":
            "${startPeriod.year.toString().padLeft(4, '0')}-${startPeriod.month.toString().padLeft(2, '0')}-${startPeriod.day.toString().padLeft(2, '0')}",
        "EndPeriod":
            "${endPeriod.year.toString().padLeft(4, '0')}-${endPeriod.month.toString().padLeft(2, '0')}-${endPeriod.day.toString().padLeft(2, '0')}",
        "SummarizeColumnsBy": summarizeColumnsBy,
        "Currency": currency,
        "Option": List<dynamic>.from(option.map((x) => x.toJson())),
      };
}

class CashFlowRows {
  CashFlowRows({
    required this.row,
  });

  List<PurpleRow> row;

  factory CashFlowRows.fromRawJson(String str) =>
      CashFlowRows.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CashFlowRows.fromJson(Map<String, dynamic> json) => CashFlowRows(
        row:
            List<PurpleRow>.from(json["Row"].map((x) => PurpleRow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Row": List<dynamic>.from(row.map((x) => x.toJson())),
      };
}

class PurpleRow {
  PurpleRow({
    this.header,
    this.rows,
    this.summary,
    this.type,
    required this.group,
    this.colData,
  });

  SummaryClass? header;
  PurpleRows? rows;
  SummaryClass? summary;
  String? type;
  String group;
  List<HeaderColDatum>? colData;

  factory PurpleRow.fromRawJson(String str) =>
      PurpleRow.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleRow.fromJson(Map<String, dynamic> json) => PurpleRow(
        header: json["Header"] == null
            ? null
            : SummaryClass.fromJson(json["Header"]),
        rows: json["Rows"] == null ? null : PurpleRows.fromJson(json["Rows"]),
        summary: json["Summary"] == null
            ? null
            : SummaryClass.fromJson(json["Summary"]),
        type: json["type"],
        group: json["group"],
        colData: json["ColData"] == null
            ? []
            : List<HeaderColDatum>.from(
                json["ColData"]!.map((x) => HeaderColDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Header": header?.toJson(),
        "Rows": rows?.toJson(),
        "Summary": summary?.toJson(),
        "type": type,
        "group": group,
        "ColData": colData == null
            ? []
            : List<dynamic>.from(colData!.map((x) => x.toJson())),
      };
}

class HeaderColDatum {
  HeaderColDatum({
    required this.value,
  });

  String value;

  factory HeaderColDatum.fromRawJson(String str) =>
      HeaderColDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HeaderColDatum.fromJson(Map<String, dynamic> json) => HeaderColDatum(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class SummaryClass {
  SummaryClass({
    required this.colData,
  });

  List<HeaderColDatum> colData;

  factory SummaryClass.fromRawJson(String str) =>
      SummaryClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SummaryClass.fromJson(Map<String, dynamic> json) => SummaryClass(
        colData: List<HeaderColDatum>.from(
            json["ColData"].map((x) => HeaderColDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ColData": List<dynamic>.from(colData.map((x) => x.toJson())),
      };
}

class PurpleRows {
  PurpleRows({
    required this.row,
  });

  List<FluffyRow> row;

  factory PurpleRows.fromRawJson(String str) =>
      PurpleRows.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleRows.fromJson(Map<String, dynamic> json) => PurpleRows(
        row:
            List<FluffyRow>.from(json["Row"].map((x) => FluffyRow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Row": List<dynamic>.from(row.map((x) => x.toJson())),
      };
}

class FluffyRow {
  FluffyRow({
    this.colData,
    required this.type,
    required this.group,
    this.header,
    this.rows,
    this.summary,
  });

  List<HeaderColDatum>? colData;
  String type;
  String group;
  SummaryClass? header;
  FluffyRows? rows;
  SummaryClass? summary;

  factory FluffyRow.fromRawJson(String str) =>
      FluffyRow.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyRow.fromJson(Map<String, dynamic> json) => FluffyRow(
        colData: json["ColData"] == null
            ? []
            : List<HeaderColDatum>.from(
                json["ColData"]!.map((x) => HeaderColDatum.fromJson(x))),
        type: json["type"],
        group: json["group"],
        header: json["Header"] == null
            ? null
            : SummaryClass.fromJson(json["Header"]),
        rows: json["Rows"] == null ? null : FluffyRows.fromJson(json["Rows"]),
        summary: json["Summary"] == null
            ? null
            : SummaryClass.fromJson(json["Summary"]),
      );

  Map<String, dynamic> toJson() => {
        "ColData": colData == null
            ? []
            : List<dynamic>.from(colData!.map((x) => x.toJson())),
        "type": type,
        "group": group,
        "Header": header?.toJson(),
        "Rows": rows?.toJson(),
        "Summary": summary?.toJson(),
      };
}

class FluffyRows {
  FluffyRows({
    required this.row,
  });

  List<TentacledRow> row;

  factory FluffyRows.fromRawJson(String str) =>
      FluffyRows.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyRows.fromJson(Map<String, dynamic> json) => FluffyRows(
        row: List<TentacledRow>.from(
            json["Row"].map((x) => TentacledRow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Row": List<dynamic>.from(row.map((x) => x.toJson())),
      };
}

class TentacledRow {
  TentacledRow({
    required this.colData,
    required this.type,
  });

  List<PurpleColDatum> colData;
  String type;

  factory TentacledRow.fromRawJson(String str) =>
      TentacledRow.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TentacledRow.fromJson(Map<String, dynamic> json) => TentacledRow(
        colData: List<PurpleColDatum>.from(
            json["ColData"].map((x) => PurpleColDatum.fromJson(x))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "ColData": List<dynamic>.from(colData.map((x) => x.toJson())),
        "type": type,
      };
}

class PurpleColDatum {
  PurpleColDatum({
    required this.value,
    this.id,
  });

  String value;
  String? id;

  factory PurpleColDatum.fromRawJson(String str) =>
      PurpleColDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleColDatum.fromJson(Map<String, dynamic> json) => PurpleColDatum(
        value: json["value"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "id": id,
      };
}
