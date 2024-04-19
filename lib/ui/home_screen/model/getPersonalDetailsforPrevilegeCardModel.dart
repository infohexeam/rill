// To parse this JSON data, do
//
//     final userPersonalDetailsForPrivilegeCardResponseModel = userPersonalDetailsForPrivilegeCardResponseModelFromJson(jsonString);

import 'dart:convert';

UserPersonalDetailsForPrivilegeCardResponseModel userPersonalDetailsForPrivilegeCardResponseModelFromJson(String str) => UserPersonalDetailsForPrivilegeCardResponseModel.fromJson(json.decode(str));

String userPersonalDetailsForPrivilegeCardResponseModelToJson(UserPersonalDetailsForPrivilegeCardResponseModel data) => json.encode(data.toJson());

class UserPersonalDetailsForPrivilegeCardResponseModel {
    UserPersonalDetailsForPrivilegeCardResponseModel({
    required    this.message,
    required    this.isError,
     required   this.data,
    });

    String message;
    bool isError;
    UserPersonalDetailsForPrivilegeCardResponseModelData data;

    factory UserPersonalDetailsForPrivilegeCardResponseModel.fromJson(Map<String, dynamic> json) => UserPersonalDetailsForPrivilegeCardResponseModel(
        message: json["message"],
        isError: json["isError"],
        data: UserPersonalDetailsForPrivilegeCardResponseModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "isError": isError,
        "data": data.toJson(),
    };
}

class UserPersonalDetailsForPrivilegeCardResponseModelData {
    UserPersonalDetailsForPrivilegeCardResponseModelData({
      required  this.privilegeCard,
       required this.detailsFilled,
       required this.data,
    });

    bool privilegeCard;
    bool detailsFilled;
    DataData data;

    factory UserPersonalDetailsForPrivilegeCardResponseModelData.fromJson(Map<String, dynamic> json) => UserPersonalDetailsForPrivilegeCardResponseModelData(
        privilegeCard: json["privilegeCard"],
        detailsFilled: json["detailsFilled"],
        data: DataData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "privilegeCard": privilegeCard,
        "detailsFilled": detailsFilled,
        "data": data.toJson(),
    };
}

class DataData {
    DataData({
    required    this.id,
    required    this.fullname,
    required    this.addressFilled,
     required   this.privilegeCardEnabled,
     required   this.address,
      required  this.dob,
     required   this.fatherName,
    });

    String id;
    String fullname;
    bool addressFilled;
    bool privilegeCardEnabled;
    Address address;
    DateTime dob;
    String fatherName;

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["_id"],
        fullname: json["fullname"],
        addressFilled: json["addressFilled"],
        privilegeCardEnabled: json["privilegeCardEnabled"],
        address: Address.fromJson(json["address"]),
        dob: DateTime.parse(json["dob"]),
        fatherName: json["fatherName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "addressFilled": addressFilled,
        "privilegeCardEnabled": privilegeCardEnabled,
        "address": address.toJson(),
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "fatherName": fatherName,
    };
}

class Address {
    Address({
     required   this.streetAddress,
     required   this.pinCode,
     required   this.state,
     required   this.country,
    });

    String streetAddress;
    String pinCode;
    String state;
    String country;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        streetAddress: json["streetAddress"],
        pinCode: json["pinCode"],
        state: json["state"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "streetAddress": streetAddress,
        "pinCode": pinCode,
        "state": state,
        "country": country,
    };
}
