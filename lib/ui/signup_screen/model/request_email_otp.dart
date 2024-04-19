// // To parse this JSON data, do
// //
// //     final requestEmailOtp = requestEmailOtpFromJson(jsonString);

// import 'dart:convert';

// RequestEmailOtp requestEmailOtpFromJson(String str) => RequestEmailOtp.fromJson(json.decode(str));

// String requestEmailOtpToJson(RequestEmailOtp data) => json.encode(data.toJson());

// class RequestEmailOtp {
//     RequestEmailOtp({
//        required this.id,
//        required this.email,
//       required  this.fullname,
//     });

//     String id;
//     String email;
//     String fullname;

//     factory RequestEmailOtp.fromJson(Map<String, dynamic> json) => RequestEmailOtp(
//         id: json["id"],
//         email: json["email"],
//         fullname: json["fullname"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "fullname": fullname,
//     };
// }
