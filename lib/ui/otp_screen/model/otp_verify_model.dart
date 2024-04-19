// To parse this JSON data, do
//
//     final otpVerifyModel = otpVerifyModelFromJson(jsonString);

import 'dart:convert';

OtpVerifyModel otpVerifyModelFromJson(String str) => OtpVerifyModel.fromJson(json.decode(str));

String otpVerifyModelToJson(OtpVerifyModel data) => json.encode(data.toJson());

class OtpVerifyModel {
    OtpVerifyModel({
        required this.id,
        required this.otp,
    });

    String id;
    String otp;

    factory OtpVerifyModel.fromJson(Map<String, dynamic> json) => OtpVerifyModel(
        id: json["id"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "otp": otp,
    };
}
