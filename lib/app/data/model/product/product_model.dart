// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool? status;
  String? message;
  List<Product>? data;

  ProductModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Product {
  String? id;
  String? name;
  String? code;
  String? catId;
  String? price;
  String? offerPrice;
  String? stallId;
  String? visibility;
  String? description;
  String? category;
  String? image;
  String? imageurl;

  Product({
    this.id,
    this.name,
    this.code,
    this.catId,
    this.price,
    this.offerPrice,
    this.stallId,
    this.visibility,
    this.description,
    this.category,
    this.image,
    this.imageurl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"].toString(),
        name: json["name"].toString(),
        code: json["code"],
        catId: json["cat_id"].toString(),
        price: json["price"].toString(),
        offerPrice: json["offer_price"].toString(),
        stallId: json["stall_id"].toString(),
        visibility: json["visibility"].toString(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        imageurl: json["imageurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "cat_id": catId,
        "price": price,
        "offer_price": offerPrice,
        "stall_id": stallId,
        "visibility": visibility,
        "description": description,
        "category": category,
        "image": image,
        "imageurl": imageurl,
      };
}
