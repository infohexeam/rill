// To parse this JSON data, do
//
//     final raiseTicketModel = raiseTicketModelFromJson(jsonString);

import 'dart:convert';

RaiseTicketModel raiseTicketModelFromJson(String str) => RaiseTicketModel.fromJson(json.decode(str));

String raiseTicketModelToJson(RaiseTicketModel data) => json.encode(data.toJson());

class RaiseTicketModel {
    RaiseTicketModel({
        required this.type,
        required this.instalmentId,
    });

    String type;
    String instalmentId;

    factory RaiseTicketModel.fromJson(Map<String, dynamic> json) => RaiseTicketModel(
        type: json["type"],
        instalmentId: json["instalmentId"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "instalmentId": instalmentId,
    };
}
