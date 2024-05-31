import 'package:intl/intl.dart';

class RfcOneTimeMode {
  RfcOneTimeMode({
     this.payments,
  });
  List<RfcPayments>? payments;

  RfcOneTimeMode.fromJson(Map<String, dynamic> json){
    payments = List.from(json['payments']).map((e)=>RfcPayments.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['payments'] = payments?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class RfcPayments {
  RfcPayments({
     this.amount,
     this.date,
  });
   int? amount;
   String? date;

  RfcPayments.fromJson(Map<String, dynamic> json){
    amount = json['amount'];
    date = json['date'];
  }
  String? dateChange() {
    if(date==null){
      return '';
    }
    var formatterDate = DateFormat('dd-MM-yyyy');
    // var formatterTime = DateFormat('kk:mm');
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date.toString());

    String actualDate = formatterDate.format(inputDate);
    return actualDate.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['date'] = date;
    return data;
  }
}