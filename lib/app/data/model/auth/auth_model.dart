// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  bool? status;
  String? message;
  String? data;

  AuthModel({
    this.status,
    this.message,
    this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}




// UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

// String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    bool? status;
    String? message;
    UserData? data;

    UserResponse({
        this.status,
        this.message,
        this.data,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class UserData {
    int? id;
    String? name;
    String? mobile;
    String? address;
    int? departmentId;
    String? department;
    String? description;

    UserData({
        this.id,
        this.name,
        this.mobile,
        this.address,
        this.departmentId,
        this.department,
        this.description,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        address: json["address"],
        departmentId: json["department_id"],
        department: json["department"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "address": address,
        "department_id": departmentId,
        "department": department,
        "description": description,
    };
}
