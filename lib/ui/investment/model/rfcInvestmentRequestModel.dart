// To parse this JSON data, do
//
//     final rfcInvestmentRequestModel = rfcInvestmentRequestModelFromJson(jsonString);

import 'dart:convert';

RfcInvestmentRequestModel? rfcInvestmentRequestModelFromJson(String str) => RfcInvestmentRequestModel.fromJson(json.decode(str));

String rfcInvestmentRequestModelToJson(RfcInvestmentRequestModel? data) => json.encode(data!.toJson());

class RfcInvestmentRequestModel {
    RfcInvestmentRequestModel({
        this.payments,
    });

    List<Payment?>? payments;

    factory RfcInvestmentRequestModel.fromJson(Map<String, dynamic> json) => RfcInvestmentRequestModel(
        payments: json["payments"] == null ? [] : List<Payment?>.from(json["payments"]!.map((x) => Payment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "payments": payments == null ? [] : List<dynamic>.from(payments!.map((x) => x!.toJson())),
    };
}

class Payment {
    Payment({
        this.amount,
        this.date,
    });

    int? amount;
    DateTime? date;

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    };
}
