class RpcInvestmentResponseModel {
  RpcInvestmentResponseModel({
    required this.message,
    required this.isError,
    required this.data,
  });
  late final String message;
  late final bool isError;
  late final Data data;
  
  RpcInvestmentResponseModel.fromJson(Map<String, dynamic> json){
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
  Data();
  
  Data.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}