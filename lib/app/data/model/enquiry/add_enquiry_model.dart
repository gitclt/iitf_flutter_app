// To parse this JSON data, do
//
//     final enqAddModel = enqAddModelFromJson(jsonString);

import 'dart:convert';

List<EnqAddModel> enqAddModelFromJson(String str) => List<EnqAddModel>.from(
    json.decode(str).map((x) => EnqAddModel.fromJson(x)));

String enqAddModelToJson(List<EnqAddModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EnqAddModel {
  int? stallId;
  String? name;
  String? mobile;
  String? email;
  String? state;
  String? enquiry;
  String? catIds;

  EnqAddModel({
    this.stallId,
    this.name,
    this.mobile,
    this.email,
    this.state,
    this.enquiry,
    this.catIds,
  });

  factory EnqAddModel.fromJson(Map<String, dynamic> json) => EnqAddModel(
        stallId: json["stall_id"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        state: json["state"],
        enquiry: json["enquiry"],
        catIds: json["cat_ids"],
      );

  Map<String, dynamic> toJson() => {
        "stall_id": stallId,
        "name": name,
        "mobile": mobile,
        "email": email,
        "state": state,
        "enquiry": enquiry,
        "cat_ids": catIds,
      };
}
