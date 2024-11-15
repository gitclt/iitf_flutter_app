// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) =>
    FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
  bool? status;
  String? message;
  List<FeedbackData>? data;

  FeedbackModel({
    this.status,
    this.message,
    this.data,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<FeedbackData>.from(
                json["data"]!.map((x) => FeedbackData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FeedbackData {
  String? id;
  int? stallId;
  String? addedOn;
  String? name;
  String? mobile;
  double? ratingValue;
  String? description;
  String? state;
  int? overallExperience;
  int? productOfferDisplay;
  String? date;

  FeedbackData({
    this.id,
    this.stallId,
    this.addedOn,
    this.name,
    this.mobile,
    this.ratingValue,
    this.description,
    this.state,
    this.overallExperience,
    this.productOfferDisplay,
    this.date,
  });

  factory FeedbackData.fromJson(Map<String, dynamic> json) => FeedbackData(
        id: json["id"],
        stallId: json["stall_id"],
        addedOn: json["added_on"],
        name: json["name"],
        mobile: json["mobile"],
        ratingValue: json["rating_value"]?.toDouble(),
        description: json["description"],
        state: json["state"],
        overallExperience: json["overall_experience"],
        productOfferDisplay: json["product_offer_display"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stall_id": stallId,
        "added_on": addedOn,
        "name": name,
        "mobile": mobile,
        "rating_value": ratingValue,
        "description": description,
        "state": state,
        "overall_experience": overallExperience,
        "product_offer_display": productOfferDisplay,
        "date": date,
      };
}
