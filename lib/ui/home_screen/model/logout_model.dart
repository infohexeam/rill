// To parse this JSON data, do
//
//     final logoutResponseModel = logoutResponseModelFromJson(jsonString);

import 'dart:convert';

LogoutResponseModel logoutResponseModelFromJson(String str) => LogoutResponseModel.fromJson(json.decode(str));

String logoutResponseModelToJson(LogoutResponseModel data) => json.encode(data.toJson());

class LogoutResponseModel {
    LogoutResponseModel({
       this.message,
        this.isError,
       required this.data,
    });

    String? message;
    bool? isError;
    Data data;

    factory LogoutResponseModel.fromJson(Map<String, dynamic> json) => LogoutResponseModel(
        message: json["message"],
        isError: json["isError"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "isError": isError,
        "data": data.toJson(),
    };
}

class Data {
    Data();

    factory Data.fromJson(Map<String, dynamic> json) => Data(
    );

    Map<String, dynamic> toJson() => {
    };
}
