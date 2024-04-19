// To parse this JSON data, do
//
//     final investmentStatusModel = investmentStatusModelFromJson(jsonString);

import 'dart:convert';

InvestmentStatusModel investmentStatusModelFromJson(String str) => InvestmentStatusModel.fromJson(json.decode(str));

String investmentStatusModelToJson(InvestmentStatusModel data) => json.encode(data.toJson());

class InvestmentStatusModel {
    InvestmentStatusModel({
     required   this.message,
     required   this.isError,
      required  this.data,
    });

    String message;
    bool isError;
    Data data;

    factory InvestmentStatusModel.fromJson(Map<String, dynamic> json) => InvestmentStatusModel(
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
    required    this.rfc,
      required  this.rpc,
    });

    bool rfc;
    bool rpc;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        rfc: json["rfc"],
        rpc: json["rpc"],
    );

    Map<String, dynamic> toJson() => {
        "rfc": rfc,
        "rpc": rpc,
    };
}
