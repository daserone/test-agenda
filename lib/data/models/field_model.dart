// To parse this JSON data, do
//
//     final fieldsModels = fieldsModelsFromJson(jsonString);

import 'dart:convert';

List<FieldsModels> fieldsModelsFromJson(String str) => List<FieldsModels>.from(
    json.decode(str).map((x) => FieldsModels.fromJson(x)));

String fieldsModelsToJson(List<FieldsModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FieldsModels {
  FieldsModels({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory FieldsModels.fromJson(Map<String, dynamic> json) => FieldsModels(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
