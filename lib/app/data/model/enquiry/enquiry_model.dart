// To parse this JSON data, do
//
//     final enquiryModel = enquiryModelFromJson(jsonString);

import 'dart:convert';

EnquiryModel enquiryModelFromJson(String str) =>
    EnquiryModel.fromJson(json.decode(str));

String enquiryModelToJson(EnquiryModel data) => json.encode(data.toJson());

class EnquiryModel {
  bool? status;
  String? message;
  List<EnquiryData>? data;

  EnquiryModel({
    this.status,
    this.message,
    this.data,
  });

  factory EnquiryModel.fromJson(Map<String, dynamic> json) => EnquiryModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<EnquiryData>.from(
                json["data"]!.map((x) => EnquiryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class EnquiryData {
  int? stallId;
  String? name;
  String? mobile;
  String? email;
  String? state;
  String? enquiry;
  List<Category>? categories;

  EnquiryData({
    this.stallId,
    this.name,
    this.mobile,
    this.email,
    this.state,
    this.enquiry,
    this.categories,
  });

  factory EnquiryData.fromJson(Map<String, dynamic> json) => EnquiryData(
        stallId: json["stall_id"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        state: json["state"],
        enquiry: json["enquiry"],
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stall_id": stallId,
        "name": name,
        "mobile": mobile,
        "email": email,
        "state": state,
        "enquiry": enquiry,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
