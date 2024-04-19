
import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
    OtpModel({
        required this.phone,
         this.fullname,
    });

    String phone;
    String? fullname;

    factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        phone: json["phone"],
        fullname: json["fullname"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "fullname": fullname,
    };
}