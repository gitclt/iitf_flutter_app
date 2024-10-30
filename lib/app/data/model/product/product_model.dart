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
  int? id;
  String? name;
  String? code;
  int? catId;
  int? price;
  int? offerPrice;
  int? stallId;
  int? visibility;
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
        id: json["id"],
        name: json["name"],
        code: json["code"],
        catId: json["cat_id"],
        price: json["price"],
        offerPrice: json["offer_price"],
        stallId: json["stall_id"],
        visibility: json["visibility"],
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
