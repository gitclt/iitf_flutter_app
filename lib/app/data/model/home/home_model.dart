// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  bool? status;
  String? message;
  List<HomeResponse>? data;

  HomeModel({
    this.status,
    this.message,
    this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<HomeResponse>.from(json["data"]!.map((x) => HomeResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class HomeResponse {
  int? productCount;
  int? stallCount;
  int? orderCount;
  int? approvedOrderCount;
  int? orderValue;
  int? categoryCount;

  HomeResponse({
    this.productCount,
    this.stallCount,
    this.orderCount,
    this.approvedOrderCount,
    this.orderValue,
    this.categoryCount,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        productCount: json["productCount"],
        stallCount: json["stallCount"],
        orderCount: json["orderCount"],
        approvedOrderCount: json["approved_order_Count"],
        orderValue: json["orderValue"],
        categoryCount: json["categoryCount"],
      );

  Map<String, dynamic> toJson() => {
        "productCount": productCount,
        "stallCount": stallCount,
        "orderCount": orderCount,
        "approved_order_Count": approvedOrderCount,
        "orderValue": orderValue,
        "categoryCount": categoryCount,
      };
}
