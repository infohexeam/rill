// // To parse this JSON data, do
// //
// //     final emailVerifyModel = emailVerifyModelFromJson(jsonString);

// import 'dart:convert';

// EmailVerifyModel emailVerifyModelFromJson(String str) => EmailVerifyModel.fromJson(json.decode(str));

// String emailVerifyModelToJson(EmailVerifyModel data) => json.encode(data.toJson());

// class EmailVerifyModel {
//     EmailVerifyModel({
//        required this.id,
//        required this.otp,
//     });

//     String id;
//     String otp;

//     factory EmailVerifyModel.fromJson(Map<String, dynamic> json) => EmailVerifyModel(
//         id: json["id"],
//         otp: json["otp"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "otp": otp,
//     };
// }
