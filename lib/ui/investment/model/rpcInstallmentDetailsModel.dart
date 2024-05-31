// To parse this JSON data, do
//
//     final rpcInstallmentDetailsModel = rpcInstallmentDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

RpcInstallmentDetailsModel rpcInstallmentDetailsModelFromJson(String str) =>
    RpcInstallmentDetailsModel.fromJson(json.decode(str));

String rpcInstallmentDetailsModelToJson(RpcInstallmentDetailsModel data) =>
    json.encode(data.toJson());

class RpcInstallmentDetailsModel {
  RpcInstallmentDetailsModel({
    required this.message,
    required this.isError,
    required this.data,
  });

  String message;
  bool isError;
  Data data;

  factory RpcInstallmentDetailsModel.fromJson(Map<String, dynamic> json) =>
      RpcInstallmentDetailsModel(
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
    required this.rpcExists,
    required this.data,
  });

  bool rpcExists;
  List<Datum> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rpcExists: json["rpcExists"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rpcExists": rpcExists,
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
    required this.payments,
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
  List<Payment> payments;
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
        payments: List<Payment>.from(
            json["payments"].map((x) => Payment.fromJson(x))),
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
        "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
        "completedAmount": completedAmount,
        "pendingAmount": pendingAmount,
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
    this.invoiceNumber,
    this.paymentDate,
    required this.isDue,
  });

  DateTime date;
  int amount;
  String status;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String? invoiceNumber;
  DateTime? paymentDate;
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
      var inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
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
        paymentDate: json["paymentDate"] == null
            ? null
            : DateTime.parse(json["paymentDate"]),
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
        "paymentDate": paymentDate?.toIso8601String(),
        "isDue": isDue,
      };
}
