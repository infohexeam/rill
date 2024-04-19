// To parse this JSON data, do
//
//     final kycPersonalDetailsRequestModel = kycPersonalDetailsRequestModelFromJson(jsonString);

import 'dart:convert';

KycPersonalDetailsRequestModel kycPersonalDetailsRequestModelFromJson(String str) => KycPersonalDetailsRequestModel.fromJson(json.decode(str));

String kycPersonalDetailsRequestModelToJson(KycPersonalDetailsRequestModel data) => json.encode(data.toJson());

class KycPersonalDetailsRequestModel {
    KycPersonalDetailsRequestModel({
     required   this.fatherName,
      required     this.streetAddress,
     required    this.pinCode,
    required    this.state,
     required   this.country,
      required  this.nomineeName,
      required  this.relation,
        required  this.dob,
    });

    String fatherName;
    String streetAddress;
    String pinCode;
    String state;
    String country;
    String nomineeName;
    String relation;
    String dob;
    factory KycPersonalDetailsRequestModel.fromJson(Map<String, dynamic> json) => KycPersonalDetailsRequestModel(
        fatherName: json["fatherName"],
        streetAddress: json["streetAddress"],
        pinCode: json["pinCode"],
        state: json["state"],
        country: json["country"],
        nomineeName: json["nomineeName"],
        relation: json["relation"],
        dob: json["dob"],
    );

    Map<String, dynamic> toJson() => {
        "fatherName": fatherName,
        "streetAddress": streetAddress,
        "pinCode": pinCode,
        "state": state,
        "country": country,
        "nomineeName": nomineeName,
        "relation": relation,
        "dob": dob,
    };
}
