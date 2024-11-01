// To parse this JSON data, do
//
//     final appversionModel = appversionModelFromJson(jsonString);

import 'dart:convert';

List<AppversionModel> appversionModelFromJson(String str) =>
    List<AppversionModel>.from(
        json.decode(str).map((x) => AppversionModel.fromJson(x)));

String appversionModelToJson(List<AppversionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppversionModel {
  int? id;
  String? versionName;
  String? versionCode;
  DateTime? addedOn;

  AppversionModel({
    this.id,
    this.versionName,
    this.versionCode,
    this.addedOn,
  });

  factory AppversionModel.fromJson(Map<String, dynamic> json) =>
      AppversionModel(
        id: json["id"],
        versionName: json["version_name"],
        versionCode: json["version_code"],
        addedOn:
            json["added_on"] == null ? null : DateTime.parse(json["added_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version_name": versionName,
        "version_code": versionCode,
        "added_on": addedOn?.toIso8601String(),
      };
}
