// class EmailVerifyReceiveModel {
//   EmailVerifyReceiveModel({
//     required this.message,
//     required this.isError,
//     required this.data,
//   });
//   late final String? message;
//   late final bool isError;
//   late final Data data;
  
//   EmailVerifyReceiveModel.fromJson(Map<String, dynamic> json){
//     message = json['message'];
//     isError = json['isError'];
//     data = Data.fromJson(json['data']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['message'] = message;
//     _data['isError'] = isError;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.token,
//     required this.fullname,
//     required this.email,
//     required this.phone,
//     required this.isLogined,
//   });
//   late final String? token;
//   late final String? fullname;
//   late final String? email;
//   late final String? phone;
//   late final bool? isLogined;
  
//   Data.fromJson(Map<String, dynamic> json){
//     token = json['token'];
//     fullname = json['fullname'];
//     email = json['email'];
//     phone = json['phone'];
//     isLogined = json['isLogined'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['token'] = token;
//     _data['fullname'] = fullname;
//     _data['email'] = email;
//     _data['phone'] = phone;
//     _data['isLogined'] = isLogined;
//     return _data;
//   }
// }