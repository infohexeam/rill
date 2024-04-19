// To parse this JSON data, do
//
//     final kycDocsModel = kycDocsModelFromJson(jsonString);

import 'dart:convert';

KycDocsModel? kycDocsModelFromJson(String str) => KycDocsModel.fromJson(json.decode(str));

String kycDocsModelToJson(KycDocsModel? data) => json.encode(data!.toJson());

class KycDocsModel {
    KycDocsModel({
        required this.message,
        required this.isError,
        required this.data,
    });

    String? message;
    bool? isError;
    KycDocsModelData? data;

    factory KycDocsModel.fromJson(Map<String, dynamic> json) => KycDocsModel(
        message: json["message"],
        isError: json["isError"],
        data:  KycDocsModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "isError": isError,
        "data": data,
    };
}

class KycDocsModelData {
    KycDocsModelData({
        required this.data,
    });

    DataData? data;

    factory KycDocsModelData.fromJson(Map<String, dynamic> json) => KycDocsModelData(
        data: DataData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data,
    };
}

class DataData {
    DataData({
        required this.id,
        required this.userId,
        required this.panStatus,
        required this.aadhaarStatus,
        required this.passportStatus,
        required this.bankStatus,
        required this.kycStatus,
        required this.panReasonsToReject,
        required this.aadhaarReasonsToReject,
        required this.bankReasonsToReject,
        required this.passportReasonsToReject,
        // required this.createdAt,
        // required this.updatedAt,
        required this.v,
         this.aadhaarDetails,
         this.panDetails,
         this.passportDetails,
         this.bankDetails,
    });

    String? id;
    String? userId;
    String? panStatus;
    String? aadhaarStatus;
    String? passportStatus;
    String? bankStatus;
    bool? kycStatus;
    List<dynamic>? panReasonsToReject;
    List<dynamic>? aadhaarReasonsToReject;
    List<dynamic>? bankReasonsToReject;
    List<dynamic>? passportReasonsToReject;
    // DateTime? createdAt;
    // DateTime? updatedAt;
    int? v;
    AadhaarDetails? aadhaarDetails;
    PanDetails? panDetails;
    PassportDetails? passportDetails;
    BankDetails? bankDetails;

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["_id"],
        userId: json["userId"],
        panStatus: json["panStatus"],
        aadhaarStatus: json["aadhaarStatus"],
        passportStatus: json["passportStatus"],
        bankStatus: json["bankStatus"],
        kycStatus: json["kycStatus"],
        panReasonsToReject: json["panReasonsToReject"] == null ? [] : json["panReasonsToReject"] == null ? [] : List<dynamic>.from(json["panReasonsToReject"]!.map((x) => x)),
        aadhaarReasonsToReject: json["aadhaarReasonsToReject"] == null ? [] : json["aadhaarReasonsToReject"] == null ? [] : List<dynamic>.from(json["aadhaarReasonsToReject"]!.map((x) => x)),
        bankReasonsToReject: json["bankReasonsToReject"] == null ? [] : json["bankReasonsToReject"] == null ? [] : List<dynamic>.from(json["bankReasonsToReject"]!.map((x) => x)),
        passportReasonsToReject: json["passportReasonsToReject"] == null ? [] : json["passportReasonsToReject"] == null ? [] : List<dynamic>.from(json["passportReasonsToReject"]!.map((x) => x)),
        // createdAt: json["createdAt"]??'',
        // updatedAt: json["updatedAt"]??"",
        v: json["__v"],
        aadhaarDetails: AadhaarDetails.fromJson(json["aadhaarDetails"]==null?{}:json["aadhaarDetails"]),
        panDetails: PanDetails.fromJson(json["panDetails"]==null?{}:json["panDetails"]),
        passportDetails: PassportDetails.fromJson(json["passportDetails"]==null?{}:json["passportDetails"]),
        bankDetails: BankDetails.fromJson(json["bankDetails"]==null?{}:json["bankDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "panStatus": panStatus,
        "aadhaarStatus": aadhaarStatus,
        "passportStatus": passportStatus,
        "bankStatus": bankStatus,
        "kycStatus": kycStatus,
        "panReasonsToReject": panReasonsToReject == null ? [] : panReasonsToReject == null ? [] : List<dynamic>.from(panReasonsToReject!.map((x) => x)),
        "aadhaarReasonsToReject": aadhaarReasonsToReject == null ? [] : aadhaarReasonsToReject == null ? [] : List<dynamic>.from(aadhaarReasonsToReject!.map((x) => x)),
        "bankReasonsToReject": bankReasonsToReject == null ? [] : bankReasonsToReject == null ? [] : List<dynamic>.from(bankReasonsToReject!.map((x) => x)),
        "passportReasonsToReject": passportReasonsToReject == null ? [] : passportReasonsToReject == null ? [] : List<dynamic>.from(passportReasonsToReject!.map((x) => x)),
        // "createdAt": createdAt,
        // "updatedAt": updatedAt,
        "__v": v,
        "aadhaarDetails": aadhaarDetails,
        "panDetails": panDetails,
        "passportDetails": passportDetails,
        "bankDetails": bankDetails,
    };
}

class AadhaarDetails {
    AadhaarDetails({
         this.aadhaarNumber,
         this.file,
    });

    String? aadhaarNumber;
    FileClass? file;

    factory AadhaarDetails.fromJson(Map<String, dynamic> json) => AadhaarDetails(
        aadhaarNumber: json["aadhaarNumber"],
        file:FileClass.fromJson(json["file"]??{}),
    );

    Map<String, dynamic> toJson() => {
        "aadhaarNumber": aadhaarNumber,
        "file": file,
    };
}

class FileClass {
    FileClass({
         this.fileUrl,
         this.mimeType,
         this.originalName,
         this.id,
        // required this.createdAt,
        // required this.updatedAt,
         this.downloadUrl,
    });

    String? fileUrl;
    String? mimeType;
    String? originalName;
    String? id;
    // DateTime? createdAt;
    // DateTime? updatedAt;
    String? downloadUrl;

    factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        fileUrl: json["fileURL"],
        mimeType: json["mimeType"],
        originalName: json["originalName"],
        id: json["_id"],
        // createdAt: json["createdAt"],
        // updatedAt: json["updatedAt"],
        downloadUrl: json["downloadURL"],
    );

    Map<String, dynamic> toJson() => {
        "fileURL": fileUrl,
        "mimeType": mimeType,
        "originalName": originalName,
        "_id": id,
        // "createdAt": createdAt,
        // "updatedAt": updatedAt,
        "downloadURL": downloadUrl,
    };
}

class BankDetails {
    BankDetails({
         this.accountNumber,
         this.name,
         this.ifscCode,
         this.file,
    });

    String? accountNumber;
    String? name;
    String? ifscCode;
    FileClass? file;

    factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        accountNumber: json["accountNumber"],
        name: json["name"],
        ifscCode: json["ifscCode"],
        file: FileClass.fromJson(json["file"]??{}),
    );

    Map<String, dynamic> toJson() => {
        "accountNumber": accountNumber,
        "name": name,
        "ifscCode": ifscCode,
        "file": file,
    };
}

class PanDetails {
    PanDetails({
         this.panNumber,
         this.file,
    });

    String? panNumber;
    FileClass? file;

    factory PanDetails.fromJson(Map<String, dynamic> json) => PanDetails(
        panNumber: json["panNumber"],
        file:FileClass.fromJson(json["file"]??{}),
    );

    Map<String, dynamic> toJson() => {
        "panNumber": panNumber,
        "file": file,
    };
}

class PassportDetails {
    PassportDetails({
         this.passportNumber,
         this.file,
    });

    String? passportNumber;
    FileClass? file;

    factory PassportDetails.fromJson(Map<String, dynamic> json) => PassportDetails(
        passportNumber: json["passportNumber"],
        file:FileClass.fromJson(json["file"]??{}),
    );

    Map<String, dynamic> toJson() => {
        "passportNumber": passportNumber,
        "file": file,
    };
}
