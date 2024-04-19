// To parse this JSON data, do
//
//     final personalDetailsModel = personalDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

PersonalDetailsModel? personalDetailsModelFromJson(String str) => PersonalDetailsModel.fromJson(json.decode(str));

String personalDetailsModelToJson(PersonalDetailsModel? data) => json.encode(data!.toJson());

class PersonalDetailsModel {
  PersonalDetailsModel({
    this.message,
    this.isError,
    this.data,
  });

  String? message;
  bool? isError;
  PersonalDetailsModelData? data;

  factory PersonalDetailsModel.fromJson(Map<String, dynamic> json) => PersonalDetailsModel(
    message: json["message"],
    isError: json["isError"],
    data: PersonalDetailsModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "isError": isError,
    "data": data!.toJson(),
  };
}

class PersonalDetailsModelData {
  PersonalDetailsModelData({
    this.data,
  });

  DataData? data;

  factory PersonalDetailsModelData.fromJson(Map<String, dynamic> json) => PersonalDetailsModelData(
    data: DataData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class DataData {
  DataData({
    this.personalDetails,
  });

  PersonalDetails? personalDetails;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    personalDetails: PersonalDetails.fromJson(json["personalDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "personalDetails": personalDetails!.toJson(),
  };
}

class PersonalDetails {
  PersonalDetails({
    this.id,
    this.fullname,
    this.email,
    this.phone,
    this.registrationDate,
    this.addressFilled,
    this.nomineeAdded,
    this.privilegeCardEnabled,
    this.address,
    this.dob,
    this.fatherName,

    this.nomineeDetails,
  });

  String? id;
  String? fullname;
  String? email;
  String? phone;
  DateTime? registrationDate;
  bool? addressFilled;
  bool? nomineeAdded;
  bool? privilegeCardEnabled;
  Address? address;
  String? dob;
  String? fatherName;
  NomineeDetails? nomineeDetails;
  String? DateChange() {
    if(dob==null){
      return '';
    }
    var formatterDate = DateFormat('dd-MM-yyyy');
    // var formatterTime = DateFormat('kk:mm');
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(dob.toString());

    String actualDate = formatterDate.format(inputDate);
    return actualDate.toString();
  }
  factory PersonalDetails.fromJson(Map<String, dynamic> json) => PersonalDetails(
    id: json["_id"],
    fullname: json["fullname"],
    email: json["email"],
    phone: json["phone"],
    registrationDate: DateTime.parse(json["registrationDate"]),
    addressFilled: json["addressFilled"],
    nomineeAdded: json["nomineeAdded"],
    privilegeCardEnabled: json["privilegeCardEnabled"],
    address: Address.fromJson(json["address"]??{}),
    dob: json['dob'],
    fatherName: json["fatherName"],
    nomineeDetails: NomineeDetails.fromJson(json["nomineeDetails"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullname": fullname,
    "email": email,
    "phone": phone,
    "registrationDate": registrationDate?.toIso8601String(),
    "addressFilled": addressFilled,
    "nomineeAdded": nomineeAdded,
    "privilegeCardEnabled": privilegeCardEnabled,
    "address": address?.toJson(),
    'dob':dob,
    "fatherName": fatherName,
    "nomineeDetails": nomineeDetails?.toJson(),
  };
}

class Address {
  Address({
    this.streetAddress,
    this.pinCode,
    this.state,
    this.country,
  });

  String? streetAddress;
  String? pinCode;
  String? state;
  String? country;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    streetAddress: json["streetAddress"]??'',
    pinCode: json["pinCode"]??'',
    state: json["state"]??'',
    country: json["country"]??'',
  );

  Map<String, dynamic> toJson() => {
    "streetAddress": streetAddress,
    "pinCode": pinCode,
    "state": state,
    "country": country,
  };
}

class NomineeDetails {
  NomineeDetails({
    this.nomineeName,
    this.relation,
  });

  String? nomineeName;
  String? relation;

  factory NomineeDetails.fromJson(Map<String, dynamic> json) => NomineeDetails(
    nomineeName: json["nomineeName"]??'',
    relation: json["relation"]??'',
  );

  Map<String, dynamic> toJson() => {
    "nomineeName": nomineeName,
    "relation": relation,
  };
}
