// To parse this JSON data, do
//
//     final ratingAddModel = ratingAddModelFromJson(jsonString);

import 'dart:convert';

List<RatingAddModel> ratingAddModelFromJson(String str) =>
    List<RatingAddModel>.from(
        json.decode(str).map((x) => RatingAddModel.fromJson(x)));

String ratingAddModelToJson(List<RatingAddModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RatingAddModel {
  int? stallId;
  String? name;
  String? mobile;
  String? description;
  String? state;
  String? overallExperience;
  String? productOfferDisplay;
  DateTime? date;

  RatingAddModel({
    this.stallId,
    this.name,
    this.mobile,
    this.description,
    this.state,
    this.overallExperience,
    this.productOfferDisplay,
    this.date,
  });

  factory RatingAddModel.fromJson(Map<String, dynamic> json) => RatingAddModel(
        stallId: json["stall_id"],
        name: json["name"],
        mobile: json["mobile"],
        description: json["description"],
        state: json["state"],
        overallExperience: json["overall_experience"],
        productOfferDisplay: json["product_offer_display"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "stall_id": stallId,
        "name": name,
        "mobile": mobile,
        "description": description,
        "state": state,
        "overall_experience": overallExperience,
        "product_offer_display": productOfferDisplay,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };
}
