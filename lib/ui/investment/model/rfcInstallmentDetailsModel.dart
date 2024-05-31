// To parse this JSON data, do
//
//     final rfcInstallmentDetailsModel = rfcInstallmentDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

RfcInstallmentDetailsModel rfcInstallmentDetailsModelFromJson(String str) =>
    RfcInstallmentDetailsModel.fromJson(json.decode(str));

String rfcInstallmentDetailsModelToJson(RfcInstallmentDetailsModel data) =>
    json.encode(data.toJson());

class RfcInstallmentDetailsModel {
  RfcInstallmentDetailsModel({
    required this.message,
    required this.isError,
    required this.data,
  });

  String message;
  bool isError;
  Data data;

  factory RfcInstallmentDetailsModel.fromJson(Map<String, dynamic> json) =>
      RfcInstallmentDetailsModel(
        message: json["message"],
        isError: json["isError"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "isError": isError,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.rfcExists,
    required this.data,
  });

  bool rfcExists;
  List<Datum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rfcExists: json["rfcExists"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rfcExists": rfcExists,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.plan,
    required this.clubId,
    required this.paymentMethod,
    required this.contributionAmount,
    required this.paymentMode,
    required this.metadata,
    required this.payments,
    required this.privilegeCardInvoiceNo,
    required this.privilegeCardNumber,
    required this.privilegeCardExists,
    required this.completedAmount,
    required this.pendingAmount,
  });

  String id;
  String userId;
  String plan;
  String clubId;
  String paymentMethod;
  int contributionAmount;
  String paymentMode;
  Metadata metadata;
  List<Payment> payments;
  String privilegeCardInvoiceNo;
  String privilegeCardNumber;
  bool privilegeCardExists;
  int completedAmount;
  int pendingAmount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userId: json["userId"],
        plan: json["plan"],
        clubId: json["clubId"],
        paymentMethod: json["paymentMethod"],
        contributionAmount: json["contributionAmount"],
        paymentMode: json["paymentMode"],
        metadata: Metadata.fromJson(json["metadata"]),
        payments: List<Payment>.from(
            json["payments"].map((x) => Payment.fromJson(x))),
        privilegeCardInvoiceNo: json["privilegeCardInvoiceNo"].toString(),
        privilegeCardNumber: json["privilegeCardNumber"].toString(),
        privilegeCardExists: json["privilegeCardExists"],
        completedAmount: json["completedAmount"],
        pendingAmount: json["pendingAmount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "plan": plan,
        "clubId": clubId,
        "paymentMethod": paymentMethod,
        "contributionAmount": contributionAmount,
        "paymentMode": paymentMode,
        "metadata": metadata.toJson(),
        "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
        "privilegeCardInvoiceNo": privilegeCardInvoiceNo,
        "privilegeCardNumber": privilegeCardNumber,
        "privilegeCardExists": privilegeCardExists,
        "completedAmount": completedAmount,
        "pendingAmount": pendingAmount,
      };
}

class Metadata {
  Metadata({
    required this.rfc,
  });

  Rfc rfc;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        rfc: Rfc.fromJson(json["rfc"]),
      );

  Map<String, dynamic> toJson() => {
        "rfc": rfc.toJson(),
      };
}

class Rfc {
  Rfc({
    required this.baseAmount,
    required this.registrationFee,
  });

  int baseAmount;
  int registrationFee;

  factory Rfc.fromJson(Map<String, dynamic> json) => Rfc(
        baseAmount: json["baseAmount"],
        registrationFee: json["registrationFee"],
      );

  Map<String, dynamic> toJson() => {
        "baseAmount": baseAmount,
        "registrationFee": registrationFee,
      };
}

class Payment {
  Payment({
    required this.date,
    required this.amount,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.invoiceNumber,
    required this.paymentDate,
    required this.isDue,
  });

  DateTime date;
  int amount;
  String status;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String? invoiceNumber;
  String? paymentDate;
  bool isDue;
  String? DateChange() {
    // var formatterTime = DateFormat('kk:mm');
    var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
    var formatterDate = DateFormat('dd-MM-yyyy');
    var inputDate = inputFormat.parse(date.toString());

    String actualDate = formatterDate.format(inputDate);
    return actualDate.toString();
    }

  String? paymentDateChange() {
    if (paymentDate == null) {
      return '';
    } else {
      // var formatterTime = DateFormat('kk:mm');
      var inputFormat = DateFormat("yyyy-MM-ddThh:mm:ss");
      var formatterDate = DateFormat('dd-MM-yyyy');
      var inputDate = inputFormat.parse(paymentDate.toString());

      String actualDate = formatterDate.format(inputDate);
      return actualDate.toString();
    }
  }

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        date: DateTime.parse(json["date"]),
        amount: json["amount"],
        status: json["status"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        invoiceNumber: json["invoiceNumber"],
        paymentDate: json["paymentDate"],
        isDue: json["isDue"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "amount": amount,
        "status": status,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "invoiceNumber": invoiceNumber,
        "paymentDate": paymentDate,
        "isDue": isDue,
      };
}
