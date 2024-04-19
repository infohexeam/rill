import 'dart:convert';

SendFirebaseToken SendFirebaseTokenFromJson(String str) => SendFirebaseToken.fromJson(json.decode(str));

String SendFirebaseTokenToJson(SendFirebaseToken data) => json.encode(data.toJson());

class SendFirebaseToken {
  SendFirebaseToken({
    required this.firebaseToken,
  });

  String firebaseToken;

  factory SendFirebaseToken.fromJson(Map<String, dynamic> json) => SendFirebaseToken(
    firebaseToken: json["firebaseToken"],
  );

  Map<String, dynamic> toJson() => {
    "firebaseToken": firebaseToken,
  };
}