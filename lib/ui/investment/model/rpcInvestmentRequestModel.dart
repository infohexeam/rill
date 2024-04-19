// To parse this JSON data, do
//
//     final rpcInvestmentRequestModel = rpcInvestmentRequestModelFromJson(jsonString);

import 'dart:convert';

RpcInvestmentRequestModel? rpcInvestmentRequestModelFromJson(String str) => RpcInvestmentRequestModel.fromJson(json.decode(str));

String rpcInvestmentRequestModelToJson(RpcInvestmentRequestModel? data) => json.encode(data!.toJson());

class RpcInvestmentRequestModel {
    RpcInvestmentRequestModel({
        this.contributionAmount,
        this.payments,
    });

    int? contributionAmount;
    List<Payment?>? payments;

    factory RpcInvestmentRequestModel.fromJson(Map<String, dynamic> json) => RpcInvestmentRequestModel(
        contributionAmount: json["contributionAmount"],
        payments: json["payments"] == null ? [] : List<Payment?>.from(json["payments"]!.map((x) => Payment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "contributionAmount": contributionAmount,
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
