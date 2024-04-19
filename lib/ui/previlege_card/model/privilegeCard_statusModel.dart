// To parse this JSON data, do
//
//     final privilegeCardStatusModel = privilegeCardStatusModelFromJson(jsonString);

import 'dart:convert';

PrivilegeCardStatusModel privilegeCardStatusModelFromJson(String str) => PrivilegeCardStatusModel.fromJson(json.decode(str));

String privilegeCardStatusModelToJson(PrivilegeCardStatusModel data) => json.encode(data.toJson());

class PrivilegeCardStatusModel {
    PrivilegeCardStatusModel({
     required   this.message,
      required  this.isError,
        this.data,
    });

    String message;
    bool isError;
    PrivilegeCardStatusModelData? data;

    factory PrivilegeCardStatusModel.fromJson(Map<String, dynamic> json) => PrivilegeCardStatusModel(
        message: json["message"],
        isError: json["isError"],
        data: PrivilegeCardStatusModelData.fromJson(json["data"]??{}),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "isError": isError,
        "data": data?.toJson(),
    };
}

class PrivilegeCardStatusModelData {
    PrivilegeCardStatusModelData({
        this.privilegeCard,
        this.detailsFilled,
        this.data,
    });

    bool? privilegeCard;
    bool? detailsFilled;
    DataData? data;

    factory PrivilegeCardStatusModelData.fromJson(Map<String, dynamic> json) => PrivilegeCardStatusModelData(
        privilegeCard: json["privilegeCard"]??false,
        detailsFilled: json["detailsFilled"]??false,
        data: DataData.fromJson(json["data"]??{}),
    );

    Map<String, dynamic> toJson() => {
        "privilegeCard": privilegeCard,
        "detailsFilled": detailsFilled,
        "data": data?.toJson(),
    };
}

class DataData {
    DataData({
        this.id,
        this.fullname,
        this.addressFilled,
        this.privilegeCardEnabled,
    });

    String? id;
    String? fullname;
    bool? addressFilled;
    bool? privilegeCardEnabled;

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["_id"]??'',
        fullname: json["fullname"]??'',
        addressFilled: json["addressFilled"]??false,
        privilegeCardEnabled: json["privilegeCardEnabled"]??false,
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "addressFilled": addressFilled,
        "privilegeCardEnabled": privilegeCardEnabled,
    };
}
