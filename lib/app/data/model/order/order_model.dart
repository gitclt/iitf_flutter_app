// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  bool? status;
  String? message;
  int? totalCount;
  int? totalPrice;
  List<OrderData>? data;

  OrderModel({
    this.status,
    this.message,
    this.totalCount,
    this.totalPrice,
    this.data,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        message: json["message"],
        totalCount: json["totalCount"],
        totalPrice: json["totalPrice"],
        data: json["data"] == null
            ? []
            : List<OrderData>.from(json["data"]!.map((x) => OrderData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "totalCount": totalCount,
        "totalPrice": totalPrice,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OrderData {
  int? id;
  String? date;
  String? customer;
  String? mobile;
  int? quantity;
  int? price;
  int? offerPrice;
  String? approveStatus;
  String? productName;
  int? stallId;
  String? image;
  int? catId;
  String? category;
  String? imageurl;

  OrderData({
    this.id,
    this.date,
    this.customer,
    this.mobile,
    this.quantity,
    this.price,
    this.offerPrice,
    this.approveStatus,
    this.productName,
    this.stallId,
    this.image,
    this.catId,
    this.category,
    this.imageurl,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"],
        date: json["date"],
        customer: json["customer"],
        mobile: json["mobile"],
        quantity: json["quantity"],
        price: json["price"],
        offerPrice: json["offer_price"],
        approveStatus: json["approve_status"],
        productName: json["product_name"],
        stallId: json["stall_id"],
        image: json["image"],
        catId: json["cat_id"],
        category: json["category"],
        imageurl: json["imageurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "customer": customer,
        "mobile": mobile,
        "quantity": quantity,
        "price": price,
        "offer_price": offerPrice,
        "approve_status": approveStatus,
        "product_name": productName,
        "stall_id": stallId,
        "image": image,
        "cat_id": catId,
        "category": category,
        "imageurl": imageurl,
      };
}
