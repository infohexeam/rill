
class IsPrivilegeCardExistsModel {
  IsPrivilegeCardExistsModel({
    required this.message,
    required this.isError,
    required this.data,
  });
  late final String message;
  late final bool isError;
  late final Data data;
  
  IsPrivilegeCardExistsModel.fromJson(Map<String, dynamic> json){
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
    required this.fullname,
    required this.privileCardExists,
    required this.privilegeCardNumber,
  });
  late final String fullname;
  late final bool privileCardExists;
  late final String privilegeCardNumber;
  
  Data.fromJson(Map<String, dynamic> json){
    fullname = json['fullname'];
    privileCardExists = json['privileCardExists'];
    privilegeCardNumber = json['privilegeCardNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullname'] = fullname;
    _data['privileCardExists'] = privileCardExists;
    _data['privilegeCardNumber'] = privilegeCardNumber;
    return _data;
  }
}