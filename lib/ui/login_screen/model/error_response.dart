class ErrorResponse {
  ErrorResponse({
     this.message,
     this.error,
     this.errors,
  });
  String? message;
  bool? error;
  List<Errors>? errors;

  ErrorResponse.fromJson(Map<String, dynamic> json){
    message = json['message']??'';
    error = json['error']??false;
    errors = List.from(json['errors']).map((e)=>Errors.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['error'] = error;
    _data['errors'] = errors!.map((e)=>e.toJson()).toList()??[];
    return _data;
  }
}

class Errors {
  Errors({
     this.value,
     this.msg,
     this.param,
     this.location,
  });
   String? value;
   String? msg;
   String? param;
   String? location;

  Errors.fromJson(Map<String, dynamic> json){
    value = json['value']??'';
    msg = json['msg']??'';
    param = json['param']??'';
    location = json['location']??'';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['msg'] = msg;
    _data['param'] = param;
    _data['location'] = location;
    return _data;
  }
}