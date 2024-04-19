import 'package:intl/intl.dart';

class InvoiceModel {
  InvoiceModel({
    required this.message,
    required this.isError,
    required this.data,
  });
  late final String message;
  late final bool isError;
  late final Data data;

  InvoiceModel.fromJson(Map<String, dynamic> json) {
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
    required this.payment,
    required this.instalment,
    required this.plan,
    required this.clubId,
  });
  late final Payment payment;
  late final Instalment instalment;
  late final String plan;
  late final String clubId;

  Data.fromJson(Map<String, dynamic> json) {
    payment = Payment.fromJson(json['payment']);
    instalment = Instalment.fromJson(json['instalment']);
    plan = json['plan'];
    clubId = json['clubId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['payment'] = payment.toJson();
    _data['instalment'] = instalment.toJson();
    _data['plan'] = plan;
    _data['clubId'] = clubId;
    return _data;
  }
}

class Payment {
  Payment({
    required this.id,
    required this.invoiceNumber,
    required this.userId,
    required this.amount,
    required this.paymentFor,
    required this.paymentMethod,
    required this.paymentType,
    required this.transactionReference,
    required this.instalmentId,
    required this.status,
    required this.transactionDate,
    required this.acknowledgementDate,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String? id;
  late final String? invoiceNumber;
  late final String? userId;
  late final int amount;
  late final String? paymentFor;
  late final String? paymentMethod;
  late final String? paymentType;
  late final String? transactionReference;
  late final String? instalmentId;
  late final String? status;
  late final String? transactionDate;
  late final String? acknowledgementDate;
  late final String? createdAt;
  late final String? updatedAt;
  late final int V;
  String? acknowledgementDateChange() {
     if(acknowledgementDate==null){
return '';
    }
    var formatterDate = DateFormat('dd-MM-yyyy');
    // var formatterTime = DateFormat('kk:mm');
    var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ');
    var inputDate = inputFormat.parse(acknowledgementDate.toString());

    String actualDate = formatterDate.format(inputDate);
    return actualDate.toString();
  }

String? transactionDateChange() {
    if(transactionDate==null){
return '';
    }
    var formatterDate = DateFormat('dd-MM-yyyy');
    // var formatterTime = DateFormat('kk:mm');
    var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ');
    var inputDate = inputFormat.parse(transactionDate.toString());

    String actualDate = formatterDate.format(inputDate);
    return actualDate.toString();
  }
  Payment.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    invoiceNumber = json['invoiceNumber'];
    userId = json['userId'];
    amount = json['amount'];
    paymentFor = json['paymentFor'];
    paymentMethod = json['paymentMethod'];
    paymentType = json['paymentType'];
    transactionReference = json['transactionReference'];
    instalmentId = json['instalmentId'];
    status = json['status'];
    transactionDate = json['transactionDate'];
    acknowledgementDate = json['acknowledgementDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['invoiceNumber'] = invoiceNumber;
    _data['userId'] = userId;
    _data['amount'] = amount;
    _data['paymentFor'] = paymentFor;
    _data['paymentMethod'] = paymentMethod;
    _data['paymentType'] = paymentType;
    _data['transactionReference'] = transactionReference;
    _data['instalmentId'] = instalmentId;
    _data['status'] = status;
    _data['transactionDate'] = transactionDate;
    _data['acknowledgementDate'] = acknowledgementDate;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}

class Instalment {
  Instalment({
    required this.date,
    required this.amount,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.invoiceNumber,
    required this.paymentDate,
  });
  late final String date;
  late final int amount;
  late final String status;
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final String invoiceNumber;
  late final String paymentDate;
 
  Instalment.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    amount = json['amount'];
    status = json['status'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    invoiceNumber = json['invoiceNumber'];
    paymentDate = json['paymentDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['amount'] = amount;
    _data['status'] = status;
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['invoiceNumber'] = invoiceNumber;
    _data['paymentDate'] = paymentDate;
    return _data;
  }
}
