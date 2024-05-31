import 'package:intl/intl.dart';

class RfcModel {
  RfcModel({
    this.payments,
  });
  List<DataRequest>? payments;

  RfcModel.fromJson(Map<String, dynamic> json){
    payments = List.from(json['payments']).map((e)=>DataRequest.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['payments'] = payments?.map((e)=>e.toJson()).toList();
    return data;
  }
}
class Product {
  String date;
  int amount;

  Product(this.date, this.amount);
}

class DataRequest {
  DataRequest({
    required this.date,
    required this.amount,
  });
  late String date;
  late int amount;
  
  DataRequest.fromJson(Map<String, dynamic> json){
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