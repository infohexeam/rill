import 'package:intl/intl.dart';

class RpcModel {
  RpcModel({
    this.payments,
  });
  List<DataRequestRpc>? payments;

  RpcModel.fromJson(Map<String, dynamic> json){
    payments = List.from(json['payments']).map((e)=>DataRequestRpc.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['payments'] = payments?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class DataRequestRpc {
  DataRequestRpc({
    required this.date,
    required this.amount,
  });
  late final String date;
  late final int amount;

  DataRequestRpc.fromJson(Map<String, dynamic> json){
    date = json['date'];
    amount = json['amount'];
  }
  String? dateChange() {
    var formatterDate = DateFormat('dd-MM-yyyy');
    // var formatterTime = DateFormat('kk:mm');
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date.toString());

    String actualDate = formatterDate.format(inputDate);
    return actualDate.toString();
  }


  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['amount'] = amount;
    return data;
  }
}