// class EmailOtpReceiveModel {
//   EmailOtpReceiveModel({
//     required this.message,
//     required this.isError,
//     required this.data,
//   });
//   late final String message;
//   late final bool isError;
//   late final Data data;
  
//   EmailOtpReceiveModel.fromJson(Map<String, dynamic> json){
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
//     required this.email,
//     required this.id,
//     required this.otp,
//   });
//   late final String? email;
//   late final String? id;
//   late final String? otp;
  
//   Data.fromJson(Map<String, dynamic> json){
//     email = json['email'];
//     id = json['id'];
//     otp = json['otp'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['email'] = email;
//     _data['id'] = id;
//     _data['otp'] = otp;
//     return _data;
//   }
// }