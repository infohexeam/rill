import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rill_repository/ui/investment/model/rfcInstallmentDetailsModel.dart';
import 'package:rill_repository/ui/investment/model/rfcInvestmentRequestModel.dart';
import 'package:rill_repository/ui/investment/model/rpcInstallmentDetailsModel.dart';
import 'package:rill_repository/ui/investment/model/rpcInvestmentRequestModel.dart';

import '../../../Utils/app_routes.dart';
import '../../../Utils/colors_list.dart';
import '../../../Utils/network_handler.dart';
import '../model/investment_statusModel.dart';
import '../model/invoiceModel.dart';
import '../model/paymentStatusRpc.dart';
import '../model/rfcInvestment_ResponseModel.dart';
import '../model/rfc_one_time_model.dart';
import '../model/rpcInvestment_ResponseModel.dart';
import '../model/paymentStatusRfc.dart';
import 'package:http/http.dart' as http;

class InvestmentFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InvestmentFormController());
  }
}

class InvestmentFormController extends GetxController {
  static InvestmentFormController get to => Get.find();
  TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> controllers = [
    TextEditingController(),TextEditingController(),TextEditingController(),
    TextEditingController(),TextEditingController(),TextEditingController(),
    TextEditingController(),TextEditingController(),TextEditingController(),
    TextEditingController(),TextEditingController(),TextEditingController(),
  ];

  List<DateTime> dates = [
    DateTime.now(),
    DateTime.now().add(Duration(days: 30)),
    DateTime.now().add(Duration(days: 60)),
    DateTime.now().add(Duration(days: 90)),
    DateTime.now().add(Duration(days: 120)),
    DateTime.now().add(Duration(days: 150)),
    DateTime.now().add(Duration(days: 180)),
    DateTime.now().add(Duration(days: 210)),
    DateTime.now().add(Duration(days: 240)),
    DateTime.now().add(Duration(days: 270)),
    DateTime.now().add(Duration(days: 300)),
    DateTime.now().add(Duration(days: 320)),
  ];
  List<DateTime> datesRpc = [
    DateTime.now(),
    DateTime.now().add(Duration(days: 30)),
    DateTime.now().add(Duration(days: 60)),
    DateTime.now().add(Duration(days: 90)),
    DateTime.now().add(Duration(days: 120)),
    DateTime.now().add(Duration(days: 150)),
  ];


  RxInt installments1 = 2.obs;
  RxInt installments2 = 2.obs;
  var theChangedValue = "State".obs;

  RxInt notificationCount = 0.obs;
  RxInt rpcnotificationCount = 0.obs;
  RxInt rfcnotificationCount = 0.obs;

  var theChangeValue = "Relation with nominee".obs;

  List relation = [
    "FATHER",
    "MOTHER",
    "SPOUSE",
    "BROTHER",
    "SISTER",
    "SON",
    "DAUGHTER"
  ].obs;
  List states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra	",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu	",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra & Nagar Haveli",
    "Daman & Diu",
    "Delhi",
    "Jammu and Kashmir",
    "Ladakh",
    "Lakshadweep",
    "Puducherry",
  ].obs;

  InvoiceModel? invoiceModel;
  var paymentList;
  List<DataRequest> paymentStatus = [];
  List<int> paymentAmount = [];
  List<int> paymentAmountRpc = [];
  List<Product> products = [];
  List<DataRequestRpc> paymentStatusRpc = [];
  int listCount = 2;
  int listCountRpc = 2;
  // List<RfcOneTimeModel> rfcModel = [];
  // RfcOneTimeModel rfcOneTimeModelItems = RfcOneTimeModel();
  List<RfcPayments> payments = [];
  static final client = http.Client();
  void addTypes(String date, int amount) {
    paymentStatus.add(DataRequest(date: date, amount: amount));
  }

  void addRfc(String date, int amount) {
    payments.add(RfcPayments(date: date, amount: amount));
  }

  void addRfcMultiple(String date, int amount) {
    paymentList = RfcPayments(amount: amount, date: date);
    payments.insert(0, paymentList);
    update();
    // RfcOneTimeModel rfcOneTimeModelItems = RfcOneTimeModel();

    // final decodeJson = jsonEncode(rfcOneTimeModelItems);
    // rfcOneTimeModelItems.payments = paymentList as List<Payments>?;
    // payments.add(Payments(date: date, amount: amount));
    // print("RFC Json:::${decodeJson.toString()}");
    // print("object list : ${payments.}");
  }

  static Uri buildUrl(String endpoint) {
    String host = NetWorkHandler.baseUrl;
    final apiPath = host + endpoint;
    if (kDebugMode) {
      // print(apiPath.toString());
    }
    return Uri.parse(apiPath);
  }

  InvestmentStatusModel? investmentStatusModel;
  RfcInstallmentDetailsModel? rfcInstallmentModel;
  RpcInstallmentDetailsModel? rpcInstallmentModel;
  // GetRpClubDetails? getRPClubDetails;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    investmentStatus();
    rfcInstallmentsDetails();
    rpcClubDetails();
    getnotificationcount();
  }

  // --------------------------------------------------------------------------------------------------------
  int getnotificationcount() {
    var rfcCount=rfcInstallmentModel?.data.data[0].payments
              .where((element) => element.isDue)
              .length??0;
              var rpcCount=rpcInstallmentModel?.data.data[0].payments
              .where((element) => element.isDue)
              .length ??
          0;
    return rfcCount+rpcCount;
  }

  //TODO RPC SINGLE
  void rpcSingle(BuildContext context, String date, int amount) async {
    var data = RfcPayments(amount: amount, date: date);
    payments.add(data);
    final rpcSigleTime = jsonEncode({
      "contributionAmount": amount,
      "payments": [data]
    });
    print("Encode data::::${rpcSigleTime.toString()}");
    postRpcSigleTime(context, rpcSigleTime);
    update();
  }

  void postRpcSigleTime(BuildContext context, var json) async {
    // try {
    var response = await NetWorkHandler.postToken(json, 'investment/user/rpc');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      rpcClubDetails();
      Get.toNamed(Routes.clubdetailsRpc);
      print("Response::: ${data["isError"]}");
      update();
    } else {
      final snackBar = SnackBar(
        backgroundColor: primaryColor,
        content: Text(
          data["message"].toString() ?? '',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // print(jsonEncode(RfcOneTimeModel()));
    }
  }

  // --------------------------------------------------------------------------------------------------------

  //TODO RFC SINGLE
  void rfcSingle(BuildContext context, String date, int amount) async {
    var data = RfcPayments(amount: amount, date: date);
    payments.add(data);
    final rfcSigleTime = jsonEncode({
      "payments": [data]
    });
    print("Encode data::::${rfcSigleTime.toString()}");
    postRfcSigleTime(context, rfcSigleTime);
    update();
  }

  void postRfcSigleTime(BuildContext context, var json) async {
    // try {
    var response = await NetWorkHandler.postToken(json, 'investment/user/rfc');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      rfcInstallmentsDetails();
      Get.toNamed(Routes.clubdetails);
      print("Response::: ${data["isError"]}");
      update();
    } else {
      final snackBar = SnackBar(
        backgroundColor: primaryColor,
        content: Text(
          data["message"].toString() ?? '',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // print(jsonEncode(RfcOneTimeModel()));
    }
  }
  // --------------------------------------------------------------------------------------------------------

  //TODO RFC MULTIPLE
  void rfcMultiple(BuildContext context) async {
    final rfcMultiple = jsonEncode({"payments": paymentStatus});
    print("Encode data::::${rfcMultiple.toString()}");
    postRfcMultiple(context, rfcMultiple);
    update();
  }

  void postRfcMultiple(BuildContext context, var json) async {
    // try {
    var response = await NetWorkHandler.postToken(json, 'investment/user/rfc');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      rfcInstallmentsDetails();
      Get.offNamed(Routes.clubdetails);
      print("Response::: ${data["isError"]}");
      update();
    } else {
      final snackBar = SnackBar(
        backgroundColor: primaryColor,
        content: Text(
          data["message"].toString() ?? '',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // print(jsonEncode(RfcOneTimeModel()));
    }
  }
// --------------------------------------------------------------------------------------------------------

  //TODO RPC MULTIPLE
  void rpcMultiple(BuildContext context, double contributionAmount) async {
    final rpcMultiple = jsonEncode({
      "contributionAmount": contributionAmount,
      "payments": paymentStatusRpc
    });
    print("Encode data::::${rpcMultiple.toString()}");
    postRpcMultiple(context, rpcMultiple);
    update();
  }

  void postRpcMultiple(BuildContext context, var json) async {
    // try {
    var response = await NetWorkHandler.postToken(json, 'investment/user/rpc');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      rpcClubDetails();
      Get.toNamed(Routes.clubdetailsRpc);
      print("Response::: ${data["isError"]}");
      update();
    } else {
      final snackBar = SnackBar(
        backgroundColor: primaryColor,
        content: Text(
          data["message"].toString() ?? '',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // print(jsonEncode(RfcOneTimeModel()));
    }
  }

  void investmentStatus() async {
    try {
      var response = await NetWorkHandler.get('investment/user/plans');
      var data = jsonDecode(response);
      if (data["isError"] == false) {
        investmentStatusModel = InvestmentStatusModel.fromJson(data);
        print("Response::: ${data["isError"]}");
        update();
      }
    } catch (e) {
      print("Error Logout ::: $e");
    }
  }

  void rpcInstallmentsDetails() async {
    try {
      var response = await NetWorkHandler.get('investment/user/plans');
      var data = jsonDecode(response);
      if (data["isError"] == false) {
        investmentStatusModel = InvestmentStatusModel.fromJson(data);
        print("Response::: ${data["isError"]}");
        update();
      }
    } catch (e) {
      print("Error Logout ::: $e");
    }
  }

  void rfcInstallmentsDetails() async {
    // try {
    var response = await NetWorkHandler.get('investment/user/rfc');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      rfcInstallmentModel = RfcInstallmentDetailsModel.fromJson(data);
      // rfcpending.value=rfcInstallmentModel.data.data[0].
      rfcnotificationCount.value += rfcInstallmentModel?.data.data[0].payments
              .where((element) => element.isDue)
              .length ??
          0;
      notificationCount.value += rfcInstallmentModel?.data.data[0].payments
              .where((element) => element.isDue)
              .length ??
          0;

      print("Response::: ${data["isError"]}");

      update();
    }
  }

  void rpcClubDetails() async {
    // try {
    var response = await NetWorkHandler.get('investment/user/rpc');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      rpcInstallmentModel = RpcInstallmentDetailsModel.fromJson(data);
      rpcnotificationCount.value += rpcInstallmentModel?.data.data[0].payments
              .where((element) => element.isDue)
              .length ??
          0;
      notificationCount.value += rpcInstallmentModel?.data.data[0].payments
              .where((element) => element.isDue)
              .length ??
          0;
      print("Response::: ${data["isError"]}");
      update();
    }
  }

  void addRpcInvestment() async {
    try {
      RpcInvestmentRequestModel addrpcModel = RpcInvestmentRequestModel(
          // amount: dobController.text,
          // date: fatherNameController.text,
          );
      var response = await NetWorkHandler.postToken(
        rpcInvestmentRequestModelToJson(addrpcModel),
        'investment/user/rpc',
      );
      var data = jsonDecode(response);

      if (data["error"] == false) {
        var actualresponse = RpcInvestmentResponseModel.fromJson(data);
        update();
      } else {}
    } catch (e) {
      print("Error Logout ::: $e");
    }
  }

  void addRfcInvestment() async {
    try {
      RfcInvestmentRequestModel addrfcModel = RfcInvestmentRequestModel(
          // amount: dobController.text,
          // date: fatherNameController.text,
          );
      var response = await NetWorkHandler.postToken(
          rfcInvestmentRequestModelToJson(addrfcModel), 'investment/user/rfc');
      var data = jsonDecode(response);

      if (data["error"] == false) {
        var actualresponse = RfcInvestmentResponseModel.fromJson(data);
        update();
      } else {}
    } catch (e) {
      print("Error Logout ::: $e");
    }
  }

  void viewInvoice(String invoiceNo, String userId) async {
    // try {
    var response = await NetWorkHandler.get(
        'payment/user?invoiceNumber=$invoiceNo&userId=$userId');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      invoiceModel = InvoiceModel.fromJson(data);
      print("Response::: ${data["isError"]}");
      update();
    }
  }
}
