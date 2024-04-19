
import 'dart:convert';

UserPersonalDetailsResponseModel userPersonalDetailsResponseModelFromJson(String str) => UserPersonalDetailsResponseModel.fromJson(json.decode(str));

String userPersonalDetailsResponseModelToJson(UserPersonalDetailsResponseModel data) => json.encode(data.toJson());

class UserPersonalDetailsResponseModel {
    UserPersonalDetailsResponseModel({
     required   this.message,
      required  this.isError,
      required  this.data,
    });

    String message;
    bool isError;
    UserPersonalDetailsResponseModelData data;

    factory UserPersonalDetailsResponseModel.fromJson(Map<String, dynamic> json) => UserPersonalDetailsResponseModel(
        message: json["message"],
        isError: json["isError"],
        data: UserPersonalDetailsResponseModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "isError": isError,
        "data": data.toJson(),
    };
}

class UserPersonalDetailsResponseModelData {
    UserPersonalDetailsResponseModelData({
      required  this.data,
    });

    DataData data;

    factory UserPersonalDetailsResponseModelData.fromJson(Map<String, dynamic> json) => UserPersonalDetailsResponseModelData(
        data: DataData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class DataData {
    DataData({
     required   this.personalDetails,
    });

    PersonalDetails personalDetails;

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        personalDetails: PersonalDetails.fromJson(json["personalDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "personalDetails": personalDetails.toJson(),
    };
}

class PersonalDetails {
    PersonalDetails({
     required   this.id,
     required   this.fullname,
     required   this.email,
      required  this.phone,
    required    this.registrationDate,
      required  this.addressFilled,
     required   this.privilegeCardEnabled,
      required  this.nomineeAdded,
      required  this.address,
     required   this.dob,
     required   this.fatherName,
    });

    String id;
    String fullname;
    String email;
    String phone;
    DateTime registrationDate;
    bool addressFilled;
    bool privilegeCardEnabled;
    bool nomineeAdded;
    Address address;
    String dob;
    String fatherName;

    factory PersonalDetails.fromJson(Map<String, dynamic> json) => PersonalDetails(
        id: json["_id"],
        fullname: json["fullname"],
        email: json["email"],
        phone: json["phone"],
        registrationDate: DateTime.parse(json["registrationDate"]),
        addressFilled: json["addressFilled"],
        privilegeCardEnabled: json["privilegeCardEnabled"],
        nomineeAdded: json["nomineeAdded"],
        address: Address.fromJson(json["address"]),
        dob: json["dob"],
        fatherName: json["fatherName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "registrationDate": registrationDate.toIso8601String(),
        "addressFilled": addressFilled,
        "privilegeCardEnabled": privilegeCardEnabled,
        "nomineeAdded": nomineeAdded,
        "address": address.toJson(),
        "dob": dob,
        "fatherName": fatherName,
    };
}

class Address {
    Address({
      required  this.streetAddress,
      required  this.pinCode,
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
