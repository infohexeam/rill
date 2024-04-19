class InstallmentSummary {
  InstallmentSummary({
    required this.message,
    required this.isError,
    required this.datas,
  });
  late final String message;
  late final bool isError;
  late final Datas? datas;
  
  InstallmentSummary.fromJson(Map<String, dynamic> json){
    message = json['message'];
    isError = json['isError'];
    datas = Datas?.fromJson(json['datas']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['isError'] = isError;
    _data['datas'] = datas?.toJson();
    return _data;
  }
}

class Datas {
  Datas({
    required this.data,
  });
  late final Data data;
  
  Datas.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.rfc,
    required this.rpc,
  });
  late final Rfc? rfc;
  late final Rpc? rpc;
  
  Data.fromJson(Map<String, dynamic> json){
    rfc = Rfc.fromJson(json['rfc']);
    rpc = Rpc.fromJson(json['rpc']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rfc'] = rfc?.toJson();
    _data['rpc'] = rpc?.toJson();
    return _data;
  }
}

class Rfc {
  Rfc({
    required this.paymentsCompleted,
    required this.totalCommitted,
    required this.completed,
    required this.pending,
    required this.due,
    required this.status,
  });
  late final bool? paymentsCompleted;
  late final int? totalCommitted;
  late final int? completed;
  late final int? pending;
  late final Due? due;
  late final bool? status;
  
  Rfc.fromJson(Map<String, dynamic> json){
    paymentsCompleted = json['paymentsCompleted'];
    totalCommitted = json['totalCommitted'];
    completed = json['completed'];
    pending = json['pending'];
    due = Due.fromJson(json['due']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['paymentsCompleted'] = paymentsCompleted;
    _data['totalCommitted'] = totalCommitted;
    _data['completed'] = completed;
    _data['pending'] = pending;
    _data['due'] = due?.toJson();
    _data['status'] = status;
    return _data;
  }
}

class Due {
  Due({
    required this.amount,
    required this.count,
  });
  late final int? amount;
  late final int? count;
  
  Due.fromJson(Map<String, dynamic> json){
    amount = json['amount'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['count'] = count;
    return _data;
  }
}

class Rpc {
  Rpc({
    required this.status,
  });
  late final bool? status;
  
  Rpc.fromJson(Map<String, dynamic> json){
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    return _data;
  }
}