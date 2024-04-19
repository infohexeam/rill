// To parse this JSON data, do
//
//     final privilegeCardRequestModel = privilegeCardRequestModelFromJson(jsonString);

import 'dart:convert';

PrivilegeCardRequestModel privilegeCardRequestModelFromJson(String str) => PrivilegeCardRequestModel.fromJson(json.decode(str));

String privilegeCardRequestModelToJson(PrivilegeCardRequestModel data) => json.encode(data.toJson());

class PrivilegeCardRequestModel {
    PrivilegeCardRequestModel({
     required   this.fatherName,
      required  this.streetAddress,
      required  this.state,
      required  this.country,
      required  this.pinCode,
      required  this.dob,
    });

    String fatherName;
    String streetAddress;
    String state;
    String country;
    String pinCode;
    String dob;

    factory PrivilegeCardRequestModel.fromJson(Map<String, dynamic> json) => PrivilegeCardRequestModel(
        fatherName: json["fatherName"],
        streetAddress: json["streetAddress"],
        state: json["state"],
        country: json["country"],
        pinCode: json["pinCode"],
        dob: json["dob"],
    );

    Map<String, dynamic> toJson() => {
        "fatherName": fatherName,
        "streetAddress": streetAddress,
        "state": state,
        "country": country,
        "pinCode": pinCode,
        "dob":dob
    };
}
