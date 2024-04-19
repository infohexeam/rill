// To parse this JSON data, do
//
//     final resendOtpRequestModel = resendOtpRequestModelFromJson(jsonString);

import 'dart:convert';

ResendOtpRequestModel resendOtpRequestModelFromJson(String str) => ResendOtpRequestModel.fromJson(json.decode(str));

String resendOtpRequestModelToJson(ResendOtpRequestModel data) => json.encode(data.toJson());

class ResendOtpRequestModel {
    ResendOtpRequestModel({
      required  this.id,
    });

    String id;

    factory ResendOtpRequestModel.fromJson(Map<String, dynamic> json) => ResendOtpRequestModel(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
