class ResendOtpModel {
  ResendOtpModel({
    required this.message,
    required this.isError,
    required this.data,
  });
  late final String message;
  late final bool isError;
  late final Data data;
  
  ResendOtpModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    isError = json['isError'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['isError'] = isError;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.phone,
    required this.id,
    required this.otp,
  });
  late final String? phone;
  late final String? id;
  late final String? otp;
  
  Data.fromJson(Map<String, dynamic> json){
    phone = json['phone'];
    id = json['id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['phone'] = phone;
    _data['id'] = id;
    _data['otp'] = otp;
    return _data;
  }
}